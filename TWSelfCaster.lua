local s = CreateFrame("Frame")
local sSetter = CreateFrame("Frame")
sSetter:Hide()
s:RegisterEvent("ADDON_LOADED")
s:RegisterEvent("CVAR_UPDATE")
s:RegisterEvent("VARIABLES_LOADED")

sSetter:SetScript("OnShow", function()
    this.startTime = GetTime()
end)

sSetter:SetScript("OnUpdate", function()
    local plus = 1 --seconds
    local gt = GetTime() * 1000
    local st = (this.startTime + plus) * 1000
    if gt >= st then
        SetCVar("autoSelfCast", SELF_CONFIG[UnitName('player')])
        sSetter:Hide()
    end
end)

s:SetScript("OnEvent", function()

    if event then
        if event == 'ADDON_LOADED' and arg1 == "TWSelfCaster" then
            if not SELF_CONFIG then
                SELF_CONFIG = {}
                SELF_CONFIG[UnitName('player')] = GetCVar("autoSelfCast")
            end
        end
        if event == "VARIABLES_LOADED" then
            if not SELF_CONFIG then
                SELF_CONFIG = {}
                SELF_CONFIG[UnitName('player')] = GetCVar("autoSelfCast")
            end
            sSetter:Show()
        end
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
