loadstring(game:HttpGet("https://raw.githubusercontent.com/ANDERSONgg25/ATI/main/Getgenv"))()

loadstring(game:HttpGet(("https://raw.githubusercontent.com/ANDERSONgg25/GGUI/main/Source.Lua%20(1).txt")))()

MakeWindow({
    Hub = {
        Title = "RYUMAN HUB",
        Animation = "By: FINO444"
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
local Status = MakeTab({Name = "Status"})

AddButton(Status, {
    Name = "Status Gui",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/ANDERSONgg25/Hades-rng/main/STATUS.GUI.LUA")))()
    end
})

AddToggle(Main, {
    Name = "Auto Collect + GwaGwa + Pray + Bring",
    Default = false,
    Callback = function(value)
        getgenv().bringEnabled = value
    end
})

AddToggle(Main, {
    Name = "Auto Collect + GwaGwa + Pray + tp",
    Default = false,
    Callback = function(value)
        getgenv().teleEnabled = value
    end
})

AddButton(Main, {
    Name = "QuickRoll 75%",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ANDERSONgg25/ATI/main/QuickRoll"))()  
    end
})