fx_version 'cerulean'
game 'gta5'

description 'Celní správa - Kontrolní protokol'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client/item_use.lua',  -- musí být zde, jinak ox_inventory nenajde export!
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

lua54 'yes'
