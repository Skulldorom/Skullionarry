-- @operation: export
-- @entity: batch
-- @name: Anime Audio
-- @exportedAt: 2026-09-04T19:18:36.477Z
-- @opIds: 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043

-- --- BEGIN op 2028 ( create custom_format "Anime Original + English Audio" )
insert into "custom_formats" ("name", "description") values ('Anime Original + English Audio', '');
-- --- END op 2028

-- --- BEGIN op 2029 ( update custom_format "Anime Original + English Audio" )
update "custom_formats" set "description" = 'Original Language + English Audio' where "name" = 'Anime Original + English Audio' and "description" = '';
-- --- END op 2029

-- --- BEGIN op 2030 ( create regular_expression "Original + English Audio" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Original + English Audio', '\b(?:JA|JP|JPN|ZH|CHI|CHN|KO|KR|KOR)\s*[+&]\s*(?:EN|ENG)\b|\b(?:EN|ENG)\s*[+&]\s*(?:JA|JP|JPN|ZH|CHI|CHN|KO|KR|KOR)\b|\b(?:Japanese|Chinese|Korean)\s*[+&-]\s*English\b|\bEnglish\s*[+&-]\s*(?:Japanese|Chinese|Korean)\b', 'Original + English Audio Release Title', NULL);
-- --- END op 2030

-- --- BEGIN op 2031 ( delete custom_format "Anime Original + English Audio" )
delete from "custom_formats" where "name" = 'Anime Original + English Audio';
-- --- END op 2031

-- --- BEGIN op 2032 ( update regular_expression "Original + English Audio" )
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Original + English Audio', 'Release Title');
-- --- END op 2032

-- --- BEGIN op 2033 ( create custom_format "Anime Original + English Audio" )
insert into "custom_formats" ("name", "description") values ('Anime Original + English Audio', '');
-- --- END op 2033

-- --- BEGIN op 2034 ( update custom_format "Anime Original + English Audio" )
update "custom_formats" set "description" = 'Anime Original + English Audio' where "name" = 'Anime Original + English Audio' and "description" = '';
-- --- END op 2034

-- --- BEGIN op 2035 ( update custom_format "Anime Original + English Audio" )
insert into "tags" ("name") values ('Audio') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Anime Original + English Audio', 'Audio');
-- --- END op 2035

-- --- BEGIN op 2036 ( update custom_format "Anime Original + English Audio" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Anime Original + English Audio', 'Original + English', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Original + English Audio', 'Original + English', 'Original + English Audio');
-- --- END op 2036

-- --- BEGIN op 2037 ( update custom_format "Anime Original + English Audio" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Anime Original + English Audio', 'Japanese', 'language', 'all', 0, 0);

INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Anime Original + English Audio', 'Japanese', 'Japanese', 0);
-- --- END op 2037

-- --- BEGIN op 2038 ( update custom_format "Anime Original + English Audio" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Anime Original + English Audio', 'Chinese', 'language', 'all', 0, 0);

INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Anime Original + English Audio', 'Chinese', 'Chinese', 0);
-- --- END op 2038

-- --- BEGIN op 2039 ( update custom_format "Anime Original + English Audio" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Anime Original + English Audio', 'Korean', 'language', 'all', 0, 0);

INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Anime Original + English Audio', 'Korean', 'Korean', 0);
-- --- END op 2039

-- --- BEGIN op 2040 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 0
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'radarr'
  AND score = 2000;
-- --- END op 2040

-- --- BEGIN op 2041 ( update quality_profile "Anime 1080p" )
UPDATE quality_profile_custom_formats
SET score = 0
WHERE quality_profile_name = 'Anime 1080p'
  AND custom_format_name = 'Anime Dual Audio'
  AND arr_type = 'sonarr'
  AND score = 2000;
-- --- END op 2041

-- --- BEGIN op 2042 ( update quality_profile "Anime 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Anime 1080p', 'Anime Original + English Audio', 'radarr', 2000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Anime 1080p'
    AND custom_format_name = 'Anime Original + English Audio'
    AND arr_type = 'radarr'
);
-- --- END op 2042

-- --- BEGIN op 2043 ( update quality_profile "Anime 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Anime 1080p', 'Anime Original + English Audio', 'sonarr', 2000
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Anime 1080p'
    AND custom_format_name = 'Anime Original + English Audio'
    AND arr_type = 'sonarr'
);
-- --- END op 2043
