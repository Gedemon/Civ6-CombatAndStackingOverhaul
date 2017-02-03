/*
	Combat and Stacking Overhaul
	Additions to existing <Texts>
	by Gedemon (2016)
*/

-- Better range with Oil
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_OIL] Oil give +1 [ICON_Range] Range.' WHERE 
	Tag = 'LOC_UNIT_BIPLANE_DESCRIPTION' OR
	Tag = 'LOC_UNIT_FIGHTER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_AMERICAN_P51_DESCRIPTION' OR
	Tag = 'LOC_UNIT_BOMBER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_JET_FIGHTER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_JET_BOMBER_DESCRIPTION'	;
	
-- More movement with Oil
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_OIL] Oil give +1 [ICON_Movement] Movement.' WHERE 
	Tag = 'LOC_UNIT_TANK_DESCRIPTION' OR					
	Tag = 'LOC_UNIT_HELICOPTER_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_MECHANIZED_INFANTRY_DESCRIPTION' OR		
	Tag = 'LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' OR		
	Tag = 'LOC_UNIT_MOBILE_SAM_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_MODERN_ARMOR_DESCRIPTION' OR			
	Tag = 'LOC_UNIT_BATTLESHIP_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_BRAZILIAN_MINAS_GERAES_DESCRIPTION' OR	
	Tag = 'LOC_UNIT_SUBMARINE_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_GERMAN_UBOAT_DESCRIPTION' OR			
	Tag = 'LOC_UNIT_AIRCRAFT_CARRIER_DESCRIPTION' OR		
	Tag = 'LOC_UNIT_DESTROYER_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_MISSILE_CRUISER_DESCRIPTION' ;

-- More movement with Coal
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_COAL] Coal give +1 [ICON_Movement] Movement.' WHERE 
	Tag = 'LOC_UNIT_IRONCLAD_DESCRIPTION' ;
	
-- More movement with Uranium
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_Resource_Uranium] Uranium give +2 [ICON_Movement] Movement.' WHERE 
	Tag = 'LOC_UNIT_NUCLEAR_SUBMARINE_DESCRIPTION' ;

-- Combat Bonus with Niter
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_NITER] Niter give +5 [ICON_Strength] Combat Strength.' WHERE 
	Tag = 'LOC_UNIT_MUSKETMAN_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_BOMBARD_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_SPANISH_CONQUISTADOR_DESCRIPTION' OR	
	Tag = 'LOC_UNIT_CARAVEL_DESCRIPTION' OR               	
	Tag = 'LOC_UNIT_FRIGATE_DESCRIPTION' OR               	
	Tag = 'LOC_UNIT_PRIVATEER_DESCRIPTION' OR             	
	Tag = 'LOC_UNIT_ENGLISH_SEADOG_DESCRIPTION' OR        	
	Tag = 'LOC_UNIT_FIELD_CANNON_DESCRIPTION' OR          	
	Tag = 'LOC_UNIT_CAVALRY_DESCRIPTION' OR               	
	Tag = 'LOC_UNIT_RUSSIAN_COSSACK_DESCRIPTION' OR       	
	Tag = 'LOC_UNIT_ENGLISH_REDCOAT_DESCRIPTION' OR       	
	Tag = 'LOC_UNIT_FRENCH_GARDE_IMPERIALE_DESCRIPTION' OR	
	Tag = 'LOC_UNIT_IRONCLAD_DESCRIPTION' OR				
	Tag = 'LOC_UNIT_RANGER_DESCRIPTION' ;	
	
-- Aluminum bonus for aquisition
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_ALUMINUM] Aluminum lower aquisition cost.' WHERE 
	Tag = 'LOC_UNIT_FIGHTER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_BOMBER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_JET_FIGHTER_DESCRIPTION' OR
	Tag = 'LOC_UNIT_JET_BOMBER_DESCRIPTION'	;
	
-- Iron bonus for aquisition
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_IRON] Iron lower aquisition cost.' WHERE 
	Tag = 'LOC_UNIT_SWORDSMAN_DESCRIPTION' OR
	Tag = 'LOC_UNIT_KNIGHT_DESCRIPTION'	;
	
-- Horse bonus for aquisition
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_HORSES] Horses lower aquisition cost.' WHERE 
	Tag = 'LOC_UNIT_CAVALRY_DESCRIPTION' OR
	Tag = 'LOC_UNIT_HORSEMAN_DESCRIPTION' OR
	Tag = 'LOC_UNIT_HEAVY_CHARIOT_DESCRIPTION' OR
	Tag = 'LOC_UNIT_KNIGHT_DESCRIPTION'	;
	
-- Steel bonus for aquisition
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_COAL] Coal + [ICON_RESOURCE_IRON] Iron (Industrial Steel) lower aquisition cost.' WHERE 
	Tag = 'LOC_UNIT_IRONCLAD_DESCRIPTION' OR			
	Tag = 'LOC_UNIT_BATTLESHIP_DESCRIPTION' OR		
	Tag = 'LOC_UNIT_TANK_DESCRIPTION' OR
	Tag = 'LOC_UNIT_AIRCRAFT_CARRIER_DESCRIPTION' OR	
	Tag = 'LOC_UNIT_DESTROYER_DESCRIPTION' OR	
	Tag = 'LOC_UNIT_SUBMARINE_DESCRIPTION' OR	
	Tag = 'LOC_UNIT_NUCLEAR_SUBMARINE_DESCRIPTION' OR		
	Tag = 'LOC_UNIT_MISSILE_CRUISER_DESCRIPTION' OR		
	Tag = 'LOC_UNIT_MODERN_ARMOR_DESCRIPTION' ;	
	
-- Faster Projects with Uranium
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_Resource_Uranium] Uranium lower project cost.' WHERE 
	Tag = 'LOC_PROJECT_LAUNCH_MARS_REACTOR_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_MANHATTAN_PROJECT_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_OPERATION_IVY_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_BUILD_NUCLEAR_DEVICE_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_BUILD_THERMONUCLEAR_DEVICE_DESCRIPTION' ;
	
-- Faster Projects with Aluminum
UPDATE LocalizedText SET
	Text = Text || '[NEWLINE][ICON_RESOURCE_ALUMINUM] Aluminum lower project cost.' WHERE 
	Tag = 'LOC_PROJECT_LAUNCH_MARS_REACTOR_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_LAUNCH_EARTH_SATELLITE_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_LAUNCH_MOON_LANDING_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_LAUNCH_MARS_HABITATION_DESCRIPTION' OR	
	Tag = 'LOC_PROJECT_LAUNCH_MARS_HYDROPONICS_DESCRIPTION' ;