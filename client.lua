-- jx-fps
-- Recreated from scratch with ox_lib by JamX Scripts,
-- inspired by the original concept of Egypt Studio & KH Dev Team.
-- This version adds KVP persistence, auto‑restore and multi‑framework support.
-- Created by JamX, QC
-- Licensed under GNU General Public License v3.0

local lib = exports.ox_lib

-- ========== LANGUAGE HELPER ==========
local T = Locale[Config.Locale] or Locale.en

-- ========== CLEANUP ==========
local function CleanAll()
    local ped = PlayerPedId()
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

-- ========== RESET ==========
local function ResetAll()
    SetTimecycleModifier()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    SetRainLevel(-1)
    SetWindSpeed(-1)
    SetResourceKvp('fps_mode', '')
    print('^3[FPS Menu] ^7KVP save cleared (Reset)')
end

-- ========== APPLY MODE ==========
local function ApplyMode(mode)
    if mode == 'high' then
        SetTimecycleModifier('MP_Powerplay_blend')
        SetExtraTimecycleModifier('reflection_correct_ambient')
    elseif mode == 'med' then
        SetTimecycleModifier('tunnel')
        CleanAll()
    elseif mode == 'low' then
        SetTimecycleModifier('yell_tunnel_nodirect')
        CleanAll()
    end
    SetResourceKvp('fps_mode', mode)
    print('^2[FPS Menu] ^7Mode saved in local cache : ' .. mode .. ' (resource : ' .. GetCurrentResourceName() .. ')')
end

-- ========== AUTO‑RESTORE ==========
local restored = false

local function TryRestore()
    if restored then return end
    restored = true
    Wait(2000)
    local saved = GetResourceKvpString('fps_mode')
    if saved ~= nil and saved ~= '' then
        ApplyMode(saved)
        print('^2[FPS Menu] ^7Mode restored from cache : ' .. saved)
    else
        print('^3[FPS Menu] ^7No KVP save found, using default mode')
    end
end

-- Framework listeners
local framework = Config.Framework and Config.Framework:lower() or 'auto'

if framework == 'qb' or framework == 'auto' then
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        TryRestore()
    end)
end

if framework == 'esx' or framework == 'auto' then
    AddEventHandler('esx:playerLoaded', function()
        TryRestore()
    end)
end

-- ========== MENU ==========
lib:registerContext({
    id = 'fps_menu',
    title = 'FPS MENU',
    options = {
        {
            title = '🔋 High',
            description = T.high_desc,
            icon = 'battery-full',
            onSelect = function() ApplyMode('high') end
        },
        {
            title = '⚡ Med',
            description = T.med_desc,
            icon = 'battery-half',
            onSelect = function() ApplyMode('med') end
        },
        {
            title = '🪫 Low',
            description = T.low_desc,
            icon = 'battery-empty',
            onSelect = function() ApplyMode('low') end
        },
        {
            title = '🔄 Reset',
            description = T.reset_desc,
            icon = 'sync-alt',
            onSelect = function() ResetAll() end
        },
    }
})

RegisterCommand('fps', function()
    lib:showContext('fps_menu')
end)
