local powerwasher = {
    name = 'Power Washer',
    model = 'prop_power_cell',
    price = 1000,
    description = 'A powerful tool for cleaning surfaces.',
    spawn = function(player)
        -- Spawn the powerwasher for the player
        local playerPed = GetPlayerPed(player)
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        local powerwasherObj = CreateObject(GetHashKey(powerwasher.model), coords.x, coords.y, coords.z, true, false, true)
        SetEntityHeading(powerwasherObj, heading)
        AttachEntityToEntity(powerwasherObj, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        return powerwasherObj
    end,
    remove = function(player)
        -- Remove the powerwasher from the player
        local playerPed = GetPlayerPed(player)
        local powerwasherObj = GetAttachedObject(playerPed, GetHashKey(powerwasher.model))
        if powerwasherObj then
            DeleteEntity(powerwasherObj)
        end
    end
}

RegisterNetEvent('powerwasher:spawn')
AddEventHandler('powerwasher:spawn', function()
    powerwasher.spawn(source)
end)

RegisterNetEvent('powerwasher:remove')
AddEventHandler('powerwasher:remove', function()
    powerwasher.remove(source)
end)
