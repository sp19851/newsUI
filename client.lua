local QBCore = exports['qb-core']:GetCoreObject()
local inUIPage = false
local nesTime = 1000*25

RegisterNetEvent("newsUI:client:openMenu")
AddEventHandler("newsUI:client:openMenu", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Описание новости",
        submitText = "Опубликовать",
        inputs = {
            {
                text = "Заголовок", -- text you want to be displayed as a place holder
                name = "title", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Автор", -- text you want to be displayed as a place holder
                name = "author", 
                type = "text", 
                default = "Daily Global",
                isRequired = true 
            },
            {
                text = "Текст новости", 
                name = "mes",
                type = "text",
                isRequired = true
            },
           
          
        },
    })
    TriggerServerEvent('newsUI:server:newPost', dialog)
end)

RegisterNetEvent("newsUI:client:newPost")
AddEventHandler("newsUI:client:newPost", function(data)
    if inUIPage then
        SendNUIMessage({
            action = "close",
        })
    end
    Wait(1000)
    SendNUIMessage({
        action = "newPOST",
        title = data.title;
        author = data.author;
        mes = data.mes;
    })
    inUIPage =  true
    SetTimeout(nesTime, function()
        SendNUIMessage({
            action = "close",
        })
        inUIPage =  false
    end)
end)