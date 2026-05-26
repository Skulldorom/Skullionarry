-- @operation: export
-- @entity: batch
-- @name: Update dual audio to score 2000
-- @exportedAt: 2026-05-26T20:32:22.301Z
-- @opIds: 1616, 1617, 1618, 1619, 1620

-- --- BEGIN op 1616 ( update quality_profile "Anime 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Anime 1080p', 'Anime Dual Audio', 'radarr', 101
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Anime 1080p'
    AND custom_format_name = 'Anime Dual Audio'
    AND arr_type = 'radarr'
);
-- --- END op 1616

-- --- BEGIN op 1617 ( update quality_profile "Anime 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Anime 1080p', 'Anime Dual Audio', 'sonarr', 101
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Anime 1080p'
    AND custom_format_name = 'Anime Dual Audio'
    AND arr_type = 'sonarr'
);
-- --- END op 1617

-- --- BEGIN op 1618 ( update quality_profile "Anime 1080p" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'all'
  AND score = 101;
-- --- END op 1618

-- --- BEGIN op 1619 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 2000
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'radarr'
  AND score = 101;
-- --- END op 1619

-- --- BEGIN op 1620 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 2000
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'sonarr'
  AND score = 101;
-- --- END op 1620
