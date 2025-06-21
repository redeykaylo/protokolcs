ESX = exports['es_extended']:getSharedObject()

-- 💬 Insert your Discord webhook here
local webhookURL = 'YOUR_DISCORD_WEBHOOK'

-- 📤 Function to send an embed message to Discord
local function sendToDiscord(data, playerName)
    -- lib.inputDialog returns an array, so we manually map it
    local report = {
        date = data[1],
        location = data[2],
        startTime = data[3],
        endTime = data[4],
        inspectedName = data[5],
        birthDate = data[6],
        subject = data[7],
        findings = data[8],
        conclusion = data[9],
        inspectors = data[10]
    }

    local message = {
        embeds = {{
            title = '🧾 Customs Inspection Report',
            description = string.format([[
**Date:** %s  
**Location:** %s  
**Time:** %s – %s  
**Inspected Person:** %s (%s)  

**🔍 Inspection Subject:**  
%s

**📌 Findings:**  
%s

**✅ Conclusion:**  
%s

👮 Inspectors: %s
]], report.date, report.location, report.startTime, report.endTime,
     report.inspectedName, report.birthDate, report.address, report.subject,
     report.findings, report.conclusion, report.inspectors),
            color = 16753920,
            footer = {
                text = 'Submitted by player: ' .. (playerName or 'Unknown')
            }
        }}
    }

    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(message), {
        ['Content-Type'] = 'application/json'
    })
end

-- 🧾 Save the form as an item + send it to Discord
RegisterNetEvent('cskontrola:saveForm', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        local metadata = {
            form_data = data,
            description = 'Completed inspection report'
        }

        -- 🎒 Add the item to inventory
        exports.ox_inventory:AddItem(src, 'cskontrola', 1, metadata)

        -- 📤 Send to Discord
        sendToDiscord(data, xPlayer.getName())
    end
end)
