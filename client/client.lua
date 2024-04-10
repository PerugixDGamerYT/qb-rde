local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.citizenid ~= nil then
            job = PlayerData.job.name
            grade = PlayerData.job.grade.level
            break
        end
        Wait(100)
    end
end)

local AllCreatedZones = {}

Citizen.CreateThread(function()
for k,v in pairs(AllZones) do
    local TempZone = nil
    local TempTable = {}
    for k2,v2 in ipairs(v.Zones) do
        TempZone = PolyZone:Create(v2.Coords, {
            name = k .. "_" .. k2,
            minZ = v2.minZ,
            maxZ = v2.maxZ,
            debugPoly = v.Debug,
            debugGrid = v.Debug,
        })
        table.insert(TempTable,TempZone)
    end
    if #TempTable > 1 then
        TempZone = ComboZone:Create(TempTable, {name= k .. "_combo"})
        
        TempZone:onPlayerInOut(function(isPointInside, point, zone)
          EnteredZone(isPointInside,k)
        end, CheckLoopTime)
    else
        TempZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point, zone)
          EnteredZone(isPointInside,k)
        end, CheckLoopTime)
    end
end
end)

function EnteredZone(isPointInside,Name)
	local InZone,Name = InZone,Name
	if isPointInside and WhatIsLastLoop ~= Name then
		Citizen.CreateThread(function()
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"RDE", "Se Verian Personas armadas en la zona"}
                  })  
		end)
	else
	end
end