-- @operation: export
-- @entity: batch
-- @name: reduce false positives
-- @exportedAt: 2026-10-09T17:40:32.357Z
-- @opIds: 2134

-- --- BEGIN op 2134 ( update regular_expression "Multi/foreign Audio" )
update "regular_expressions" set "pattern" = '(?i)\b(?:DE|GER|DEU|FR|FRE|FRA|ES|ESP|SPA|LAT|ITA|POR|RUS|POL|DUT|NLD|UKR|TUR|ARA|HIN)\b' where "name" = 'Multi/foreign Audio' and "pattern" = '(?i)\b(?:DE|GER|DEU|FR|FRE|FRA|ES|ESP|SPA|LAT|IT|ITA|PT|POR|RU|RUS|PL|POL|NL|DUT|NLD|UA|UKR|TR|TUR|AR|ARA|HI|HIN)\b';
-- --- END op 2134
