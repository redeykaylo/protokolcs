ESX = exports['es_extended']:getSharedObject()

-- 💬 Vlož sem svůj webhook z Discordu
local webhookURL = 'https://discord.com/api/webhooks/1385929014534868992/RdaV47Qg16Aq08jKvXyYNg39rjUo9Qir-7_n3f6B-GD4CTfExVq7_Hu_M_FQsvsi3SoV'

-- 📤 Funkce pro odeslání embed zprávy na Discord
local function sendToDiscord(data, playerName)
    -- lib.inputDialog vrací pole (array), musíme si ho ručně mapovat
local protokol = {
    datum = data[1],
    misto = data[2],
    casZacatek = data[3],
    casKonec = data[4],
    jmeno = data[5],
    narozeni = data[6],
    predmet = data[7],
    zjisteni = data[8],
    zaver = data[9],
    kontrolori = data[10]
}


    local message = {
        embeds = {{
            title = '🧾 Protokol celní kontroly',
            description = string.format([[
**Datum:** %s  
**Místo:** %s  
**Čas:** %s – %s  
**Kontrolovaný:** %s (%s)  

**🔍 Předmět kontroly:**  
%s

**📌 Zjištěné skutečnosti:**  
%s

**✅ Závěr:**  
%s

👮 Kontroloři: %s
]], protokol.datum, protokol.misto, protokol.casZacatek, protokol.casKonec,
     protokol.jmeno, protokol.narozeni, protokol.adresa, protokol.predmet,
     protokol.zjisteni, protokol.zaver, protokol.kontrolori),
            color = 16753920,
            footer = {
                text = 'Odesláno hráčem: ' .. (playerName or 'Neznámý')
            }
        }}
    }

    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(message), {
        ['Content-Type'] = 'application/json'
    })
end

-- 🧾 Uložení formuláře jako item + odeslání na Discord
RegisterNetEvent('cskontrola:saveForm', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        local metadata = {
            form_data = data,
            description = 'Vyplněný protokol kontroly'
        }

        -- 🎒 Uložení itemu do inventáře
        exports.ox_inventory:AddItem(src, 'cskontrola', 1, metadata)

        -- 📤 Odeslání na Discord
        sendToDiscord(data, xPlayer.getName())
    end
end)
