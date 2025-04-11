local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local key = _G.Key or ""
local hwid = tostring(game:GetService("RbxAnalyticsService"):GetClientId())

local response
pcall(function()
    response = HttpService:PostAsync(
        "http://YOUR_SERVER_IP:5000/validate", -- ← thay bằng địa chỉ server thực
        HttpService:JSONEncode({ key = key, hwid = hwid }),
        Enum.HttpContentType.ApplicationJson
    )
end)

if not response then
    LocalPlayer:Kick("🚫 Lỗi xác thực. Vui lòng thử lại sau.")
    return
end

local result = HttpService:JSONDecode(response)
if result.valid then
    -- Nhúng script chính nếu hợp lệ
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ShibaCoBoNhi/Obi/refs/heads/main/Obi.lua"))()
else
    if result.reason == "wrong_hwid" then
        LocalPlayer:Kick("⚠️ Key này đã được dùng trên thiết bị khác. Vui lòng reset HWID.")
    elseif result.reason == "invalid_key" then
        LocalPlayer:Kick("❌ Key không hợp lệ. Vui lòng nhập lại.")
    else
        LocalPlayer:Kick("🚫 Lỗi không xác định.")
    end
end
