ALTER TABLE db_version CHANGE COLUMN required_s2354_01_mangos_dbscripts_on_relay required_s2355_01_mangos_dbscript_random_template bit;

DROP TABLE IF EXISTS `dbscript_random_templates`;
CREATE TABLE `dbscript_random_templates` (
  `id` int(11) unsigned NOT NULL COMMENT 'Id of template',
  `type` int(11) unsigned NOT NULL COMMENT 'Type of template',
  `target_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Id of chanced element',
  `chance` int(11) NOT NULL DEFAULT '0' COMMENT 'Chance for element to occur in %',
  PRIMARY KEY (`id`,`type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='DBScript system';

-- type 0 - strings
-- type 1 - relay dbscript

INSERT INTO dbscript_random_templates(id,type,target_id,chance) SELECT id,'0',string_id,'0' FROM dbscript_string_template;

DROP TABLE IF EXISTS dbscript_string_template;

ALTER TABLE db_version CHANGE COLUMN required_s2355_01_mangos_dbscript_random_template required_s2356_01_mangos_dbscript_string_rename bit;

DROP TABLE IF EXISTS `dbscript_string`;
RENAME TABLE `db_script_string` TO `dbscript_string`;

ALTER TABLE conditions
ADD comments varchar(300) AFTER value2;

