RegisterCommand('powerwasher', function(source, args)
    if args[1] == 'spawn' then
        TriggerClientEvent('spawnPowerwasher', source)
    elseif args[1] == 'remove' then
        TriggerClientEvent('removePowerwasher', source)
    end
end, false)