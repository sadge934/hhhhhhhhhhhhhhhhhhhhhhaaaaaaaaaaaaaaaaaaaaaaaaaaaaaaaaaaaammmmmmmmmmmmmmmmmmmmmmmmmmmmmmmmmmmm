---@diagnostic disable: deprecated



if game.PlaceId == 9498006165 then

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

    local Window = Library.CreateLib("3RROR Hub - Tapping Simulator!", "BloodTheme")

    -- Main

    local Main = Window:NewTab("Main")

    local MainSection = Main:NewSection("Tutorial")

    MainSection:NewButton("Complete Tutorial", "ButtonInfo", function(state)
        getgenv().CompleteTutorial = state

        spawn(function ()
            while CompleteTutorial == true do
                game:GetService("ReplicatedStorage").Events.FinishTutorial:FireServer()
            end
        end)
        print("Finished Tutorial")
    end)

    -- AutoClicker
    local Clicker = Window:NewTab("Clicker")

    local ClickerSection = Clicker:NewSection("Auto Clickers")

    ClickerSection:NewToggle("Auto Clicker V1", "can get laggy", function(state)
        getgenv().AutoClicker = state

        spawn(function ()
            while AutoClicker == true do
                game:GetService("ReplicatedStorage").Events.Tap:FireServer()
                wait()
            end
        end)
        print('Auto Clicker V1->', state)
    end)

    ClickerSection:NewToggle("Auto Clicker V2", "probably not laggy (also slower)", function(state)
        getgenv().AutoClicker = state

        spawn(function ()
            while AutoClicker == true do
                game:GetService("ReplicatedStorage").Events.Tap:FireServer()
                wait(0.2)
            end
        end)
        print('Auto Clicker V2 ->', state)
    end)

    -- Eggs
    local Eggs = Window:NewTab("Eggs")

    local EggsSection = Eggs:NewSection("Auto Hatch Eggs")

    local selectedEgg;

    EggsSection:NewDropdown("Selected Egg", "select the Egg you want to Hatch every 5 seconds", {"Starter", "Wood Egg", "Jungle Egg", "Coral Egg", "Jungle Egg", "Bee Egg", "Snow Egg", "Desert Egg", "Death Egg"}, function(currentOption)
        selectedEgg = currentOption
        print(selectedEgg)
    end)

    EggsSection:NewToggle("Hatch Selected Egg", "...", function(state)
        getgenv().AutoHatchEggs = state

        spawn(function ()
            while AutoHatchEggs == true do
                local args = {
                [1] = {},
                [2] = selectedEgg,
                [3] = 1
                }
                game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
                wait(5)
            end
        end)
    end)

    -- Auto Rebirth

    local Rebirths = Window:NewTab("Rebirths")

    local RebirthsSection = Rebirths:NewSection("Auto Rebirth")

    local selectedRebirths;

    RebirthsSection:NewDropdown("Select Rebirths", "select the Amount of Rebirths you want to work with", {"1", "5", "10", "20"}, function(currentOption)
        selectedRebirths = currentOption
        print(selectedRebirths)
    end)


    RebirthsSection:NewToggle("Auto Rebirth V1", "can get laggy", function(state)
        getgenv().AutoRebirth = state

        spawn(function ()
            while AutoRebirth == true do
                local args = {
                    [1] = selectedRebirths
                    }
                    game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
                    wait()
            end
        end)
        print('Auto Rebirther V1->', state)
    end)

    RebirthsSection:NewToggle("Auto Rebirth V2", "can't get laggy", function(state)
        getgenv().AutoRebirth = state

        spawn(function ()
            while AutoRebirth == true do
                local args = {
                    [1] = selectedRebirths
                    }
                    game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
                    wait(1.5)
            end
        end)
        print('Auto Rebirther V2->', state)
    end)

end