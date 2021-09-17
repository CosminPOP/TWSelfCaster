local s = CreateFrame("Frame")
s:RegisterEvent("ADDON_LOADED")
s:RegisterEvent("CVAR_UPDATE")
--s:RegisterEvent("VARIABLES_LOADED")

s:SetScript("OnEvent", function()

    if event then
        if event == 'ADDON_LOADED' and arg1 == "TWSelfCaster" then
            if not SELF_CONFIG then
                SELF_CONFIG = {}
                SELF_CONFIG[UnitName('player')] = GetCVar("autoSelfCast")
            end
            SetCVar("autoSelfCast", SELF_CONFIG[UnitName('player')])
        end
        --if event == "VARIABLES_LOADED" then
        --    if not SELF_CONFIG then
        --        SELF_CONFIG = {}
        --        SELF_CONFIG[UnitName('player')] = GetCVar("autoSelfCast")
        --    end
        --    if SetCVar("autoSelfCast", SELF_CONFIG[UnitName('player')]) then
        --    end
        --end
        if event == "CVAR_UPDATE" then
            if arg1 == 'AUTO_SELF_CAST_TEXT' then
                if not SELF_CONFIG then
                    SELF_CONFIG = {}
                end
                SELF_CONFIG[UnitName('player')] = GetCVar("autoSelfCast")
            end
        end
    end

end)
