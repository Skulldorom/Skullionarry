-- @operation: export
-- @entity: batch
-- @name: Skullionarry Custom Config
-- @exportedAt: 2026-05-26T20:20:44.763Z
-- @opIds: 1597, 1598, 1599, 1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610, 1611, 1612, 1613, 1614

-- --- BEGIN op 1597 ( update delay_profile "Default Delay" )
update "delay_profiles" set "usenet_delay" = 10 where "name" = 'Default Delay' and "usenet_delay" = 60;
-- --- END op 1597

-- --- BEGIN op 1598 ( update delay_profile "Default Delay" )
update "delay_profiles" set "torrent_delay" = 10 where "name" = 'Default Delay' and "torrent_delay" = 60;
-- --- END op 1598

-- --- BEGIN op 1599 ( create delay_profile "Movie Delay" )
insert into "delay_profiles" ("name", "preferred_protocol", "usenet_delay", "torrent_delay", "bypass_if_highest_quality", "bypass_if_above_custom_format_score", "minimum_custom_format_score") values ('Movie Delay', 'prefer_usenet', 60, 60, 0, 0, NULL);
-- --- END op 1599

-- --- BEGIN op 1600 ( update radarr_naming "Default" )
update "radarr_naming" set "movie_format" = '{Movie CleanTitle} {(Release Year)} - {{Edition Tags}} {[MediaInfo 3D]}{[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo VideoCodec]}{-Release Group}' where "name" = 'Radarr' and "movie_format" = '{Movie CleanTitle} {(Release Year)} {tmdb-{TmdbId}} {edition-{Edition Tags}} {[Custom Formats]}{[Quality Full]}{[MediaInfo 3D]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[Mediainfo VideoCodec]}{-Release Group}';
-- --- END op 1600

-- --- BEGIN op 1601 ( update radarr_naming "Default" )
update "radarr_naming" set "movie_folder_format" = '{Movie CleanTitle} ({Release Year})' where "name" = 'Radarr' and "movie_folder_format" = '{Movie CleanTitle} ({Release Year}) {tmdb-{TmdbId}}';
-- --- END op 1601

-- --- BEGIN op 1602 ( update radarr_naming "Default" )
update "radarr_naming" set "name" = 'Default' where "name" = 'Radarr';
-- --- END op 1602

-- --- BEGIN op 1603 ( update sonarr_naming "Default" )
update "sonarr_naming" set "standard_episode_format" = '{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo VideoCodec]}{-Release Group}' where "name" = 'Sonarr' and "standard_episode_format" = '{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}';
-- --- END op 1603

-- --- BEGIN op 1604 ( update sonarr_naming "Default" )
update "sonarr_naming" set "daily_episode_format" = '{Series TitleYear} - {Air-Date} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo VideoCodec]}{-Release Group}{Series CleanTitle}' where "name" = 'Sonarr' and "daily_episode_format" = '{Series TitleYear} - {Air-Date} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}';
-- --- END op 1604

-- --- BEGIN op 1605 ( update sonarr_naming "Default" )
update "sonarr_naming" set "series_folder_format" = '{Series TitleYear}' where "name" = 'Sonarr' and "series_folder_format" = '{Series TitleYear} {tvdb-{TvdbId}}';
-- --- END op 1605

-- --- BEGIN op 1606 ( update sonarr_naming "Default" )
update "sonarr_naming" set "name" = 'Default' where "name" = 'Sonarr';
-- --- END op 1606

-- --- BEGIN op 1607 ( create regular_expression "Allowed LQ" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Allowed LQ', '^(YIFY|YTS(\.(MX|LT|AG))?)$', 'Allows YTS and YIFY', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Allowed LQ', 'Release Group');
-- --- END op 1607

-- --- BEGIN op 1608 ( create custom_format "Allowed LQ" )
insert into "custom_formats" ("name", "description") values ('Allowed LQ', '');
-- --- END op 1608

-- --- BEGIN op 1609 ( update custom_format "Allowed LQ" )
update "custom_formats" set "description" = 'Allows the following that are banned in TRaSH LQ groups
- YIFY
- YTS' where "name" = 'Allowed LQ' and "description" = '';
-- --- END op 1609

-- --- BEGIN op 1610 ( update custom_format "Allowed LQ" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'Allowed LQ' and "include_in_rename" = 0;
-- --- END op 1610

-- --- BEGIN op 1611 ( update custom_format "Allowed LQ" )
insert into "tags" ("name") values ('Allowed LQ') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Allowed LQ', 'Allowed LQ');

insert into "tags" ("name") values ('Wanted') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Allowed LQ', 'Wanted');
-- --- END op 1611

-- --- BEGIN op 1612 ( update custom_format "Allowed LQ" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Allowed LQ', 'Allowed LQ', 'release_group', 'radarr', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Allowed LQ', 'Allowed LQ', 'Allowed LQ');
-- --- END op 1612

-- --- BEGIN op 1613 ( update quality_profile "Movies 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Movies 1080p', 'Allowed LQ', 'radarr', 10750
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Movies 1080p'
    AND custom_format_name = 'Allowed LQ'
    AND arr_type = 'radarr'
);
-- --- END op 1613

-- --- BEGIN op 1614 ( update custom_format "Allowed LQ" )
update "custom_formats" set "include_in_rename" = 0 where "name" = 'Allowed LQ' and "include_in_rename" = 1;
-- --- END op 1614
