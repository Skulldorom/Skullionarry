-- @operation: export
-- @entity: batch
-- @name: Main Delay
-- @exportedAt: 2026-05-26T19:42:49.617Z
-- @opIds: 1347

-- --- BEGIN op 1347 ( create delay_profile "Main Delay" )
insert into "delay_profiles" ("name", "preferred_protocol", "usenet_delay", "torrent_delay", "bypass_if_highest_quality", "bypass_if_above_custom_format_score", "minimum_custom_format_score") values ('Main Delay', 'prefer_usenet', 10, 10, 0, 0, NULL);
-- --- END op 1347
