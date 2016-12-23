------------------------------------------------------------------------------
--	FILE:	 CSO_InGame.lua
--  Gedemon (2016)
------------------------------------------------------------------------------

local CSO_Version = GameInfo.GlobalParameters["CSO_VERSION"].Value
print ("Combat and Stacking Overhaul version " .. tostring(CSO_Version) .." (2016) by Gedemon")
print ("loading CSO_InGame.lua")

------------------------------------------------------------------------------
-- Works only on local player units, no AI control possible ATM...
--[[
function MoveToXY(unit, x, y)
	local tParameters = {};
	tParameters[UnitOperationTypes.PARAM_X] = x
	tParameters[UnitOperationTypes.PARAM_Y] = y
	UnitManager.RequestOperation(unit, UnitOperationTypes.MOVE_TO, tParameters)
end


function OnPlayerTurnActivated( iPlayer, bFirstTime )
	print ("------------------------------")
	print ("PlayerTurnActivated")	
	print ("------------------------------")
	local player = Players[iPlayer]
	local playerConfig = PlayerConfigurations[iPlayer]
	print("Units of " .. tostring(Locale.Lookup(playerConfig:GetCivilizationShortDescription())))
	local pPlayerUnits = player:GetUnits();
	for i, pUnit in pPlayerUnits:Members() do
		print(pUnit:GetName(), "GetMaxMoves :", pUnit:GetMaxMoves(), "GetMovesRemaining :", pUnit:GetMovesRemaining(), "GetMovementMovesRemaining :", pUnit:GetMovementMovesRemaining())
		MoveToXY(pUnit, pUnit:GetX()+2 , pUnit:GetY())
	end
	for i, pUnit in pPlayerUnits:Members() do
		print(pUnit:GetName(), "GetMaxMoves :", pUnit:GetMaxMoves(), "GetMovesRemaining :", pUnit:GetMovesRemaining(), "GetMovementMovesRemaining :", pUnit:GetMovementMovesRemaining())
		MoveToXY(pUnit, pUnit:GetX()-2 , pUnit:GetY())
	end
end
Events.PlayerTurnActivated.Add( OnPlayerTurnActivated )


function OnRemotePlayerTurnBegin( iPlayer )
	print ("------------------------------")
	print ("RemotePlayerTurnBegin")	
	print ("------------------------------")
	local player = Players[iPlayer]
	local playerConfig = PlayerConfigurations[iPlayer]
	print("Units of " .. tostring(Locale.Lookup(playerConfig:GetCivilizationShortDescription())))
	local pPlayerUnits = player:GetUnits();
	for i, pUnit in pPlayerUnits:Members() do
		print(pUnit:GetName(), "GetMaxMoves :", pUnit:GetMaxMoves(), "GetMovesRemaining :", pUnit:GetMovesRemaining(), "GetMovementMovesRemaining :", pUnit:GetMovementMovesRemaining())
	end
end
Events.RemotePlayerTurnBegin.Add( OnRemotePlayerTurnBegin )
--]]