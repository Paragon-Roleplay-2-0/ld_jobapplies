fx_version 'cerulean'

game { 'gta5' }

author 'L0rdw1z'

description 'Applications for jobs'

shared_scripts {
    "@ox_lib/init.lua",
    -- '@lation_ui/init.lua',
    "config.lua"
}

client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}

lua54 "yes"