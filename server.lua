local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Commands.Add('news', 'Опубликовать новость', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'reporter' then
        TriggerClientEvent('newsUI:client:openMenu', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Только для фракции Дейли Глобал','error')
    end
end)

RegisterServerEvent('newsUI:server:newPost')
AddEventHandler('newsUI:server:newPost', function(data)
	TriggerClientEvent('newsUI:client:newPost', -1, data) 
end)