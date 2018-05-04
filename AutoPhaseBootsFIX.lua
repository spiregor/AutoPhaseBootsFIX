--AutoPhaseBootsFIX.lua
--Author: spiregor
--Release Date: 04.05.2018
local AutoPhaseBootsFIX = {}                     

AutoPhaseBootsFIX.MenuGetOption = Menu.GetOption({ "Item Specific"}, "Auto Phase Boots")

AutoPhaseBootsFIX.SettingAutoPhaseBoots = nil
AutoPhaseBootsFIX.Check = false

function AutoPhaseBootsFIX.OnUpdate()

	if not Engine.IsInGame() then
		AutoPhaseBootsFIX.Reset()
	end
local myHero = Heroes.GetLocal()
if not myHero then return end
	
	--if AutoPhaseBootsFIX.SettingAutoPhaseBoots == nil or AutoPhaseBootsFIX.SettingAutoPhaseBoots ~= nil then
		AutoPhaseBootsFIX.SettingAutoPhaseBoots = Menu.GetValue(AutoPhaseBootsFIX.MenuGetOption)
	--end
	
	if AutoPhaseBootsFIX.SettingAutoPhaseBoots > 0 then
		if NPC.GetModifier(myHero, "modifier_riki_permanent_invisibility") then
			local Phase_Boots = NPC.GetItem(myHero, "item_phase_boots", true)
		
			if Phase_Boots and Ability.IsCastable(Phase_Boots, 0) and Ability.IsReady(Phase_Boots) and NPC.IsRunning(myHero) then
				Ability.CastNoTarget(Phase_Boots)
			return end
		end
	end
	
	if NPC.GetModifier(myHero, "modifier_windrunner_windrun_invis") then
		if AutoPhaseBootsFIX.SettingAutoPhaseBoots > 0 then
			Menu.SetValue(AutoPhaseBootsFIX.MenuGetOption, 0)
			AutoPhaseBootsFIX.Check = false
		end
	else
		if  AutoPhaseBootsFIX.Check == false then
			Menu.SetValue(AutoPhaseBootsFIX.MenuGetOption, 1)
			AutoPhaseBootsFIX.Check = true
		end
			
	end
	
	
end

function AutoPhaseBootsFIX.Reset()
	
	AutoPhaseBootsFIX.SettingAutoPhaseBoots = nil
	AutoPhaseBootsFIX.Check = false

end

function AutoPhaseBootsFIX.OnGameStart()
	
	AutoPhaseBootsFIX.Reset()
	
end

function AutoPhaseBootsFIX.OnGameEnd()
	
	AutoPhaseBootsFIX.Reset()
	
end

return AutoPhaseBootsFIX