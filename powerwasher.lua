local powerwasher = {
    model = 'prop_power_cell',
    position = vector3(0.0, 0.0, 0.0),
    rotation = vector3(0.0, 0.0, 0.0),
    spawned = false
}

function spawnPowerwasher()
    if not powerwasher.spawned then
        RequestModel(powerwasher.model)
        while not HasModelLoaded(powerwasher.model) do
            Wait(500)
        end
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        powerwasher.position = playerCoords + vector3(0.0, 0.0, -1.0)
        powerwasher.rotation = GetEntityRotation(playerPed)
        
        local powerwasherObject = CreateObject(powerwasher.model, powerwasher.position.x, powerwasher.position.y, powerwasher.position.z, true, false, false)
        SetEntityRotation(powerwasherObject, powerwasher.rotation.x, powerwasher.rotation.y, powerwasher.rotation.z, 2, true)
        
        powerwasher.spawned = true
    end
end

function removePowerwasher()
    if powerwasher.spawned then
        local objects = GetGamePool('CObject')
        for _, object in ipairs(objects) do
            if GetEntityModel(object) == GetHashKey(powerwasher.model) then
                DeleteObject(object)
            end
        end
        powerwasher.spawned = false
    end
end

RegisterCommand('powerwasher', function(source, args)
    if args[1] == 'spawn' then
        spawnPowerwasher()
    elseif args[1] == 'remove' then
        removePowerwasher()
    end
end, false)