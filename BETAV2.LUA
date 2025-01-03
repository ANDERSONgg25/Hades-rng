loadstring(game:HttpGet("https://raw.githubusercontent.com/ANDERSONgg25/ATI/main/Getgenv"))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/ANDERSONgg25/GGUI/main/Source.Lua%20(1).txt")))()

MakeWindow({
    Hub = {
        Title = "RYUMAN HUB",
        Animation = "by FINO444"
    },
    Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
            Notifications = true,
            CorrectKey = "Running the Script...",
            Incorrectkey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

MinimizeButton({
    Image = "rbxassetid://109858239124011",
    Size = {40, 40},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = true,
    StrokeColor = Color3.fromRGB(249, 0, 0)
})

local Main = MakeTab({Name = "Main"})

AddToggle(Main, {
    Name = "Auto Collect Bring✅ + GwaGwa✅ Pray✅ Lunaris✅ Maxwell❌",
    Default = false,
    Callback = function(value)
        getgenv().bringEnabled = value
        if getgenv().bringEnabled then
            getgenv().bringLoop = getgenv().runService.Heartbeat:Connect(function()
                getgenv().bringObjectsToPlayer()
            end)
        else
            if getgenv().bringLoop then
                getgenv().bringLoop:Disconnect()
                getgenv().bringLoop = nil
            end
        end
    end
})

AddToggle(Main, {
    Name = "Auto Collect tp✅ + GwaGwa✅ Pray✅ Lunaris✅ Maxwell✅",
    Default = false,
    Callback = function(value)
        getgenv().tpEnabled = value
        if getgenv().tpEnabled then
            getgenv().tpLoop = getgenv().runService.Heartbeat:Connect(function()
                getgenv().teleportToObjects()
            end)
        else
            if getgenv().tpLoop then
                getgenv().tpLoop:Disconnect()
                getgenv().tpLoop = nil
            end
        end
    end
})
