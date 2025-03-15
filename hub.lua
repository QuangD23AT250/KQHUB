local namehub="KQ HUB"
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = namehub,
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "nhincl"
}

---local 
local reroll = false
local roll="Clans"
local slot=1


------- Game tab
local Chucnang = GUI:Tab{
	Name = "Chuc Nang",
	Icon = "rbxassetid://8569322835"
}
Chucnang:Button{
	Name = "rejoin",
	Description = nil,
	Callback = function() 
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)

    end
}
Chucnang:Button{
	Name = "Remote Spy",
	Description = nil,
	Callback = function() 
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))()

    end
}
Chucnang:Dropdown{
	Name = "Clan/Fam/Ele",
	StartingText = "Select...",
	Description = nil,
	Items = {
		"Clans",
        "Elements",
        "Family",
	},
	Callback = function(item) 
        roll=item
        print(roll)
         end
}
Chucnang:Dropdown{
	Name = "Slot",
	StartingText = "Select...",
	Description = nil,
	Items = {
		1,
        2,
        3,
	},
	Callback = function(item) 
        slot=item
        print(slot)
         end
}
Chucnang:Button{
	Name = "Spin",
	Description = nil,
	Callback = function() 
        local args = {
            roll,
            {
                IndexSlot = slot
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SpinDataFunction"):InvokeServer(unpack(args))
        GUI:Notification{
            Title = "Alert",
            Text = "You shall bump the thread on V3rmillion!",
            Duration = 3,
            Callback = function() end
        }
    end
}


Chucnang:Toggle{
	Name = "Vocucspin",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
            reroll = state
            if reroll==true then
                local args = {
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
                game:GetService("ReplicatedStorage"):WaitForChild("_remotes"):WaitForChild("SaveDataFunction"):InvokeServer(unpack(args))
                
            end
            if reroll==false then
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
                
            end
    end
}
