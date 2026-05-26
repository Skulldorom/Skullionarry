#!/usr/bin/env python3
"""
Sync new files from Dumpstarr/Database stable/ops into the local ops/ directory.

Rules:
- Only pull files whose upstream sequence number is greater than
  `last_pulled_upstream_number` stored in .github/upstream-sync-state.json.
- Re-number each imported file by incrementing from the current local maximum,
  so that no two files in ops/ ever share the same leading number.
- After a successful sync the state file is updated with the highest upstream
  number that was pulled.
"""

import json
import os
import re
import sys
import urllib.request
import urllib.error

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
UPSTREAM_OWNER = "Dumpstarr"
UPSTREAM_REPO = "Database"
UPSTREAM_BRANCH = "stable"
UPSTREAM_PATH = "ops"

REPO_ROOT = os.path.join(os.path.dirname(__file__), "..", "..")
LOCAL_OPS_DIR = os.path.join(REPO_ROOT, "ops")
STATE_FILE = os.path.join(REPO_ROOT, ".github", "upstream-sync-state.json")

GITHUB_API_BASE = "https://api.github.com"
GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN", "")

NUMBER_RE = re.compile(r"^(\d+)\.(.*)")


def api_headers():
    headers = {"Accept": "application/vnd.github+json", "X-GitHub-Api-Version": "2022-11-28"}
    if GITHUB_TOKEN:
        headers["Authorization"] = "Bearer " + GITHUB_TOKEN
    return headers


def api_get(url):
    req = urllib.request.Request(url, headers=api_headers())
    with urllib.request.urlopen(req) as resp:
        return json.loads(resp.read().decode())


def list_upstream_files():
    """Return a list of (number, name) for all files in the upstream ops dir."""
    url = (
        f"{GITHUB_API_BASE}/repos/{UPSTREAM_OWNER}/{UPSTREAM_REPO}"
        f"/contents/{UPSTREAM_PATH}?ref={UPSTREAM_BRANCH}"
    )
    entries = api_get(url)
    files = []
    for entry in entries:
        if entry.get("type") != "file":
            continue
        m = NUMBER_RE.match(entry["name"])
        if m:
            files.append((int(m.group(1)), entry["name"], entry["download_url"]))
    return sorted(files, key=lambda x: x[0])


def local_max_number():
    """Return the highest leading number among files currently in ops/."""
    max_num = 0
    for fname in os.listdir(LOCAL_OPS_DIR):
        m = NUMBER_RE.match(fname)
        if m:
            max_num = max(max_num, int(m.group(1)))
    return max_num


def load_state():
    with open(STATE_FILE) as f:
        return json.load(f)


def save_state(state):
    with open(STATE_FILE, "w") as f:
        json.dump(state, f, indent=2)
        f.write("\n")


def download_text(url):
    req = urllib.request.Request(url, headers=api_headers())
    with urllib.request.urlopen(req) as resp:
        return resp.read()


def main():
    state = load_state()
    last_pulled = state["last_pulled_upstream_number"]

    upstream_files = list_upstream_files()
    new_upstream = [(num, name, dl) for num, name, dl in upstream_files if num > last_pulled]

    if not new_upstream:
        print(f"No new upstream files found (last pulled: {last_pulled}).")
        return 0

    current_local_max = local_max_number()
    print(f"Last pulled upstream number : {last_pulled}")
    print(f"Current local max number    : {current_local_max}")
    print(f"New upstream files to import: {len(new_upstream)}")

    highest_upstream_pulled = last_pulled

    for upstream_num, upstream_name, download_url in new_upstream:
        # Strip the upstream leading number, keep everything after the first dot
        m = NUMBER_RE.match(upstream_name)
        suffix = m.group(2)  # e.g. "added-something.sql"

        current_local_max += 1
        new_local_name = f"{current_local_max}.{suffix}"
        dest_path = os.path.join(LOCAL_OPS_DIR, new_local_name)

        print(f"  {upstream_name}  ->  {new_local_name}")
        content = download_text(download_url)
        with open(dest_path, "wb") as f:
            f.write(content)

        highest_upstream_pulled = upstream_num

    # Update state
    state["last_pulled_upstream_number"] = highest_upstream_pulled
    save_state(state)
    print(f"State updated: last_pulled_upstream_number = {highest_upstream_pulled}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
