RegisterCommand('powerwasher', function(source, args, rawCommand)
    if args[1] == 'spawn' then
        TriggerClientEvent('powerwasher:spawn', source)
    elseif args[1] == 'remove' then
        TriggerClientEvent('powerwasher:remove', source)
    end
end, false)
