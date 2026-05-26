-- @operation: export
-- @entity: batch
-- @name: Changed main delay to 10 minutes
-- @exportedAt: 2026-05-26T19:39:17.140Z
-- @opIds: 1344, 1345

-- --- BEGIN op 1344 ( update delay_profile "Default Delay" )
update "delay_profiles" set "usenet_delay" = 10 where "name" = 'Default Delay' and "usenet_delay" = 60;
-- --- END op 1344

-- --- BEGIN op 1345 ( update delay_profile "Default Delay" )
update "delay_profiles" set "torrent_delay" = 10 where "name" = 'Default Delay' and "torrent_delay" = 60;
-- --- END op 1345
