local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "KQ HUB",
    SubTitle = "by KQ",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Spin = Window:AddTab({ Title = "Spin", Icon = "" }),
    autospin = Window:AddTab({ Title = "Auto Spin", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    
}

-------- Local function--------
local Options = Fluent.Options
local reroll = false
local roll="Clans"
local slot=1
local autspin=false
local autoroll="Clans"
local autoslot=1
local autoclan="Haruno"
local autoelement="Fire"
local autofamily="Healer"
local configname="Default"
local clannow=" "
-------------------------------


---MAIN TAB------

    
Tabs.Main:AddButton({
    Title = "Remote Spy",
    Description = "Open Spy",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))()
    end
})
Tabs.Main:AddButton({
    Title = "DEX",
    Description = "Open DEX",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end
})

local infspin = Tabs.Main:AddToggle("infspin", {Title = "Toggle", Default = false })

infspin:OnChanged(function()
    print("Toggle changed:", Options.infspin.Value)
    if Options.infspin.Value then
        print("Inf spin on")
        local args0 = {
            "CustomizeSave",
            {
                1,
                1,
                1,
                1,
                1,
                {
                    ["Saturation\195\191"] = workspace,
                    ["Hue\195\191"] = workspace,
                    ["Value\195\191"] = workspace
                },
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SaveDataFunction"):InvokeServer(unpack(args0))
    else
        print("Inf spin off")
        local args0 = {
            "CustomizeSave",
            {
                2,
                3,
                20,
                1,
                1,
                {
                    Hue = 0,
                    Saturation = 0,
                    Value = 0
                },
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SaveDataFunction"):InvokeServer(unpack(args0))
        
    end
end)

Tabs.Main:AddButton({
    Title = "Rejoin",
    Description = "Tab to rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})


---- Spin Tab-----

local Name = Tabs.Spin:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {"Clans","Elements","Family"},
    Multi = false,
    Default = 1,
})

Name:SetValue("Clans")

Name:OnChanged(function(Value)
    roll= Value
    
end)

-----------------Auto Spin Tab----------------
local autoname = Tabs.autospin:AddDropdown("autoname", {
    Title = "Clan/Ele/Fam",
    Values = {"Clans","Elements","Family"},
    Multi = false,
    Default = 1,
})

autoname:SetValue("Clans")

autoname:OnChanged(function(Value)
    autoroll= Value
   print("AUTO ROLL",autoroll) 
end)
local autochooseslot = Tabs.autospin:AddDropdown("autochooseslot", {
    Title = "Slot",
    Values = {1,2,3,4,5},
    Multi = false,
    Default = 1,
})

autochooseslot:SetValue(1)

autochooseslot:OnChanged(function(Value)
    autoslot= Value
   print("AUTO SLOT",autoslot) 
end)


local autochooseclan = Tabs.autospin:AddDropdown("autochooseclan", {
    Title = "Choose Clan",
    Values = {
        "Haruno",
        "Yamanaka",
        "Nara",
        "Bone",
        "Namikaze",
        "Lee",
        "Hyuga",
        "Uchiha Madara",
        "Uchiha Sasuke",
        "Uchiha Obito",
        "Uchiha Itachi",
        "Uchiha Shisul",
        "Rinnegan",
    },
    Multi = false,
    Default = 1,
})

autochooseclan:SetValue("Haruno")

autochooseclan:OnChanged(function(Value)
    autoclan = Value
   print("AUTO CLAN",autoclan) 
end)

local autochoosefamily = Tabs.autospin:AddDropdown("autochoosefamily", {
    Title = "Choose Family",
    Values = {
        "Healer",
        "Soul",
        "Shadow",
        "Bug",
        "Dog",
        "Expansion",
        "Bone",
        "Uzumaki",
        "Fighter",
        "Yellow Thunder",
        "Mankey",
        "Red Eyes",
        "White Eyes",
        "Wood",
        "Rikudou",
        "Purple Eyes",
    },
    Multi = false,
    Default = 1,
})

autochoosefamily:SetValue("Haruno")

autochoosefamily:OnChanged(function(Value)
    autofamily = Value
   print("AUTO Family",autofamily) 
end)

local Turnauto = Tabs.autospin:AddToggle("turnauto", {Title = "Turn auto", Default = false })

    Turnauto:OnChanged(function()
        if Options.turnauto.Value then
            game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
            local args2 = {
                "CustomizeSave",
                {
                    1,
                    1,
                    1,
                    1,
                    1,
                    {
                        ["Saturation\195\191"] = workspace,
                        ["Hue\195\191"] = workspace,
                        ["Value\195\191"] = workspace
                    },
                    1
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SaveDataFunction"):InvokeServer(unpack(args2))
        
        end
        
        
        while Options.turnauto.Value do
            local args1 = {
                autoroll,
                {
                    IndexSlot = autoslot
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SpinDataFunction"):InvokeServer(unpack(args1))
                local checknow=workspace.PlayerData_[autoroll]:GetChildren()[autoslot].Name
            print(checknow)
            print(workspace.PlayerData_.Spins.ClanSpins.Value)
             if autoclan==checknow  then
                local args = {
                    "CustomizeSave",
                    {
                        2,
                        3,
                        20,
                        1,
                        1,
                        {
                            Hue = 0,
                            Saturation = 0,
                            Value = 0
                        },
                        1
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SaveDataFunction"):InvokeServer(unpack(args))
                
                Options.turnauto:SetValue(false)               
             end
            if workspace.PlayerData_.Spins.ClanSpins.Value==0 then
                
                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)        
            end
            
            task.wait(2)
        end
    end)

    














-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("KQHub")
SaveManager:SetFolder("KQHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "KQHUB",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
