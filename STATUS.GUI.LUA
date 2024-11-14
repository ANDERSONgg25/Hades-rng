local Players = game:GetService("Players")
local player = Players.LocalPlayer

local scrollingFrame = player.PlayerGui:WaitForChild("Menu")
    :WaitForChild("Windows")
    :WaitForChild("Inventory")
    :WaitForChild("Handle")
    :WaitForChild("Items")
    :WaitForChild("Lists")
    :WaitForChild("ScrollingFrame")

local existingGui = game:GetService("CoreGui"):FindFirstChild("StatusGUI")
if existingGui then
    existingGui:Destroy()
end

local function createGuiElement(className, properties, parent)
    local element = Instance.new(className)
    for property, value in pairs(properties) do
        element[property] = value
    end
    element.Parent = parent
    return element
end

local screenGui = createGuiElement("ScreenGui", { Name = "StatusGUI" }, game:GetService("CoreGui"))
local statusFrame = createGuiElement("Frame", {
    Size = UDim2.new(0.3, 0, 0.5, 0),
    Position = UDim2.new(0.35, 0, 0.25, 0),
    BackgroundColor3 = Color3.fromRGB(45, 45, 48),
    BorderSizePixel = 0,
    Active = true,
    Draggable = true
}, screenGui)

createGuiElement("UICorner", { CornerRadius = UDim.new(0, 10) }, statusFrame)
createGuiElement("ImageLabel", {
    Size = UDim2.new(1, 20, 1, 20),
    Position = UDim2.new(0, -10, 0, -10),
    BackgroundTransparency = 1,
    Image = "rbxassetid://1316045217",
    ImageColor3 = Color3.fromRGB(20, 20, 20),
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(10, 10, 118, 118),
    ZIndex = -1
}, statusFrame)

local titleLabel = createGuiElement("TextLabel", {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0,
    Text = "Status",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextScaled = true,
    Font = Enum.Font.SourceSansBold
}, statusFrame)

createGuiElement("UICorner", { CornerRadius = UDim.new(0, 10) }, titleLabel)

local scrollingContainer = createGuiElement("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, -30),
    Position = UDim2.new(0, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(40, 40, 40),
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(0, 0, 1, 0),
    ScrollBarThickness = 8,
    ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
}, statusFrame)

createGuiElement("UICorner", { CornerRadius = UDim.new(0, 10) }, scrollingContainer)
local uiListLayout = createGuiElement("UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder
}, scrollingContainer)

local guiLabels = {}

local function convertXToNumber(text)
    return text:match("^%s*[xX](%d+)%s*$") or text
end

local function createStatusLabel(parent, displayText, contentText)
    return createGuiElement("TextLabel", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Text = displayText .. " " .. contentText,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        Font = Enum.Font.SourceSans
    }, parent)
end

local function updateStatus()
    for _, child in pairs(scrollingContainer:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    guiLabels = {}

    for _, frame in pairs(scrollingFrame:GetChildren()) do
        if frame:IsA("Frame") then
            for _, child in pairs(frame:GetChildren()) do
                if child:IsA("TextLabel") then
                    local displayText = frame.Name:lower():find("gwa gwa") and "🟢 " .. frame.Name or frame.Name
                    local textContent = convertXToNumber(child.Text)
                    local newTextLabel = createStatusLabel(scrollingContainer, displayText, textContent)

                    guiLabels[frame.Name .. "-" .. child.Name] = {
                        guiLabel = newTextLabel,
                        textLabel = child
                    }

                    child.Changed:Connect(function(property)
                        if property == "Text" then
                            newTextLabel.Text = displayText .. " " .. convertXToNumber(child.Text)
                        end
                    end)
                end
            end
        end
    end

    scrollingContainer.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y)
end

scrollingFrame.ChildAdded:Connect(updateStatus)
scrollingFrame.ChildRemoved:Connect(updateStatus)

updateStatus()
