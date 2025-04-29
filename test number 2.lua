local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Jockey's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "CHICKEN JOCKEY",
   LoadingSubtitle = "by jock",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "jJrcVVCM", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "STEVES KEY SYSTEM",
      Subtitle = "BETA VERSION",
      Note = "THIS IS A WIP", -- Use this to tell the user how to get a key
      FileName = "idk wtf this is", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/Nq0M1FCg"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Universal", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Oh them? Their the villagers!",
   Content = "They Love Crushing Loaf",
   Duration = 5,
   Image = "hand-metal",
})

local Button = MainTab:CreateButton({
   Name = "Infinite Yield (You can use the buttons below)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump (Toggle)",
   Callback = function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed Slider",
   Range = {0, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Noclip (Toggle)",
   Callback = function()
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local ExitButton = Instance.new("TextButton")
local Plr = Players.LocalPlayer
local Clipon = false

Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.098, 0.098, 0.098)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.4, 0, 0.3, 0)
BG.Size = UDim2.new(0, 250, 0, 180)
BG.Active = true
BG.Draggable = true  -- Ensures the box is draggable

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266, 0.003, 0.627)
Title.Size = UDim2.new(0, 250, 0, 40)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 32
Title.TextXAlignment = Enum.TextXAlignment.Center

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266, 0.003, 0.627)
Toggle.Position = UDim2.new(0.15, 0, 0.35, 0)
Toggle.Size = UDim2.new(0, 180, 0, 40)
Toggle.Font = Enum.Font.Highway
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 26
Toggle.TextXAlignment = Enum.TextXAlignment.Center

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.Position = UDim2.new(0.25, 0, 0.65, 0)
StatusPF.Size = UDim2.new(0, 70, 0, 25)
StatusPF.Font = Enum.Font.Highway
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 22
StatusPF.TextXAlignment = Enum.TextXAlignment.Center

Status.Name = "Status"
Status.Parent = BG
Status.Position = UDim2.new(0.55, 0, 0.65, 0)
Status.Size = UDim2.new(0, 70, 0, 25)
Status.Font = Enum.Font.Highway
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666, 0, 0)
Status.TextSize = 20
Status.TextXAlignment = Enum.TextXAlignment.Center

Credit.Name = "Credit"
Credit.Parent = BG
Credit.Position = UDim2.new(0.2, 0, 0.85, 0)
Credit.Size = UDim2.new(0, 150, 0, 20)
Credit.Font = Enum.Font.SourceSans
Credit.Text = "Modded by BR3XALITY"  -- Changed "Created by" to "Modded by"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 18
Credit.TextXAlignment = Enum.TextXAlignment.Center

ExitButton.Name = "ExitButton"
ExitButton.Parent = BG
ExitButton.BackgroundColor3 = Color3.new(1, 0, 0)
ExitButton.Position = UDim2.new(0.9, 0, 0, 0)
ExitButton.Size = UDim2.new(0, 25, 0, 25)
ExitButton.Font = Enum.Font.Highway
ExitButton.Text = "X"
ExitButton.TextColor3 = Color3.new(1, 1, 1)
ExitButton.TextSize = 16
ExitButton.TextXAlignment = Enum.TextXAlignment.Center

Toggle.MouseButton1Click:Connect(function()
    if Status.Text == "off" then
        Clipon = true
        Status.Text = "on"
        Status.TextColor3 = Color3.new(0, 1, 0)
        Stepped = RunService.Stepped:Connect(function()
            if Clipon then
                for _, b in pairs(Workspace:GetChildren()) do
                    if b.Name == Plr.Name then
                        for _, v in pairs(b:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    else
        Clipon = false
        Status.Text = "off"
        Status.TextColor3 = Color3.new(1, 0, 0)
    end
end)

ExitButton.MouseButton1Click:Connect(function()
    Noclip:Destroy()
end)
end,
})

local Button = MainTab:CreateButton({
   Name = "Jump Power (Made By ChatGpt)",
   Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")

-- Initial settings
local jumpPower = 100
local maxJumpPower = 1000
local minJumpPower = 0
local step = 50

humanoid.UseJumpPower = true
humanoid.JumpPower = jumpPower

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpPowerDisplay"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- JumpPower Display Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(0, 10, 0, 10)
label.BackgroundTransparency = 0.3
label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 24
label.Text = "JumpPower: " .. jumpPower
label.Parent = screenGui

-- Instructions Label
local instructions = Instance.new("TextLabel")
instructions.Size = UDim2.new(0, 300, 0, 60)
instructions.Position = UDim2.new(0, 10, 0, 70)
instructions.BackgroundTransparency = 0.3
instructions.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
instructions.TextColor3 = Color3.new(1, 1, 1)
instructions.Font = Enum.Font.SourceSans
instructions.TextSize = 18
instructions.TextWrapped = true
instructions.Text = "Press [E] to increase\nPress [Q] to decrease\nPress [C] to close"
instructions.Parent = screenGui

-- Function to update JumpPower
local function updateJumpPower(amount)
	jumpPower = math.clamp(jumpPower + amount, minJumpPower, maxJumpPower)
	humanoid.JumpPower = jumpPower
	label.Text = "JumpPower: " .. jumpPower
end

-- Function to close the GUI
local function closeGui()
	screenGui:Destroy()
end

-- Keybinds
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	-- Increase JumpPower (E)
	if input.KeyCode == Enum.KeyCode.E then
		updateJumpPower(step)
	-- Decrease JumpPower (Q)
	elseif input.KeyCode == Enum.KeyCode.Q then
		updateJumpPower(-step)
	-- Close GUI (C)
	elseif input.KeyCode == Enum.KeyCode.C then
		closeGui()
	end
end)

   end,
})

local UniversalAimbotandESPTab = Window:CreateTab("Universal Aimbot and ESP", nil) -- Title, Image
local UniversalAimbotandESPSection = UniversalAimbotandESPTab:CreateSection("Note: Not Tested in All Games")

local Button = UniversalAimbotandESPTab:CreateButton({
   Name = "Aimbot and ESP -Not fully functional-",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ttwizz/Open-Aimbot/refs/heads/master/source.lua'))()
   end,
})

local UniversalHitboxExpanderTab = Window:CreateTab("Universal Hitbox Expander", nil) -- Title, Image
local UniversalHitboxExpanderSection = UniversalHitboxExpanderTab:CreateSection("May Not Work In All Games")

local Button = UniversalHitboxExpanderTab:CreateButton({
   Name = "Hitbox Expander #1",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
   end,
})

local ChatBypassTab = Window:CreateTab("Chat Bypasses (Use At Your Own Risk)", nil) -- Title, Image
local ChatBypassSection = ChatBypassTab:CreateSection("Chat Bypasses (Very Bannable)")

local Button = ChatBypassTab:CreateButton({
   Name = "Cat Bypass",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/jockopw/catpass/refs/heads/main/cat",true))()   
  end,
})

local Button = ChatBypassTab:CreateButton({
   Name = "Anna Bypasser",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true))()
   end,
})

local Button = ChatBypassTab:CreateButton({
   Name = "Cat Bypass Notes- Closes UI and is buggy",
   Callback = function()
        print ("sorry :(")
   end,
})

local Button = ChatBypassTab:CreateButton({
   Name = "Anna Bypasser Notes-This Script dosent work on all games and is bannable",
   Callback = function()
        print ("sorry abt the bug tho")
   end,
})

local AnimationsTab = Window:CreateTab("Animations (R6)", nil) -- Title, Image
local AnimationsSection = AnimationsTab:CreateSection("FOR R6")

local Button = AnimationsTab:CreateButton({
   Name = "320+ Animations Hub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
   end,
})

local AnimationTab = Window:CreateTab("Animation (R15)", nil) -- Title, Image
local AnimationSection = AnimationTab:CreateSection("FOR R15")

local Button = AnimationTab:CreateButton({
   Name = "Walk Animations/Other Stuff",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BeemTZy/Motiona/refs/heads/main/source.lua"))()
   end,
})

local MurderMystery2Tab = Window:CreateTab("Murder Mystery 2", nil) -- Title, Image
local MurderMystery2Section = MurderMystery2Tab:CreateSection("For MM2! (Buggy)")

local Button = MurderMystery2Tab:CreateButton({
   Name = "Foggy Hub",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-piano-reborn/refs/heads/main/scr"))()
   end,
})

local Button = MurderMystery2Tab:CreateButton({
   Name = "YHub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/YHUB-Community/refs/heads/main/Murder-Mystery2"))()
   end,
})

local Button = MurderMystery2Tab:CreateButton({
   Name = "Vertex Hub",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring'))()
   end,
})

local DressToImpressTab = Window:CreateTab("Dress To Impress", nil) -- Title, Image
local DressToImpressSection = DressToImpressTab:CreateSection("Dress To Impress")

local Button = DressToImpressTab:CreateButton({
   Name = "Dress To Impress Script #1",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/DTI-GUI-V2/main/dti_gui_v2.lua",true))()
   end,
})

local DeadRailsTab = Window:CreateTab("Dead Rails", nil) -- Title, Image
local DeadRailsSection = DeadRailsTab:CreateSection("Dead Rails Scripts!")

local Button = DeadRailsTab:CreateButton({
   Name = "Dead Rails Anticheat Bypass (VERY IMPORTANT)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AmareScripts/DeadRails/refs/heads/main/Bypass%25AntiCheat.lua"))()
   end,
})

local Button = DeadRailsTab:CreateButton({
   Name = "Dead Rails Script #1",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiderScriptRB/Dead-Rails-SpiderXHub-Script/refs/heads/main/SpiderXHub%202.0.txt"))()
   end,
})

local Button = DeadRailsTab:CreateButton({
   Name = "Achievement Autofarm (Works For Anything)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/newpacifisct/refs/heads/main/newpacifisct.lua"))()
   end,
})

local Button = DeadRailsTab:CreateButton({
   Name = "Autofarm Bonds",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Keyless-auto-bonds/refs/heads/main/obfuscated%20(6).txt'))()
   end,
})

local Button = DeadRailsTab:CreateButton({
   Name = "General Dead Rails Script",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/hungquan99/SkullHub/main/loader.lua'))()
   end,
})

local ZombieUprisingTab = Window:CreateTab("Zombie Uprising", nil)
local ZombieUprisingSection = ZombieUprisingTab:CreateSection("For Zombie Uprising")

local Button = ZombieUprisingTab:CreateButton({
   Name = "Zombie Uprising (Might Not Work On All Guns)",
   Callback = function()
--> Gun Mods | Zombie Uprising | By: unauth0rised on discord
local StarterGui = game:GetService("StarterGui")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
StarterGui:SetCore("SendNotification", {
    Title = "Zombie Uprising",
    Text = "Equip your gun again!",
    Duration = 5
})

for i,v in next, getsenv(ReplicatedFirst.Framework) do
    if type(v) == "function" then
        for i, v in next, debug.getupvalues(v) do
            if type(v) == "table" then
                for i, v in next, v do
                    if i == "gunmodulestorage" then
                        for i, v in next, v do
                            if v.spread then
                                v.spread = {
                                    Increase = 0,
                                    Decrease = 0,
                                    Max = 0,
                                    Min = 0
                                }
                            end
                            if v.mode then
                                v.mode = "Auto"
                            end
                            if v.recoil then
                                v.recoil = {
                                    Aimed = 0,
                                    FirstShot = 0,
                                    Tilt = {
                                        [1] = 0,
                                        [2] = 0,
                                    },
                                    Side = {
                                        [1] = 0,
                                        [2] = 0,
                                    },
                                    Vertical = {
                                        [1] = 0,
                                        [2] = 0,
                                    },
                                    Back = {
                                        [1] = 0,
                                        [2] = 0,
                                    },
                                }
                            end
                            if v.rpm then
                                v.rpm = 1000000000000000 --> buggy as hell, comment it out if you dont want it1!!
                            end
                        end
                    end
                end
            end
        end
    end
end
   end,
})

local DoorsTab = Window:CreateTab("Doors", nil) -- Title, Image
local DoorsSection = DoorsTab:CreateSection("For Doors")

local Button = DoorsTab:CreateButton({
   Name = "Doors Script #1 (Very Buggy)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
   end,
})

local Button = DoorsTab:CreateButton({
   Name = "Doors Script #2 (Not Tested)",
   Callback = function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))() 
   end,
})

local Button = DoorsTab:CreateButton({
   Name = "Doors Script #3 (Not Tested)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/jockopw/iamnotskidding/refs/heads/main/noskid.lua'))()
   end,
})

local Button = DoorsTab:CreateButton({
   Name = "Doors Script #4 (Not Tested)",
   Callback = function()
loadstring(game:HttpGet(('https://pastebin.com/raw/9QPGnLx6'),true))()
   end,
})

local Button = DoorsTab:CreateButton({
   Name = "Doors Script #5 (Not Tested)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))() 
   end,
})
	
