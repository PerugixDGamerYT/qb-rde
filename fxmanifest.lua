fx_version 'adamant'
game 'gta5'

name "SimpleRDE"
description "Un Simple Script De Rol de Entorno Hecho Por PerugixDGamer_YT"
author "PerugixDGamer_YT"
version "1.0"

dependencies {
    'PolyZone'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    '@PolyZone/EntityZone.lua',
    'config.lua',
    'client/*.lua'
}