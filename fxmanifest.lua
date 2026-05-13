-- Credits: inspired by the original fps menu concept from Egypt Studio & KH Dev Team.
-- This version has been completely recreated from scratch with ox_lib,
-- added KVP persistence, auto‑restore, and multi‑framework support.
-- Created by JamX, QC
-- Licensed under GNU General Public License v3.0

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'jx-fps'
author 'JamX Scripts'
description 'FPS boost menu using ox_lib with auto-save and multi-framework support.'
version '1.0.0'

dependency 'ox_lib'

shared_scripts {
    'config.lua',
    'locale/en.lua',
    'locale/fr.lua'
}

client_script 'client.lua'
