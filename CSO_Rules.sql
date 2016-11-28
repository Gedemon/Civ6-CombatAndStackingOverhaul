/*
	Combat and Stacking Overhaul
	by Gedemon (2016)
*/
 

-----------------------------------------------
-- Units
-----------------------------------------------

/* AT are ranged support */
UPDATE Units SET Range ='1', PromotionClass ='PROMOTION_CLASS_RANGED' WHERE UnitType = 'UNIT_AT_CREW' OR UnitType = 'UNIT_MODERN_AT';
UPDATE Units SET RangedCombat ='65', Combat ='60' WHERE UnitType = 'UNIT_AT_CREW'; 		-- default Combat = 70
UPDATE Units SET RangedCombat ='75', Combat ='70' WHERE UnitType = 'UNIT_MODERN_AT';	-- default Combat = 80

/* Create new formation classes */
/*
-- Need DLL access to link FORMATION CLASS to a stacking class.
INSERT INTO Types (Type, Kind) VALUES ('FORMATION_CLASS_RANGED', 'KIND_FORMATION_CLASS');
INSERT INTO UnitFormationClasses (FormationClassType, Name) VALUES ('FORMATION_CLASS_RANGED', 'Ranged');

INSERT INTO Types (Type, Kind) VALUES ('FORMATION_CLASS_RECON', 'KIND_FORMATION_CLASS');
INSERT INTO UnitFormationClasses (FormationClassType, Name) VALUES ('FORMATION_CLASS_RECON', 'Recon');
*/

/* Apply the new classes (order is important !) */
UPDATE Units SET FormationClass = 'FORMATION_CLASS_SUPPORT' WHERE (RangedCombat > 0 OR Bombard > 0) AND (Domain = 'DOMAIN_LAND');
UPDATE Units SET FormationClass = 'FORMATION_CLASS_SUPPORT' WHERE PromotionClass = 'PROMOTION_CLASS_RECON' AND Domain = 'DOMAIN_LAND';

/* Apply new AI */
/*
-- to do
DELETE FROM UnitAiInfos WHERE UnitType = (SELECT UnitType FROM Units WHERE (RangedCombat > 0 OR Bombard > 0) AND (Domain = 'DOMAIN_LAND'));

*/

/* Range = 1 for all Ranged Land/Sea unit */
UPDATE Units SET Range ='1' WHERE (RangedCombat > 0 OR Bombard > 0) AND (Domain = 'DOMAIN_LAND' OR Domain = 'DOMAIN_SEA');

/* Range = 2 for some units */
UPDATE Units SET Range ='2' WHERE UnitType = 'UNIT_BATTLESHIP' OR UnitType = 'UNIT_BRAZILIAN_MINAS_GERAES';

/* Range = 3 for some units */
UPDATE Units SET Range ='3' WHERE UnitType = 'UNIT_ROCKET_ARTILLERY';

/* Range = 5 for some units */
UPDATE Units SET Range ='4' WHERE UnitType = 'UNIT_MISSILE_CRUISER' OR UnitType = 'UNIT_NUCLEAR_SUBMARINE';

/* Balance */
UPDATE Units SET RangedCombat ='50' WHERE UnitType = 'UNIT_RANGER'; -- default RangedCombat = 60


-----------------------------------------------
-- Walls
-----------------------------------------------

/* Thanks to hardcoding, removing Walls seems to be the only way to disable city ranged attack  */
--/*
DELETE FROM Buildings WHERE BuildingType ='BUILDING_WALLS';
DELETE FROM BuildingPrereqs WHERE Building ='BUILDING_WALLS';
DELETE FROM ModifierArguments WHERE Value ='BUILDING_WALLS';
--*/

/*
-- Replacement lacks icons and 3D models
INSERT OR REPLACE INTO Types (Type, Kind) VALUES ('BUILDING_ANCIENT_WALLS','KIND_BUILDING');
INSERT OR REPLACE INTO Buildings VALUES('BUILDING_ANCIENT_WALLS','LOC_BUILDING_WALLS_NAME','TECH_MASONRY',NULL,80,-1,-1,0,'DISTRICT_CITY_CENTER',NULL,'LOC_BUILDING_WALLS_DESCRIPTION',0,0,50,0,0,NULL,NULL,0,0,NULL,0,1,0,NULL,1,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC');
DELETE FROM Buildings WHERE BuildingType ='BUILDING_WALLS';
UPDATE BuildingPrereqs SET PrereqBuilding ='BUILDING_ANCIENT_WALLS' WHERE PrereqBuilding ='BUILDING_WALLS';
UPDATE StartingBuildings SET Building ='BUILDING_ANCIENT_WALLS' WHERE Building ='BUILDING_WALLS';
UPDATE ModifierArguments SET Value ='BUILDING_ANCIENT_WALLS' WHERE Value ='BUILDING_WALLS';
--*/

/* Until then, balance with existing buildings */
UPDATE Buildings SET OuterDefenseHitPoints ='20' WHERE BuildingType ='BUILDING_PALACE';
UPDATE Buildings SET OuterDefenseHitPoints ='30' WHERE BuildingType ='BUILDING_CASTLE';
UPDATE Buildings SET OuterDefenseHitPoints ='50' WHERE BuildingType ='BUILDING_STAR_FORT';

-----------------------------------------------
-- Combats
-----------------------------------------------

UPDATE GlobalParameters SET Value = 12		WHERE Name = 'COMBAT_BASE_DAMAGE';		-- default = 24

UPDATE GlobalParameters SET Value = 20		WHERE Name = 'COMBAT_HEAL_CITY_GARRISON';		-- default = 20
UPDATE GlobalParameters SET Value = 5		WHERE Name = 'COMBAT_HEAL_CITY_OUTER_DEFENSES';	-- default = 10
UPDATE GlobalParameters SET Value = 0		WHERE Name = 'COMBAT_HEAL_LAND_ENEMY';			-- default = 5
UPDATE GlobalParameters SET Value = 10		WHERE Name = 'COMBAT_HEAL_LAND_FRIENDLY';		-- default = 15
UPDATE GlobalParameters SET Value = 5		WHERE Name = 'COMBAT_HEAL_LAND_NEUTRAL';		-- default = 10
UPDATE GlobalParameters SET Value = 0		WHERE Name = 'COMBAT_HEAL_NAVAL_ENEMY';			-- default = 0
UPDATE GlobalParameters SET Value = 10		WHERE Name = 'COMBAT_HEAL_NAVAL_FRIENDLY';		-- default = 20
UPDATE GlobalParameters SET Value = 5		WHERE Name = 'COMBAT_HEAL_NAVAL_NEUTRAL';		-- default = 0

UPDATE GlobalParameters SET Value = 6		WHERE Name = 'COMBAT_MAX_EXTRA_DAMAGE';						-- default = 12
UPDATE GlobalParameters SET Value = 10		WHERE Name = 'COMBAT_BOMBARD_VS_UNIT_STRENGTH_MODIFIER';	-- default = 17
UPDATE GlobalParameters SET Value = 15		WHERE Name = 'COMBAT_RANGED_VS_DISTRICT_STRENGTH_MODIFIER';	-- default = 17

-----------------------------------------------
-- Resources
-----------------------------------------------

/* Remove all resources requirements */
UPDATE Units SET StrategicResource = NULL;

/* Add production bonus for strategic resources */
INSERT INTO TraitModifiers
(	TraitType,					ModifierId							)	VALUES
(	'TRAIT_LEADER_MAJOR_CIV',	'SWORDSMAN_PRODUCTION_RESOURCE_IRON_BONUS'			),
(	'TRAIT_LEADER_MAJOR_CIV',	'KNIGHT_PRODUCTION_RESOURCE_IRON_BONUS'				),
(	'TRAIT_LEADER_MAJOR_CIV',	'KNIGHT_PRODUCTION_RESOURCE_HORSES_BONUS'			),
(	'TRAIT_LEADER_MAJOR_CIV',	'HORSEMAN_PRODUCTION_RESOURCE_HORSES_BONUS'			),
(	'TRAIT_LEADER_MAJOR_CIV',	'HEAVY_CHARIOT_PRODUCTION_RESOURCE_HORSES_BONUS'	),
(	'TRAIT_LEADER_MAJOR_CIV',	'CAVALRY_PRODUCTION_RESOURCE_HORSES_BONUS'			);

INSERT INTO Modifiers
(	ModifierId,											ModifierType,											RunOnce,	Permanent,	OwnerRequirementSetId		)	VALUES
(	'SWORDSMAN_PRODUCTION_RESOURCE_IRON_BONUS',			'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',			'0',		'0',		'PLAYER_HAS_IRON'			),
(	'KNIGHT_PRODUCTION_RESOURCE_IRON_BONUS',			'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',			'0',		'0',		'PLAYER_HAS_IRON'			),
(	'KNIGHT_PRODUCTION_RESOURCE_HORSES_BONUS',			'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',			'0',		'0',		'PLAYER_HAS_HORSES'			),
(	'HORSEMAN_PRODUCTION_RESOURCE_HORSES_BONUS',		'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',			'0',		'0',		'PLAYER_HAS_HORSES'			),
(	'HEAVY_CHARIOT_PRODUCTION_RESOURCE_HORSES_BONUS',	'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',			'0',		'0',		'PLAYER_HAS_HORSES'			),
(	'CAVALRY_PRODUCTION_RESOURCE_HORSES_BONUS',			'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',			'0',		'0',		'PLAYER_HAS_HORSES'			);

INSERT INTO ModifierArguments
(	ModifierId,											Name,			Value				)	VALUES
(	'SWORDSMAN_PRODUCTION_RESOURCE_IRON_BONUS',			'UnitType',		'UNIT_SWORDSMAN'	),
(	'SWORDSMAN_PRODUCTION_RESOURCE_IRON_BONUS',			'Amount',		'100'				),
(	'KNIGHT_PRODUCTION_RESOURCE_IRON_BONUS',			'UnitType',		'UNIT_KNIGHT'		),
(	'KNIGHT_PRODUCTION_RESOURCE_IRON_BONUS',			'Amount',		'50'				),
(	'KNIGHT_PRODUCTION_RESOURCE_HORSES_BONUS',			'UnitType',		'UNIT_KNIGHT'		),
(	'KNIGHT_PRODUCTION_RESOURCE_HORSES_BONUS',			'Amount',		'50'				),
(	'HORSEMAN_PRODUCTION_RESOURCE_HORSES_BONUS',		'UnitType',		'UNIT_HORSEMAN'		),
(	'HORSEMAN_PRODUCTION_RESOURCE_HORSES_BONUS',		'Amount',		'100'				),
(	'HEAVY_CHARIOT_PRODUCTION_RESOURCE_HORSES_BONUS',	'UnitType',		'UNIT_HEAVY_CHARIOT'),
(	'HEAVY_CHARIOT_PRODUCTION_RESOURCE_HORSES_BONUS',	'Amount',		'100'				),
(	'CAVALRY_PRODUCTION_RESOURCE_HORSES_BONUS',			'UnitType',		'UNIT_CAVALRY'		),
(	'CAVALRY_PRODUCTION_RESOURCE_HORSES_BONUS',			'Amount',		'100'				);

INSERT INTO RequirementSets
(	RequirementSetId,			RequirementSetType			)	VALUES
(	'PLAYER_HAS_IRON',			'REQUIREMENTSET_TEST_ALL'	),
(	'PLAYER_HAS_HORSES',		'REQUIREMENTSET_TEST_ALL'	);

INSERT INTO RequirementSetRequirements
(	RequirementSetId,			RequirementId				)	VALUES
(	'PLAYER_HAS_IRON',			'UNIT_REQUIRES_PLAYER_HAS_IRON'	),
(	'PLAYER_HAS_HORSES',		'UNIT_REQUIRES_PLAYER_HAS_HORSES'	);

INSERT INTO Requirements
(	RequirementId,						RequirementType							)	VALUES
(	'UNIT_REQUIRES_PLAYER_HAS_IRON',	'REQUIREMENT_PLAYER_HAS_RESOURCE_OWNED'	),
(	'UNIT_REQUIRES_PLAYER_HAS_HORSES',	'REQUIREMENT_PLAYER_HAS_RESOURCE_OWNED'	);

INSERT INTO RequirementArguments
(	RequirementId,						Name,				Value				)	VALUES
(	'UNIT_REQUIRES_PLAYER_HAS_IRON',	'ResourceType',		'RESOURCE_IRON'		),
(	'UNIT_REQUIRES_PLAYER_HAS_HORSES',	'ResourceType',		'RESOURCE_HORSES'	);

/* Balance */
UPDATE Units SET Cost = Cost*2 
	WHERE 	UnitType = 'UNIT_SWORDSMAN'
	OR 		UnitType = 'UNIT_KNIGHT'
	OR 		UnitType = 'UNIT_HORSEMAN'
	OR 		UnitType = 'UNIT_HEAVY_CHARIOT'
	OR 		UnitType = 'CAVALRY';

