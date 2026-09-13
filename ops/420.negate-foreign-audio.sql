-- @operation: export
-- @entity: batch
-- @name: Negate Foreign audio
-- @exportedAt: 2026-09-13T09:01:13.865Z
-- @opIds: 2080, 2081, 2082, 2084, 2085, 2086, 2087, 2088, 2089, 2090

-- --- BEGIN op 2080 ( create regular_expression "Multi/foreign Audio" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Multi/foreign Audio', '(?i)\b(?:Multi[\s._-]?Audio|Dual[\s._-]?Audio|ES|ESP|SPA|LAT|GER|DEU|FRE|FRA|ITA|POR|RUS)\b', 'Multi/foreign audio advertised', NULL);

insert into "tags" ("name") values ('Anime') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Multi/foreign Audio', 'Anime');
-- --- END op 2080

-- --- BEGIN op 2081 ( create custom_format "Anime Foreign Audio" )
insert into "custom_formats" ("name", "description") values ('Anime Foreign Audio', '');
-- --- END op 2081

-- --- BEGIN op 2082 ( update custom_format "Anime Foreign Audio" )
update "custom_formats" set "description" = 'Blocks Original Language + Non english' where "name" = 'Anime Foreign Audio' and "description" = '';
-- --- END op 2082

-- --- BEGIN op 2084 ( update custom_format "Anime Foreign Audio" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Anime Foreign Audio', 'Multi/foreign audio', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Foreign Audio', 'Multi/foreign audio', 'Multi/foreign Audio');
-- --- END op 2084

-- --- BEGIN op 2085 ( create regular_expression "English Audio" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('English Audio', '\b(?:JA|JP|JPN|ZH|CHI|CHN|KO|KR|KOR)\s*[+&]\s*(?:EN|ENG)\b|\b(?:EN|ENG)\s*[+&]\s*(?:JA|JP|JPN|ZH|CHI|CHN|KO|KR|KOR)\b|\b(?:Japanese|Chinese|Korean)\s*[+&-]\s*English\b|\bEnglish\s*[+&-]\s*(?:Japanese|Chinese|Korean)\b', 'Original + English Audio Release Title', NULL);

insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('English Audio', 'Release Title');
-- --- END op 2085

-- --- BEGIN op 2086 ( update regular_expression "English Audio" )
update "regular_expressions" set "description" = 'English Audio Release Title' where "name" = 'English Audio' and "description" = 'Original + English Audio Release Title';
-- --- END op 2086

-- --- BEGIN op 2087 ( update regular_expression "English Audio" )
update "regular_expressions" set "pattern" = '(?i)\b(?:EN|ENG|English)\b' where "name" = 'English Audio' and "pattern" = '\b(?:JA|JP|JPN|ZH|CHI|CHN|KO|KR|KOR)\s*[+&]\s*(?:EN|ENG)\b|\b(?:EN|ENG)\s*[+&]\s*(?:JA|JP|JPN|ZH|CHI|CHN|KO|KR|KOR)\b|\b(?:Japanese|Chinese|Korean)\s*[+&-]\s*English\b|\bEnglish\s*[+&-]\s*(?:Japanese|Chinese|Korean)\b';
-- --- END op 2087

-- --- BEGIN op 2088 ( update custom_format "Anime Foreign Audio" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Anime Foreign Audio', 'English Audio', 'release_title', 'all', 1, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Foreign Audio', 'English Audio', 'English Audio');
-- --- END op 2088

-- --- BEGIN op 2089 ( update quality_profile "Anime 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Anime 1080p', 'Anime Foreign Audio', 'radarr', -10000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Anime 1080p'
    AND custom_format_name = 'Anime Foreign Audio'
    AND arr_type = 'radarr'
);
-- --- END op 2089

-- --- BEGIN op 2090 ( update quality_profile "Anime 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Anime 1080p', 'Anime Foreign Audio', 'sonarr', -10000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Anime 1080p'
    AND custom_format_name = 'Anime Foreign Audio'
    AND arr_type = 'sonarr'
);
-- --- END op 2090
