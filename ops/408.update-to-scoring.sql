-- @operation: export
-- @entity: batch
-- @name: Update to scoring
-- @exportedAt: 2026-09-04T19:29:50.373Z
-- @opIds: 2045, 2046, 2047, 2048, 2049, 2050

-- --- BEGIN op 2045 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 2000
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'radarr'
  AND score = 0;
-- --- END op 2045

-- --- BEGIN op 2046 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 2000
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'sonarr'
  AND score = 0;
-- --- END op 2046

-- --- BEGIN op 2047 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 100
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Original + English Audio'
  AND arr_type = 'radarr'
  AND score = 2000;
-- --- END op 2047

-- --- BEGIN op 2048 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 100
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Original + English Audio'
  AND arr_type = 'sonarr'
  AND score = 2000;
-- --- END op 2048

-- --- BEGIN op 2049 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 2100
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Original + English Audio'
  AND arr_type = 'radarr'
  AND score = 100;
-- --- END op 2049

-- --- BEGIN op 2050 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 2100
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Original + English Audio'
  AND arr_type = 'sonarr'
  AND score = 100;
-- --- END op 2050
