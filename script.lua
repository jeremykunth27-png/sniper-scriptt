-- SNIPER PRIVATE
-- LocalScript in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local CorrectKey = "sniperprivatecheat"

local Settings = {
	Aimbot = false,
	Boxes = false,
	Names = false,
	Distance = false,
	Fly = false,
	Noclip = false,
	Speed = false,
	InfiniteJump = false,
	TeamCheck = false,
	RainbowSky = false,
	ThirdPerson = false,
}

-- Alte GUI entfernen
local OldGui = PlayerGui:FindFirstChild("SniperPrivateGUI")
if OldGui then
	OldGui:Destroy()
end

local function Corner(Object, Radius)
	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0, Radius)
	C.Parent = Object
end

local function Stroke(Object, Color)
	local S = Instance.new("UIStroke")
	S.Color = Color
	S.Thickness = 1
	S.Parent = Object
end

-- GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "SniperPrivateGUI"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = PlayerGui

-- KEY MENU
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.fromOffset(360, 210)
KeyFrame.Position = UDim2.new(0.5, -180, 0.5, -105)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 13, 30)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = Gui
Corner(KeyFrame, 6)
Stroke(KeyFrame, Color3.fromRGB(120, 60, 190))

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.Position = UDim2.fromOffset(0, 15)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "SNIPER PRIVATE"
KeyTitle.TextColor3 = Color3.fromRGB(210, 130, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 20
KeyTitle.Parent = KeyFrame

local KeySubTitle = Instance.new("TextLabel")
KeySubTitle.Size = UDim2.new(1, 0, 0, 25)
KeySubTitle.Position = UDim2.fromOffset(0, 60)
KeySubTitle.BackgroundTransparency = 1
KeySubTitle.Text = "ENTER ACCESS KEY"
KeySubTitle.TextColor3 = Color3.fromRGB(150, 140, 165)
KeySubTitle.Font = Enum.Font.Gotham
KeySubTitle.TextSize = 11
KeySubTitle.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.fromOffset(300, 40)
KeyBox.Position = UDim2.new(0.5, -150, 0, 95)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 23, 50)
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "Enter key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 110, 135)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.ClearTextOnFocus = false
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 13
KeyBox.Parent = KeyFrame
Corner(KeyBox, 5)

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.fromOffset(300, 38)
SubmitButton.Position = UDim2.new(0.5, -150, 0, 145)
SubmitButton.BackgroundColor3 = Color3.fromRGB(120, 55, 190)
SubmitButton.BorderSizePixel = 0
SubmitButton.Text = "UNLOCK"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 12
SubmitButton.Parent = KeyFrame
Corner(SubmitButton, 5)

-- MAIN MENU
local Menu = Instance.new("Frame")
Menu.Size = UDim2.fromOffset(440, 400)
Menu.Position = UDim2.new(0.5, -220, 0.5, -200)
Menu.BackgroundColor3 = Color3.fromRGB(20, 13, 30)
Menu.BorderSizePixel = 0
Menu.Visible = false
Menu.Parent = Gui
Corner(Menu, 5)
Stroke(Menu, Color3.fromRGB(120, 60, 190))

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.fromOffset(115, 400)
Sidebar.BackgroundColor3 = Color3.fromRGB(28, 17, 42)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Menu
Corner(Sidebar, 5)

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(1, 0, 0, 55)
Logo.BackgroundTransparency = 1
Logo.Text = "SNIPER\nPRIVATE"
Logo.TextColor3 = Color3.fromRGB(205, 130, 255)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 14
Logo.Parent = Sidebar

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -115, 1, 0)
Content.Position = UDim2.fromOffset(115, 0)
Content.BackgroundTransparency = 1
Content.Parent = Menu

local Pages = {}
local ActiveButton

local function CreatePage(Name)
	local Page = Instance.new("Frame")
	Page.Name = Name
	Page.Size = UDim2.fromScale(1, 1)
	Page.BackgroundTransparency = 1
	Page.Visible = false
	Page.Parent = Content
	Pages[Name] = Page
	return Page
end

local Legit = CreatePage("Legit")
local Visual = CreatePage("Visual")
local Misc = CreatePage("Misc")

local function CreateTitle(Page, Text)
	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -30, 0, 48)
	Title.Position = UDim2.fromOffset(18, 0)
	Title.BackgroundTransparency = 1
	Title.Text = Text
	Title.TextColor3 = Color3.fromRGB(240, 230, 250)
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 17
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Page
end

local function CreateToggle(Page, Text, Y, SettingName)
	local Row = Instance.new("Frame")
	Row.Size = UDim2.new(1, -36, 0, 38)
	Row.Position = UDim2.fromOffset(18, Y)
	Row.BackgroundColor3 = Color3.fromRGB(30, 20, 43)
	Row.BorderSizePixel = 0
	Row.Parent = Page
	Corner(Row, 4)

	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1, -70, 1, 0)
	Label.Position = UDim2.fromOffset(12, 0)
	Label.BackgroundTransparency = 1
	Label.Text = Text
	Label.TextColor3 = Color3.fromRGB(225, 220, 235)
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 12
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = Row

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.fromOffset(46, 22)
	Button.Position = UDim2.new(1, -56, 0.5, -11)
	Button.BackgroundColor3 = Color3.fromRGB(70, 45, 90)
	Button.BorderSizePixel = 0
	Button.Text = "OFF"
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 9
	Button.Parent = Row
	Corner(Button, 11)

	Button.MouseButton1Click:Connect(function()
		Settings[SettingName] = not Settings[SettingName]

		if Settings[SettingName] then
			Button.Text = "ON"
			Button.BackgroundColor3 = Color3.fromRGB(145, 60, 220)
		else
			Button.Text = "OFF"
			Button.BackgroundColor3 = Color3.fromRGB(70, 45, 90)
		end
	end)
end

local function CreateTab(Text, Y, PageName)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, -12, 0, 34)
	Button.Position = UDim2.fromOffset(6, Y)
	Button.BackgroundColor3 = Color3.fromRGB(28, 17, 42)
	Button.BorderSizePixel = 0
	Button.Text = Text
	Button.TextColor3 = Color3.fromRGB(220, 210, 235)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 11
	Button.TextXAlignment = Enum.TextXAlignment.Left
	Button.Parent = Sidebar
	Corner(Button, 4)

	Button.MouseButton1Click:Connect(function()
		for _, Page in pairs(Pages) do
			Page.Visible = false
		end

		Pages[PageName].Visible = true

		if ActiveButton then
			ActiveButton.BackgroundColor3 = Color3.fromRGB(28, 17, 42)
		end

		Button.BackgroundColor3 = Color3.fromRGB(65, 35, 90)
		ActiveButton = Button
	end)

	return Button
end

-- LEGIT PAGE
CreateTitle(Legit, "LEGIT")
CreateToggle(Legit, "Aimbot [Right Mouse]", 55, "Aimbot")
CreateToggle(Legit, "Team Check", 100, "TeamCheck")

-- VISUAL PAGE
CreateTitle(Visual, "VISUAL")
CreateToggle(Visual, "Boxes", 55, "Boxes")
CreateToggle(Visual, "Names", 100, "Names")
CreateToggle(Visual, "Distance", 145, "Distance")

-- MISC PAGE
CreateTitle(Misc, "MISC")
CreateToggle(Misc, "Fly", 55, "Fly")
CreateToggle(Misc, "Noclip", 100, "Noclip")
CreateToggle(Misc, "Speed", 145, "Speed")
CreateToggle(Misc, "Infinite Jump", 190, "InfiniteJump")
CreateToggle(Misc, "Rainbow Sky", 235, "RainbowSky")
CreateToggle(Misc, "Third Person", 280, "ThirdPerson")

local LegitButton = CreateTab("  LEGIT", 65, "Legit")
CreateTab("  VISUAL", 105, "Visual")
CreateTab("  MISC", 145, "Misc")

Legit.Visible = true
LegitButton.BackgroundColor3 = Color3.fromRGB(65, 35, 90)
ActiveButton = LegitButton

-- KEY CHECK
local function CheckKey()
	if KeyBox.Text == CorrectKey then
		KeyFrame:Destroy()
		Menu.Visible = true
	else
		KeyBox.Text = ""
		KeyBox.PlaceholderText = "INVALID KEY!"
	end
end

SubmitButton.MouseButton1Click:Connect(CheckKey)

KeyBox.FocusLost:Connect(function(EnterPressed)
	if EnterPressed then
		CheckKey()
	end
end)

-- DRAG MENU
local Dragging = false
local DragStart
local StartPosition

Menu.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = true
		DragStart = Input.Position
		StartPosition = Menu.Position
	end
end)

UIS.InputChanged:Connect(function(Input)
	if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
		local Delta = Input.Position - DragStart

		Menu.Position = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = false
	end
end)

-- OPEN / CLOSE
UIS.InputBegan:Connect(function(Input, Processed)
	if Processed then
		return
	end

	if Input.KeyCode == Enum.KeyCode.RightShift then
		Menu.Visible = not Menu.Visible
	end
end)

-- GET CLOSEST PLAYER
local function GetClosestPlayer()
	local CurrentCamera = Workspace.CurrentCamera

	if not CurrentCamera then
		return nil
	end

	local MousePosition = UIS:GetMouseLocation()
	local ClosestPlayer = nil
	local ClosestDistance = math.huge

	for _, Target in ipairs(Players:GetPlayers()) do
		if Target ~= Player then
			if not Settings.TeamCheck or Target.Team ~= Player.Team then
				local Character = Target.Character
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
				local Root = Character and Character:FindFirstChild("HumanoidRootPart")

				if Humanoid and Humanoid.Health > 0 and Root then
					local Position, Visible = CurrentCamera:WorldToViewportPoint(Root.Position)

					if Visible and Position.Z > 0 then
						local Distance = (
							Vector2.new(Position.X, Position.Y) - MousePosition
						).Magnitude

						if Distance < ClosestDistance then
							ClosestDistance = Distance
							ClosestPlayer = Target
						end
					end
				end
			end
		end
	end

	return ClosestPlayer
end

-- AIM ASSIST
RunService.RenderStepped:Connect(function()
	if not Settings.Aimbot then
		return
	end

	if not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
		return
	end

	local Target = GetClosestPlayer()

	if not Target or not Target.Character then
		return
	end

	local Root = Target.Character:FindFirstChild("HumanoidRootPart")
	local CurrentCamera = Workspace.CurrentCamera

	if Root and CurrentCamera then
		local TargetCFrame = CFrame.new(
			CurrentCamera.CFrame.Position,
			Root.Position
		)

		CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(TargetCFrame, 0.8)
	end
end)

-- ESP
local function UpdateESP()
	for _, Target in ipairs(Players:GetPlayers()) do
		if Target ~= Player and Target.Character then
			local Character = Target.Character
			local Root = Character:FindFirstChild("HumanoidRootPart")

			if Root then
				local Highlight = Character:FindFirstChild("LocalESPHighlight")

				if Settings.Boxes then
					if not Highlight then
						Highlight = Instance.new("Highlight")
						Highlight.Name = "LocalESPHighlight"
						Highlight.FillTransparency = 1
						Highlight.OutlineTransparency = 0
						Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						Highlight.Parent = Character
					end
				elseif Highlight then
					Highlight:Destroy()
				end

				local Tag = Root:FindFirstChild("LocalESPTag")

				if Settings.Names or Settings.Distance then
					if not Tag then
						Tag = Instance.new("BillboardGui")
						Tag.Name = "LocalESPTag"
						Tag.Size = UDim2.fromOffset(160, 45)
						Tag.StudsOffset = Vector3.new(0, 3.5, 0)
						Tag.AlwaysOnTop = true
						Tag.Adornee = Root
						Tag.Parent = Root

						local Info = Instance.new("TextLabel")
						Info.Name = "Info"
						Info.Size = UDim2.fromScale(1, 1)
						Info.BackgroundTransparency = 1
						Info.TextColor3 = Color3.new(1, 1, 1)
						Info.TextStrokeTransparency = 0
						Info.Font = Enum.Font.GothamBold
						Info.TextSize = 12
						Info.Parent = Tag
					end

					local Lines = {}

					if Settings.Names then
						table.insert(Lines, Target.Name)
					end

					if Settings.Distance then
						local MyRoot = Player.Character
							and Player.Character:FindFirstChild("HumanoidRootPart")

						if MyRoot then
							local Distance = math.floor(
								(MyRoot.Position - Root.Position).Magnitude
							)

							table.insert(Lines, Distance .. " studs")
						end
					end

					Tag.Info.Text = table.concat(Lines, "\n")
				elseif Tag then
					Tag:Destroy()
				end
			end
		end
	end
end

RunService.RenderStepped:Connect(UpdateESP)

-- INFINITE JUMP
UIS.JumpRequest:Connect(function()
	if Settings.InfiniteJump then
		local Humanoid = Player.Character
			and Player.Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- SPEED + NOCLIP
RunService.Stepped:Connect(function()
	local Character = Player.Character
	if not Character then
		return
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")

	if Humanoid then
		Humanoid.WalkSpeed = Settings.Speed and 32 or 16
	end

	if Settings.Noclip then
		for _, Part in ipairs(Character:GetDescendants()) do
			if Part:IsA("BasePart") then
				Part.CanCollide = false
			end
		end
	end
end)

-- FLY
RunService.RenderStepped:Connect(function()
	if not Settings.Fly then
		return
	end

	local Character = Player.Character
	local Root = Character and Character:FindFirstChild("HumanoidRootPart")
	local CurrentCamera = Workspace.CurrentCamera

	if not Root or not CurrentCamera then
		return
	end

	local Direction = Vector3.zero

	if UIS:IsKeyDown(Enum.KeyCode.W) then
		Direction += CurrentCamera.CFrame.LookVector
	end
	if UIS:IsKeyDown(Enum.KeyCode.S) then
		Direction -= CurrentCamera.CFrame.LookVector
	end
	if UIS:IsKeyDown(Enum.KeyCode.A) then
		Direction -= CurrentCamera.CFrame.RightVector
	end
	if UIS:IsKeyDown(Enum.KeyCode.D) then
		Direction += CurrentCamera.CFrame.RightVector
	end
	if UIS:IsKeyDown(Enum.KeyCode.Space) then
		Direction += Vector3.new(0, 1, 0)
	end
	if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
		Direction -= Vector3.new(0, 1, 0)
	end

	if Direction.Magnitude > 0 then
		Root.AssemblyLinearVelocity = Direction.Unit * 50
	else
		Root.AssemblyLinearVelocity = Vector3.zero
	end
end)

-- RAINBOW SKY
local OriginalAmbient = Lighting.Ambient
local OriginalOutdoorAmbient = Lighting.OutdoorAmbient
local OriginalColorShiftTop = Lighting.ColorShift_Top
local OriginalColorShiftBottom = Lighting.ColorShift_Bottom

RunService.RenderStepped:Connect(function()
	if Settings.RainbowSky then
		local Hue = (time() * 0.12) % 1
		local Rainbow = Color3.fromHSV(Hue, 0.8, 1)

		Lighting.Ambient = Rainbow
		Lighting.OutdoorAmbient = Rainbow
		Lighting.ColorShift_Top = Rainbow
		Lighting.ColorShift_Bottom = Rainbow
	else
		Lighting.Ambient = OriginalAmbient
		Lighting.OutdoorAmbient = OriginalOutdoorAmbient
		Lighting.ColorShift_Top = OriginalColorShiftTop
		Lighting.ColorShift_Bottom = OriginalColorShiftBottom
	end
end)

-- THIRD PERSON
RunService.RenderStepped:Connect(function()
	if not Settings.ThirdPerson then
		return
	end

	local Character = Player.Character
	local Root = Character and Character:FindFirstChild("HumanoidRootPart")
	local CurrentCamera = Workspace.CurrentCamera

	if not Root or not CurrentCamera then
		return
	end

	-- Kamera hinter dem Spieler
	local CameraPosition =
		Root.Position
		- Root.CFrame.LookVector * 12
		+ Vector3.new(0, 5, 0)

	CurrentCamera.CFrame = CFrame.new(
		CameraPosition,
		Root.Position + Vector3.new(0, 2, 0)
	)
end)

print("SNIPER PRIVATE LOADED")
