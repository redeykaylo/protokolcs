exports('useItem', function(data, slot)
    local itemData = data.metadata and data.metadata.form_data
    TriggerEvent('cskontrola:openForm', itemData)
end)
