-- @operation: export
-- @entity: batch
-- @name: Multi Lang Anime fix
-- @exportedAt: 2026-09-13T09:04:00.360Z
-- @opIds: 2092

-- --- BEGIN op 2092 ( update regular_expression "Multi/foreign Audio" )
update "regular_expressions" set "pattern" = '(?i)\b(?:ES|ESP|SPA|LAT|GER|DEU|FRE|FRA|ITA|POR|RUS)\b' where "name" = 'Multi/foreign Audio' and "pattern" = '(?i)\b(?:Multi[\s._-]?Audio|Dual[\s._-]?Audio|ES|ESP|SPA|LAT|GER|DEU|FRE|FRA|ITA|POR|RUS)\b';
-- --- END op 2092
