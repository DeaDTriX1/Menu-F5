function GetGroup()
    ESX.TriggerServerCallback("menu-f5:server:getGroup", function(group) 
        PlayerGroup = group
    end)
end

ItemSelected = {}
societymoney, societymoney2 = nil, nil
StateEngine = true
DisplayStateEngine = "Allumé"

function setUniform(value, plyPed)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:getSkin', function(skina)
            if value == 'torso' then
                TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_COP_IDLES", 0, true)
                Citizen.Wait(550)
                ClearPedTasks(plyPed)

                if skin.torso_1 ~= skina.torso_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
                end
            elseif value == 'pants' then
                if skin.pants_1 ~= skina.pants_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
                else
                    if skin.sex == 0 then
                        TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 61, ['pants_2'] = 1})
                    else
                        TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
                    end
                end
            elseif value == 'shoes' then
                if skin.shoes_1 ~= skina.shoes_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
                else
                    if skin.sex == 0 then
                        TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
                    else
                        TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
                    end
                end
            elseif value == 'bag' then
                if skin.bags_1 ~= skina.bags_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
                end
            elseif value == 'bproof' then
                
                TaskStartScenarioInPlace(plyPed, "try_tie_neutral_a", 0, true)
                Citizen.Wait(1000)
                ClearPedTasks(plyPed)

                if skin.bproof_1 ~= skina.bproof_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
                end

            elseif value == 'mask' then
                if skin.mask_1 ~= skina.mask_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = 0, ['mask_2'] = 0})
                end
            
            elseif value == 'helmet' then
                if skin.helmet_1 ~= skina.helmet_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = skin.helmet_1, ['helmet_2'] = skin.helmet_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = -1, ['helmet_2'] = 0})
                end

            elseif value == 'glasses' then
                if skin.glasses_1 ~= skina.glasses_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = skin.glasses_1, ['glasses_2'] = skin.glasses_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = -1, ['glasses_2'] = 0})
                end

            elseif value == 'vest' then
                if skin.vest_1 ~= skina.vest_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['vest_1'] = skin.vest_1, ['vest_2'] = skin.vest_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['vest_1'] = 0, ['vest_2'] = 0})
                end
            end

  
        end)
    end)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
        societymoney = ESX.Math.GroupDigits(money)
    end

    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job2.name == society then
        societymoney2 = ESX.Math.GroupDigits(money)
    end
end)

function RefreshMoney()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('five_society:getSocietyMoney', function(money)
            societymoney = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job.name)
    end
end

function RefreshMoney2()
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
        ESX.TriggerServerCallback('five_society:getSocietyMoney', function(money)
            societymoney2 = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job2.name)
    end
end


RegisterNetEvent('menu-f5:envoyeremployer')
AddEventHandler('menu-f5:envoyeremployer', function(service, nom, message)
    if service == 'patron' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        ESX.ShowAdvancedNotification('INFO '..ESX.PlayerData.job.label, '~b~A lire', 'Patron: ~g~'..nom..'\n~w~Message: ~g~'..message..'', 'CHAR_MINOTAUR', 8)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1) 
    end
end)

function FullVehicleBoost()
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
        SetVehicleModKit(vehicle, 0)
        SetVehicleMod(vehicle, 14, 0, true)
        SetVehicleNumberPlateTextIndex(vehicle, 5)
        ToggleVehicleMod(vehicle, 18, true)
        SetVehicleColours(vehicle, 0, 0)
        SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
        SetVehicleModColor_2(vehicle, 5, 0)
        SetVehicleExtraColours(vehicle, 111, 111)
        SetVehicleWindowTint(vehicle, 2)
        ToggleVehicleMod(vehicle, 22, true)
        SetVehicleMod(vehicle, 23, 11, false)
        SetVehicleMod(vehicle, 24, 11, false)
        SetVehicleWheelType(vehicle, 12) 
        SetVehicleWindowTint(vehicle, 3)
        ToggleVehicleMod(vehicle, 20, true)
        SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
        LowerConvertibleRoof(vehicle, true)
        SetVehicleIsStolen(vehicle, false)
        SetVehicleIsWanted(vehicle, false)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetCanResprayVehicle(vehicle, true)
        SetPlayersLastVehicle(vehicle)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleTyresCanBurst(vehicle, false)
        SetVehicleWheelsCanBreak(vehicle, false)
        SetVehicleCanBeTargetted(vehicle, false)
        SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
        SetVehicleHasStrongAxles(vehicle, true)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleCanBeVisiblyDamaged(vehicle, false)
        IsVehicleDriveable(vehicle, true)
        SetVehicleEngineOn(vehicle, true, true)
        SetVehicleStrong(vehicle, true)
        RollDownWindow(vehicle, 0)
        RollDownWindow(vehicle, 1)
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
        SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
        SetPedCanBeDraggedOut(PlayerPedId(), false)
        SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
        SetPedRagdollOnCollision(PlayerPedId(), false)
        ResetPedVisibleDamage(PlayerPedId())
        ClearPedDecorations(PlayerPedId())
        SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
        for i = 0,14 do
            SetVehicleExtra(veh, i, 0)
        end
        SetVehicleModKit(veh, 0)
        for i = 0,49 do
            local custom = GetNumVehicleMods(veh, i)
            for j = 1,custom do
                SetVehicleMod(veh, i, math.random(1,j), 1)
            end
        end
    end
end

--DrawTxt
function DrawTxt(text,r,z)
    SetTextColour(186, 186, 186, 255)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(r,z)
end