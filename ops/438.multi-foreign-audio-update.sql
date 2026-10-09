-- @operation: export
-- @entity: batch
-- @name: Multi/foreign Audio update
-- @exportedAt: 2026-10-09T17:38:53.314Z
-- @opIds: 2132

-- --- BEGIN op 2132 ( update regular_expression "Multi/foreign Audio" )
update "regular_expressions" set "pattern" = '(?i)\b(?:DE|GER|DEU|FR|FRE|FRA|ES|ESP|SPA|LAT|IT|ITA|PT|POR|RU|RUS|PL|POL|NL|DUT|NLD|UA|UKR|TR|TUR|AR|ARA|HI|HIN)\b' where "name" = 'Multi/foreign Audio' and "pattern" = '(?i)\b(?:ES|ESP|SPA|LAT|GER|DEU|FRE|FRA|ITA|POR|RUS)\b';
-- --- END op 2132
