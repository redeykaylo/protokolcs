RegisterNetEvent('cskontrola:openForm', function(existingData)
    local formData = existingData or {
        datum = '',
        misto = '',
        casZacatek = '',
        casKonec = '',
        jmeno = '',
        narozeni = '',
        adresa = '',
        predmet = '',
        zjisteni = '',
        zaver = '',
        kontrolori = ''
    }

local input = lib.inputDialog('Protokol o kontrole', {
    {label = 'Datum', type = 'input', default = formData.datum},
    {label = 'Místo kontroly', type = 'input', default = formData.misto},
    {label = 'Čas začátku', type = 'input', default = formData.casZacatek},
    {label = 'Čas konce', type = 'input', default = formData.casKonec},
    {label = 'Jméno kontrolovaného', type = 'input', default = formData.jmeno},
    {label = 'Datum narození', type = 'input', default = formData.narozeni},
    {label = 'Předmět kontroly', type = 'textarea', default = formData.predmet},
    {label = 'Zjištěné skutečnosti', type = 'textarea', default = formData.zjisteni},
    {label = 'Závěr', type = 'textarea', default = formData.zaver},
    {label = 'Kontroloři', type = 'input', default = formData.kontrolori},
})


    if input then
        TriggerServerEvent('cskontrola:saveForm', input)
    end
end)
