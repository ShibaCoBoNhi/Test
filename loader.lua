local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

if not _G.Key then
    game.Players.LocalPlayer:Kick("⚠️ Vui lòng nhập key bằng cách dùng _G.Key = \"your_key\" trước khi load script.")
    return
end

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local url = "http://192.168.1.111:5000/verify?key=" .. _G.Key .. "&hwid=" .. hwid

local response = HttpService:JSONDecode(game:HttpGet(url))

if response.success then
    loadstring(game:HttpGet("http://192.168.1.111:5000/script.lua"))()
else
    local reason = response.reason or "Không rõ lý do"
    game.Players.LocalPlayer:Kick("❌ Truy cập bị từ chối: " .. reason)
end

local DragonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ShibaCoBoNhi/UIk/refs/heads/main/upFix8.lua"))()
    local Window = DragonLib:Start({
    ["Name"] = "Quake Hub Premium",
    ["Description"] = "Version0.1",
    ["Info Color"] = Color3.fromRGB(13, 182, 255),
    ["Tab Width"] = 135,
    ["Color"] = Color3.fromRGB(13, 182, 255),
    ["CloseCallBack"] = function() end
  })
local MainTab = Window:MakeTab("Main")
local Section = MainTab:Section({["Title"] = "Information", ["Content"] = ""})
local Seperator = Section:Seperator("Local Player")

local Paragraph = Section:Paragraph({
    ["Title"] = "Paragraph",
    ["Content"] = ""
})

local Paragraph1 = Section:Paragraph({
    ["Title"] = "Paragraph",
    ["Content"] = "This is a Paragraph"
})
local Button = Section:Button({
    ["Title"] = "Button",
    ["Content"] = "",
    ["Callback"] = function()
        print("Button Clicked!")
    end
})
local Button1 = Section:Button({
    ["Title"] = "Button",
    ["Content"] = "This is a Button",
    ["Callback"] = function()
        print("Button Clicked!")
    end
})
local TextInput = Section:TextInput({
    ["Title"] = "Text Input",
    ["Content"] = "",
    ["Place Holder Text"] = "Enter you text here...",
    ["Clear Text On Focus"] = true,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local TextInput1 = Section:TextInput({
    ["Title"] = "Text Input",
    ["Content"] = "This is a Text Input",
    ["Place Holder Text"] = "Enter you text here...",
    ["Clear Text On Focus"] = true,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local Toggle = Section:Toggle({
	["Title"]= "Toggle",
	["Content"] = "",
	["Default"] = true,
	["Callback"] = function(Value) 
		print(Value)
	end
})
local Toggle1 = Section:Toggle({
	["Title"]= "Toggle",
	["Content"] = "This is a Toggle",
	["Default"] = false,
	["Callback"] = function(Value) 
		print(Value)
	end
})
local Slider = Section:Slider({
    ["Title"] = "Slider",
    ["Content"] = "",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Increment"] = 1,
    ["Default"] = 30,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local Slider1 = Section:Slider({
    ["Title"] = "Slider",
    ["Content"] = "This is a Slider",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Increment"] = 1,
    ["Default"] = 30,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local Dropdown = Section:Dropdown({
    ["Title"] = "Dropdown",
    ["Multi"] = true,
    ["Options"] = {"Option 1", "Option 2"},
    ["Default"] = {"Option 1"},
    ["Place Holder Text"] = "Select Options",
    ["Callback"] = function(Value)
        print(Value)
    end
})
local ProfileTab = Window:MakeTab("Profile")

