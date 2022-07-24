-- 7/24/22 12:58 AM: Fixed an issue where it would break when adding the names sometimes so I added a PCALL to make sure it handles errors properly.
local Players = game:GetService("Players")
game:GetService("RunService").Heartbeat:Connect(function()
   for _, player in pairs(Players:GetPlayers()) do
      local character = workspace:WaitForChild(player.Name)
      local stat = player:WaitForChild("Status")
      local stat2 = player:WaitForChild("NRPBS")
      local role = stat:WaitForChild("Role")
      local hasGun = stat:WaitForChild("HasRevolver")
      local fakeName = stat:WaitForChild("FakeName")
      local minHealth = stat2:WaitForChild("Health").Value
      local maxHealth = stat2:WaitForChild("MaxHealth").Value
      print(fakeName.value.." -- "..role.value..". hasRevolver: "..tostring(hasGun.value))
      local ht = Instance.new("Highlight")
      ht.Parent = character
      ht.Adornee = character
      if role.value == "Bystander" then ht.FillColor = Color3.new(0, 0, 255)
      elseif role.value == "Murderer" then ht.FillColor = Color3.new(255, 0, 0) end
      if hasGun.value == true then ht.FillColor = Color3.new(255, 255, 0) end
        local Foolname = Instance.new("BillboardGui")
        local Foolname_2 = Instance.new("TextLabel")
        --Properties:
        function addName()
        Foolname.Name = "Foolname"
        Foolname.Parent = character
        Foolname.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Foolname.Active = true
        Foolname.Adornee = character.Head
        Foolname.AlwaysOnTop = true
        Foolname.LightInfluence = 1.000
        Foolname.Size = UDim2.new(4, 0, 2, 0)
        Foolname.StudsOffset = Vector3.new(0, 1.5, 0)     
        Foolname_2.Name = "Foolname"
        Foolname_2.Parent = Foolname
        Foolname_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Foolname_2.BackgroundTransparency = 1.000
        Foolname_2.Size = UDim2.new(1, 0, 1, 0)
        Foolname_2.Font = Enum.Font.SourceSansBold
        Foolname_2.Text = fakeName.Value.."<br>Loot:</br> "..tostring(stat:WaitForChild("RLoot").Value).." ("..tostring((minHealth/maxHealth)*100).."% HP)<br></br>"..player.Name
        Foolname_2.TextColor3 = stat:WaitForChild("BColor").Value.Color
        Foolname_2.TextScaled = true
        Foolname_2.TextSize = 14.000
        Foolname_2.TextStrokeTransparency = 0.000
        Foolname_2.TextWrapped = true
        Foolname_2.RichText = true
        print("pp")
        end
        if pcall(addName) then
           print("Name has been added")
        else
           print("Name could not be attached, either because the player is dead or they have not loaded in fully.")
        end
   end
   for i, v in pairs(Workspace:WaitForChild("Debris"):WaitForChild("Props"):GetChildren()) do
      if (v.BrickColor == BrickColor.new("Dark green") or v.BrickColor == BrickColor.new("Lime green")) and v:FindFirstChild("Loot") then
         local ht = Instance.new("Highlight")
         ht.Parent = v
         ht.Adornee = v
         ht.FillColor = Color3.new(0, 255, 0)
      end
   end
   for i, v in pairs(Workspace:WaitForChild("Debris"):GetChildren()) do
      if v.Name == "Revolver" then
         local ht = Instance.new("Highlight")
         ht.Parent = v
         ht.Adornee = v
         ht.FillColor = Color3.new(255, 0, 255)
      end
   end
   for i, v in pairs(Workspace:WaitForChild("Debris"):GetChildren()) do
      if v.Name == "Knife" then
         local ht = Instance.new("Highlight")
         ht.Parent = v
         ht.Adornee = v
         ht.FillColor = Color3.new(255, 255, 255)
      end
   end
   wait(1)
   for i, v in pairs(game.Workspace:GetDescendants()) do
      if v:IsA("Highlight") or v.Name == "Foolname" then
         v:Destroy()
      end
   end
end)
