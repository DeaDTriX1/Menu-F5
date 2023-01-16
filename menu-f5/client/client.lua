ESX = nil
PlayerData = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    RefreshMoney()
    RefreshMoney2()
    if ESX.IsPlayerLoaded() then

        ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    RefreshMoney()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    RefreshMoney2()
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
      ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    for i=1, #ESX.PlayerData.accounts, 1 do
        if ESX.PlayerData.accounts[i].name == account.name then
            ESX.PlayerData.accounts[i] = account
            break
        end
    end
end)

local Inventaire = {

    Index = {
        '~b~Utiliser~s~',
        '~b~Jeter~s~',
        '~b~Donner~s~'

    },

    list = 1
}

local Identite = {

    Index = {
        '~b~Regarder~s~',
        '~b~Montrer~s~',
    },

    list = 1
}

local Conduire = {

    Index = {
        '~b~Regarder~s~',
        '~b~Montrer~s~',
    },

    list = 1
}

local PPA = {

    Index = {
        '~b~Regarder~s~',
        '~b~Montrer~s~',
    },

    list = 1
}

local Liquide = {

    Index = {
        '~b~Donner~s~',
        '~b~Jeter~s~',
    },

    list = 1
}

local Sale = {

    Index = {
        '~b~Donner~s~',
        '~b~Jeter~s~',
    },

    list = 1
}

local Weapon = {

    Index = {
        '~b~Donner~s~',
        '~b~Jeter~s~',
    },

    list = 1
}

local Vetement = {

    Index = {
        '~b~Torse~s~',
        '~b~T-Shirt~s~',
        '~b~Jean~s~',
        '~b~Chaussures~s~',
        '~b~Chapeau~s~'
    },

    list = 1
}

local Accessoires = {

    Index = {
        '~b~Gilets par balle~s~',
        '~b~Masque~s~',
        '~b~Lunettes~s~',
        '~b~Bracelet~s~',
        '~b~Sac à dos~s~'
    },

    list = 1
}

local Porte = {

    Index = {
        '~b~Ouvrir~s~',
        '~b~Fermer~s~',
    },

    list = 1
}

local GestionPorte = {

    Index = {
        '~b~Porte Conducteur ~s~',
        '~b~Porte Passager~s~',
        '~b~Porte Arrière Gauche~s~',
        '~b~Porte Arrière Droite~s~',
        '~b~Capot~s~',
        '~b~Coffre~s~',
    },

    list = 1
}

local ID = {

    Index = {
        '~b~Ton ID ~s~',
        '~b~ID JOUEUR~s~',
    },

    list = 1
}

local Hello = {
    factures = {}
}


function MenuF5()
    local main =  RageUI.CreateMenu(Config.NomServeur, "~b~ID : "..GetPlayerServerId(PlayerId()), X, Y, "menu-f5", "menu-f5", nil, nil, nil, nil)
    local inventaire = RageUI.CreateSubMenu(main, "Inventaire", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local portefeuille = RageUI.CreateSubMenu(main, "Portefeuille", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local billing_menu = RageUI.CreateSubMenu(main, "Facture", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local gestionarme = RageUI.CreateSubMenu(main, "Gestion Arme", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local vetement = RageUI.CreateSubMenu(main, "Vêtement", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local gestionentreprise = RageUI.CreateSubMenu(main, "Gestion Entreprise", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local gestiongang = RageUI.CreateSubMenu(main, "Gestion Gang", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local gestionveh = RageUI.CreateSubMenu(main, "Gestion Véhicule", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local divers = RageUI.CreateSubMenu(main, "Divers", "~b~ID : "..GetPlayerServerId(PlayerId()))
    local administation = RageUI.CreateSubMenu(main, "Administation", "~b~ID : "..GetPlayerServerId(PlayerId()))

        RageUI.Visible(main, not RageUI.Visible(main))
        ESX.TriggerServerCallback('zf5:getweapon', function(weapons)
            ESX.TriggerServerCallback("2-AdminMenu:getUsergroup",function(group)
        while main do
            Citizen.Wait(0)


                    RageUI.IsVisible(main, true, true, true, function()

                    RageUI.Line()

                        RageUI.ButtonWithStyle("~b~→ ~s~Inventaire", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, inventaire)

                        RageUI.ButtonWithStyle("~b~→ ~s~Portefeuille", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, portefeuille)
                                
                        RageUI.ButtonWithStyle("~b~→ ~s~Facture", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, billing_menu)                              

                        RageUI.ButtonWithStyle("~b~→ ~s~Gestion d'armes", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, gestionarme)

                        RageUI.ButtonWithStyle("~b~→ ~s~Vêtement", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, vetement)

                        RageUI.ButtonWithStyle("~b~→ ~s~Gestion Entreprise", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, gestionentreprise)

                        RageUI.ButtonWithStyle("~b~→ ~s~Gestion Gang", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, gestiongang)

                        RageUI.ButtonWithStyle("~b~→ ~s~Gestion Véhicule", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, gestionveh)

                        RageUI.ButtonWithStyle("~b~→ ~s~Divers", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, divers)

                        RageUI.Line()
                                
                                
                        if (group) == 'superadmin' or (group) == 'admin' or (group) == 'mod' or (group) == '_dev' then
                        RageUI.ButtonWithStyle("~b~→ ~s~Administation", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)     
                        end, administation)
                        end

                    end, function()
                    end)

                    RageUI.IsVisible(inventaire, true, true, true, function()

                    RageUI.Separator('~s~ ↓ ~b~ Inventaire ~s~↓ ')

                    RageUI.Line('')

                        ESX.PlayerData = ESX.GetPlayerData()
                        for i = 1, #ESX.PlayerData.inventory do
                            if ESX.PlayerData.inventory[i].count > 0 then
                                RageUI.List('~p~→~s~ [~y~x'..ESX.PlayerData.inventory[i].count.. '~s~] ~s~'..ESX.PlayerData.inventory[i].label..'', Inventaire.Index, Inventaire.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                                    if (Selected) then
                                        ItemSelected = ESX.PlayerData.inventory[i]

                                        if Index == 1 then
                                            if ItemSelected.usable then
                                                TriggerServerEvent('esx:useItem', ItemSelected.name)  
                                            else
                                                ESX.ShowNotification('l\'items n\'est pas utilisable', ItemSelected.label)
                                            end

                                            elseif Index == 2 then
                                                if ItemSelected.canRemove then
                                                    local quantite = KeyboardInput("Nombres d'items que vous voulez jeter", '', 25)
                                                    if tonumber(quantite) then
                                                        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                                            TriggerServerEvent('esx:removeInventoryItem', 'item_standard', ItemSelected.name, tonumber(quantite))
                                                        else
                                                            ESX.ShowNotification("Vous ne pouvez pas faire ceci dans un véhicule !")
                                                        end
                                                    else
                                                        ESX.ShowNotification("Nombres d'items invalid !")
                                                    end
                                                end
                                                
                                            elseif Index == 3 then
                                                local quantity = KeyboardInput("Nombres d'items que vous voulez donner", "", 25)
                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                --local pPed = GetPlayerPed(-1)
                                                --local coords = GetEntityCoords(pPed)
                                                --local x,y,z = table.unpack(coords)
                                                    --DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
                                                local player = GetPlayerPed(-1)
                                                local vCoords = GetEntityCoords(player)
                                                DrawMarker(2, vCoords.x, vCoords.y, vCoords.z + 1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 102, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                                                if tonumber(quantity) then
                                                    if closestDistance ~= -1 and closestDistance <= 3 then
                                                        local closestPed = GetPlayerPed(closestPlayer)
                                                        if IsPedOnFoot(closestPed) then
                                                            TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', Rperso.ItemSelected.name, tonumber(quantity))
                                                        else
                                                            ESX.ShowNotification("Nombres d'items invalid !")
                                                        end
                                                    else
                                                        ESX.ShowNotification("Aucun joueur ~r~Proche~n~ !")
                                                    end
                                                end                                               
                                        end
                                    end
                                Inventaire.list = Index;
                                end)
                            end
                        end

                        RageUI.Line('')




                    end, function()
                    end)

                    RageUI.IsVisible(portefeuille, true, true, true, function()

                        RageUI.Separator('~s~↓ ~b~Information ~s~↓')

                        local MoneyPlayer = ESX.Math.GroupDigits(ESX.PlayerData.money)

                        RageUI.ButtonWithStyle("~b~→~s~ Nom : ~b~"..GetPlayerName(PlayerId()), nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                        end)

                        RageUI.ButtonWithStyle("~b~→~s~ Job : ~b~"..ESX.PlayerData.job.label, nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                        end)

                        RageUI.ButtonWithStyle("~b~→~s~ Grade : ~b~"..ESX.PlayerData.job.grade_label, nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                        end)

                        RageUI.Line('')

                        RageUI.List("~b~→~s~ Liquide : [~g~"..MoneyPlayer.."€~s~]", Liquide.Index, Liquide.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                            if (Selected) then
                                if Index == 1 then
                                    local quantity = KeyboardInput("Somme d'argent que vous voulez donner", '', 25)
                                    if tonumber(quantity) then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                        if closestDistance ~= -1 and closestDistance <= 3 then
                                            local closestPed = GetPlayerPed(closestPlayer)
                                            if not IsPedSittingInAnyVehicle(closestPed) then
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_money', 'rien', tonumber(quantity))
                                            else
                                                ESX.ShowNotification('Vous ne pouvez pas donner de l\'argent dans un véhicles')
                                            end
                                        else
                                            ESX.ShowNotification('Aucun joueur proche !')
                                        end
                                    else
                                        ESX.ShowNotification('Somme invalid')
                                    end
                                elseif Index == 2 then
                                    local quantity = KeyboardInput("Somme d'argent que vous voulez jeter", "", 25)
                                    if tonumber(quantity) then
                                        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                            TriggerServerEvent('esx:removeInventoryItem', 'item_money', 'rien', tonumber(quantity))
                                            RageUI.CloseAll()
                                        else
                                            ESX.ShowNotification("~r~Cette action est impossible dans un véhicule !")
                                        end
                                    else
                                        ESX.ShowNotification("~r~Les champs sont incorrects !")
                                    end
                                end
                            end
                            Liquide.list = Index;
                        end)

                        for i = 1, #ESX.PlayerData.accounts, 1 do
                            if ESX.PlayerData.accounts[i].name == 'black_money' then
                                RageUI.List("~b~→~s~ Sale : [~g~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."€~s~]"), Sale.Index, Sale.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                                    if (Selected) then
                                        if Index == 1 then
                                            local quantity = KeyboardInput("Somme d'argent que vous voulez jeter", "", 25)
                                            if tonumber(quantity) then
                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                if closestDistance ~= -1 and closestDistance <= 3 then
                                                    local closestPed = GetPlayerPed(closestPlayer)
                                                    if not IsPedSittingInAnyVehicle(closestPed) then
                                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, tonumber(quantity))
                                                    else
                                                        ESX.ShowNotification(_U('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles'))
                                                    end
                                                else
                                                    ESX.ShowNotification('Aucun joueur proche !')
                                                end
                                            else
                                                ESX.ShowNotification('Somme invalid')
                                            end
                                        elseif Index == 2 then
                                            local quantity = KeyboardInput("Somme d'argent que vous voulez jeter", "", 25)
                                            if tonumber(quantity) then
                                                if not IsPedSittingInAnyVehicle(PlayerPed) then
                                                    TriggerServerEvent('esx:removeInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, tonumber(quantity))
                                                else
                                                    ESX.ShowNotification('Vous pouvez pas jeter', 'de l\'argent')
                                                end
                                            else
                                                ESX.ShowNotification('Somme Invalid')
                                            end
                                        end
                                    end
                                    Sale.list = Index;
                                end)
                            end

                            if ESX.PlayerData.accounts[i].name == 'bank' then
                                RageUI.ButtonWithStyle("~b~→~s~ Banque : [~g~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."€~s~]"), nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                end)
                            end
                        end

                        RageUI.Line('')

                        RageUI.List("~b~→ ~s~ Carte D'identité ", Identite.Index, Identite.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                        if (Selected) then
                            if Index == 1 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestDistance ~= -1 and closestDistance <= 3.0 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                                else
                                    ESX.ShowNotification('Aucun joueur ~r~proche !')
                                end
                            end
                        end
                       Identite.list = Index;
                    end)

                        RageUI.List("~b~→ ~s~ Permis de Conduire ", Conduire.Index, Conduire.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                        if (Selected) then
                            if Index == 1 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestDistance ~= -1 and closestDistance <= 3.0 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                                else
                                    ESX.ShowNotification('Aucun joueur ~r~proche !')
                                end
                            end
                        end
                       Conduire.list = Index;
                    end)

                        RageUI.List("~b~→ ~s~ Permis PPA ", PPA.Index, PPA.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                        if (Selected) then
                            if Index == 1 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestDistance ~= -1 and closestDistance <= 3.0 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                                else
                                    ESX.ShowNotification('Aucun joueur ~r~proche !')
                                end
                            end
                        end
                       PPA.list = Index;
                    end)

                    end, function()
                    end)
                        
                    RageUI.IsVisible(billing_menu, true, true, true, function()
                    ESX.TriggerServerCallback('menu-f5:facture', function(bills) Hello.factures = bills end)

                        if #Hello.factures == 0 then
                            RageUI.Separator("")
                            RageUI.Separator("~y~Aucune facture impayée")
                            RageUI.Separator("")
                        end
                    
                        for i = 1, #Hello.factures, 1 do
                            RageUI.ButtonWithStyle(Hello.factures[i].label, nil, {RightLabel = '[~b~$' .. ESX.Math.GroupDigits(Hello.factures[i].amount.."~s~] →")}, true, function(Hovered,Active,Selected)
                                if Selected then
                                    ESX.TriggerServerCallback('esx_billing:payBill', function()
                                    ESX.TriggerServerCallback('menu-f5:facture', function(bills)
                                        Hello.factures = bills 
                                    end)
                                    end, Hello.factures[i].id)
                                end
                            end)
                        end

                    end, function()
                    end)                       

                    RageUI.IsVisible(gestionarme, true, true, true, function()

                        RageUI.Line()

                        RageUI.ButtonWithStyle("~b~→~s~ Rafraîchir La liste", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                ESX.TriggerServerCallback('zf5:getweapon', function(weapons)
                                    RageUI.CloseAll()
                                end)
                            end
                        end)

                        RageUI.Line()

                    for i=1, #weapons, 1 do
                        RageUI.List(weapons[i].label.."~b~ ["..weapons[i].count.."]", Weapon.Index, Weapon.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                            if (Selected) then
                                WeaponSelect = weapons[i]
                                if Index == 1 then
                                    local closestPlayer, distance = ESX.Game.GetClosestPlayer()
                                    local playerPed = PlayerPedId()
                                    if closestPlayer ~= -1 and distance <= 3.0 then
                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_weapon', WeaponSelect.name, WeaponSelect.count)
                                    else   
                                        ESX.ShowNotification("Aucun joueur à proximité")     
                                    end
                                elseif Index == 2 then
                                    TriggerServerEvent('esx:removeInventoryItem', 'item_weapon', WeaponSelect.name)
                                end
                            end
                            Weapon.list = Index;
                        end)
                    end


                    end, function()
                    end)

                    RageUI.IsVisible(vetement, true, true, true, function()


                        RageUI.Separator('~s~↓ ~b~Vêtements ~s~↓')

                        RageUI.Line('')

                        RageUI.List("~b~→~s~ Vêtements ", Vetement.Index, Vetement.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                            if Selected then
                                if Index == 1 then
                                    setUniform('torso', plyPed)
                                elseif Index == 2 then
                                    setUniform('tshirt', plyPed)
                                elseif Index == 3 then
                                    setUniform('pants', plyPed)
                                elseif Index == 4 then
                                    setUniform('shoes', plyPed)
                                elseif Index == 5 then
                                    setUniform('helmet', plyPed)
                                end
                            end
                            Vetement.list = Index;
                        end)

                        RageUI.List("~b~→~s~ Accessoires ", Accessoires.Index, Accessoires.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                            if Selected then
                                if Index == 1 then
                                    setUniform('bproof', plyPed)
                                elseif Index == 2 then
                                    setUniform('mask', plyPed)
                                elseif Index == 3 then
                                    setUniform('glasses', plyPed)
                                elseif Index == 4 then
                                    setUniform('bracelets', plyPed)
                                elseif Index == 5 then
                                    setUniform('bag', plyPed)
                                end
                            end
                            Accessoires.list = Index;
                        end)
                        
                        RageUI.Line('')

                    end, function()
                    end)


                    RageUI.IsVisible(gestionentreprise, true, true, true, function()

                        if ESX.PlayerData.job.grade_name == 'boss' then

                        RageUI.Separator('↓ ~b~Gestion Entreprise~s~↓')
                        RageUI.Line('')
                        RageUI.Separator("~o~"..ESX.PlayerData.job.grade_label.." - ~g~"..ESX.PlayerData.job.label)
                        if societymoney ~= nil then
                            RageUI.Separator("~b~Coffre Entreprise : ~g~"..societymoney.." $")
                        end
                        RageUI.Line('')

                            RageUI.ButtonWithStyle("~b~→ ~s~Recruter un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        TriggerServerEvent('menu-f5:server:recrut', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)
                        

                        
                            RageUI.ButtonWithStyle("~b~→ ~s~Virer un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        TriggerServerEvent('menu-f5:server:virer', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)
                        

                        
                            RageUI.ButtonWithStyle("~b~→ ~s~Promouvoir un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        TriggerServerEvent('menu-f5:server:promote', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)
            
                        
                            RageUI.ButtonWithStyle("~b~→ ~s~Rétrograder un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        TriggerServerEvent('menu-f5:server:destituer', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)

                            RageUI.ButtonWithStyle("~b~→ ~s~Message aux employés", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local info = 'patron'
                                    local message = KeyboardInput('Veuillez mettre le messsage à envoyer', '', 40)
                                    TriggerServerEvent('menu-f5:envoyeremployer', info, message)
                                end
                            end)

                        else
                            RageUI.Line()
                            RageUI.Line()
                            RageUI.Separator('PERMISSIONS INSUFFISANTE !')
                            RageUI.Line()
                            RageUI.Line()
                        end

                    end, function()
                    end)

                    RageUI.IsVisible(gestiongang, true, true, true, function()

                        if ESX.PlayerData.job2.grade_name == 'boss' then

                        RageUI.Line('')
                        RageUI.Separator("~b~→ ~s~Nom du Gang : ~b~"..ESX.PlayerData.job2.label)
                        RageUI.Separator("~b~→ ~s~Grade : ~b~"..ESX.PlayerData.job2.grade_label)
                        if societymoney2 ~= nil then
                            RageUI.Separator("~b~Coffre Entreprise :  ~g~"..societymoney2.." $")
                        end

                        RageUI.Line('')

                            RageUI.ButtonWithStyle("~b~→ ~s~Recruter un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        ESX.ShowNotification('Vous avez recruté ~b~' .. GetPlayerName(closestPlayer))
                                        TriggerServerEvent('menu-f5:server:recrut2', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)
                        

                        
                            RageUI.ButtonWithStyle("~b~→ ~s~Virer un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        ESX.ShowNotification('Vous avez virer ~b~' .. GetPlayerName(closestPlayer))
                                        TriggerServerEvent('menu-f5:server:virer2', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)
                        

                        
                            RageUI.ButtonWithStyle("~b~→ ~s~Promouvoir un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        ESX.ShowNotification('Vous avez Promu ~b~' .. GetPlayerName(closestPlayer))
                                        TriggerServerEvent('menu-f5:server:promote2', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)
                        

                        
                            RageUI.ButtonWithStyle("~b~→ ~s~Rétrograder un ~b~Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur proche')
                                    else
                                        ESX.ShowNotification('Vous avez Rétrograder ~b~' .. GetPlayerName(closestPlayer))
                                        TriggerServerEvent('menu-f5:server:derank2', GetPlayerServerId(closestPlayer))
                                    end
                                end
                            end)

                        else
                            RageUI.Line()
                            RageUI.Line()
                            RageUI.Separator('PERMISSIONS INSUFFISANTE !')
                            RageUI.Line()
                            RageUI.Line()
                        end

                    end, function()
                    end)

                    RageUI.IsVisible(gestionveh, true, true, true, function()

                        if IsPedSittingInAnyVehicle(PlayerPedId()) then

                        local vehiclename = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))))
                        local plque = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        local GetSourcevehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        local zengine = GetVehicleEngineHealth(GetSourcevehicle)/10
                        local healcar = math.floor(zengine)

                        RageUI.Separator('↓ ~b~Gestion Vehicule ~s~↓')
                        RageUI.Line()
                        RageUI.Separator('~p~→ ~s~Véhicule : '..vehiclename)
                        RageUI.Separator('~p~→ ~s~Plaque : '..plque)
                        RageUI.Separator('~p~→ ~s~Etat : '.. healcar ..'%')
                        RageUI.Line()
                        local status = "Démarré"

                        RageUI.Checkbox("~p~→ Status Moteur : "..DisplayStateEngine, "Gérer le status de votre moteur", StateEngine,{},function(Hovered,Ative,Selected,Checked)
                            if Selected then
                                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                    local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                                    if Checked then
                                        StateEngine = true
                                        DisplayStateEngine = "~g~Allumé"
                                        if not GetIsVehicleEngineRunning(plyVeh) then
                                            SetVehicleEngineOn(plyVeh, true, false, true)
                                            SetVehicleUndriveable(plyVeh, false)
                                        end
                                    else
                                        StateEngine = false
                                        DisplayStateEngine = "~r~Éteint"
                                        if GetIsVehicleEngineRunning(plyVeh) then
                                            SetVehicleEngineOn(plyVeh, false, false, true)
                                            SetVehicleUndriveable(plyVeh, true)
                                        end
                                    end
                                end
                            end
                        end)


                        RageUI.List("~p~→ ~s~Vérouillage Portes", Porte.Index, Porte.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                            if Selected then
                                if Index == 1 then
                                    SetVehicleDoorsLocked(GetSourcevehicle, 1)
                                    SetVehicleDoorsLockedForAllPlayers(GetSourcevehicle, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ les portes de votre véhicule")
                                elseif Index == 2 then
                                    SetVehicleDoorsLocked(GetSourcevehicle, 2)
                                    SetVehicleDoorsLockedForAllPlayers(GetSourcevehicle, true)
                                    ESX.ShowNotification("~s~Vous avez ~r~fermer~s~ les portes de votre véhicule")
                                end
                            end
                            Porte.list = Index;
                        end)

                        RageUI.List("~p~→ ~s~Gestion Portières ", GestionPorte.Index, GestionPorte.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                            if Selected then
                                if Index == 1 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 0, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte conducteur")
                                elseif Index == 2 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 1, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte passager")
                                elseif Index == 3 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 2, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte arrière gauche")
                                elseif Index == 4 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 3, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte arrière droite")
                                elseif Index == 5 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 4, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ le capot")
                                elseif Index == 6 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 5, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ le coffre")
                                end
                            end
                            GestionPorte.list = Index;
                        end)
                    else
                        RageUI.Line()
                        RageUI.Line()
                        RageUI.Separator('VOUS DEVEZ ETRE DANS UN VEHICULE')
                        RageUI.Line()
                        RageUI.Line()
                    end

                    end, function()
                    end)

                    RageUI.IsVisible(divers, true, true, true, function()

                    RageUI.ButtonWithStyle("~b~→ ~s~Faire un tweet", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local tweet = KeyboardInput("Tapez votre tweet", "", 100)
                            local playername = GetPlayerName(PlayerId())
                            for k, v in pairs(Config.TweetMotBan) do                              
                                if tweet == v.name then                                       
                                    return(ESX.ShowNotification("~r~Vous ne pouvez pas faire de tweet avec ce mot"))
                                end               
                            end
                                if tweet ~= nil then
                                    TriggerServerEvent('menu-f5:sendtweet', playername, tweet)
                                end
                        end
                    end)

                    RageUI.Checkbox("~b~→ ~s~Afficher / Cacher le HUD", nil, Hud,{},function(Hovered,Ative,Selected,Checked)
                        if Selected then
                            if Checked then
                                Hud = true
                                DisplayRadar(true)
                            else
                                Hud = false
                                DisplayRadar(false)
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle("~b~→ ~s~Tomber", "Ragdoll", {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ragdolling = not ragdolling
                            RageUI.CloseAll()
                            while ragdolling do
                                Wait(0)
                                local myPed = GetPlayerPed(-1)
                                SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                                ResetPedRagdollTimer(myPed)
                                AddTextEntry(GetCurrentResourceName(), ('Appuyez sur ~INPUT_JUMP~ pour vous ~b~Réveillé'))
                                DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
                                ResetPedRagdollTimer(myPed)
                                if IsControlJustPressed(0, 22) then 
                                    ragdolling = false
                                end
                            end
                        end
                    end)

                    RageUI.List("~b~→~s~ Voir", ID.Index, ID.list, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected, Index)
                        if Selected then
                            if Index == 1 then
                                ESX.ShowNotification("Ton ID : "..GetPlayerServerId(PlayerId()))
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestDistance ~= -1 and closestDistance <= 3.0 then
                                    ESX.ShowNotification("Joueur Proche : "..GetPlayerName(closestPlayer).." "..GetPlayerServerId(closestPlayer))
                                else
                                    ESX.ShowNotification('Aucun joueur ~r~proche !')
                                end
                            end
                        end
                        ID.list = Index;
                    end)

                    end, function()
                    end)


                    RageUI.IsVisible(administation, true, true, true, function()

                        RageUI.Separator('↓ ~b~Administration ~s~↓')
                        local name = GetPlayerName(PlayerId())
                        -- 
                        local nombreco = "Il y a actuellement "..#GetActivePlayers().." joueurs en ligne"
                        local uptime = "Vous etes en ligne depuis"..GetConvar("sv_uptime", "0").." minutes"
                        local rank = PlayerGroup
                        local id  = GetPlayerServerId(PlayerId())
                        if PlayerGroup == "superadmin" then
                        rank = "~r~Owner ~s~"
                        RageUI.Separator(rank.." [~b~"..id.."~s~] ~s~"..name)
                        end
                        RageUI.Separator(nombreco)
                        RageUI.Line()

                        RageUI.ButtonWithStyle("~b~→ ~s~Téléportation Marker", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local playerPed = PlayerPedId()
                                local waypoint = GetFirstBlipInfoId(8)
                                if DoesBlipExist(waypoint) then
                                    local waypointCoords = GetBlipInfoIdCoord(waypoint)
                                    SetEntityCoords(playerPed, waypointCoords)
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ au ~b~marker")
                                else
                                    ESX.ShowNotification("~s~Vous n'avez pas de ~b~marker~s~ sur votre carte")
                                end
                            end
                        end)

                        RageUI.ButtonWithStyle("~b~→ ~s~Téléportation Coordonnées", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local x = KeyboardInput("X", "", 100)
                                local y = KeyboardInput("Y", "", 100)
                                local z = KeyboardInput("Z", "", 100)
                                if x ~= nil and y ~= nil and z ~= nil then
                                    SetEntityCoords(PlayerPedId(), x + 0.0, y + 0.0, z + 0.0)
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ aux ~b~coordonnées")
                                end
                            end
                        end)
                    
                        RageUI.ButtonWithStyle("~b~→ ~s~Téléportation Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local playerid = KeyboardInput("ID du joueur", "", 100)
                                local playerped = GetPlayerPed(GetPlayerFromServerId(playerid))
                                local playercoords = GetEntityCoords(playerped)
                                if playerid ~= nil then
                                    SetEntityCoords(PlayerPedId(), playercoords)
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ au joueur ~b~"..playerid)
                                end
                            end
                        end)

                        RageUI.Line()

                    RageUI.Checkbox("→~s~ Afficher les Coordonnées",description, affichagecoords,{},function(Hovered,Ative,Selected,Checked)
                        if Selected then
                            local affichagecoords = true
                            while affichagecoords do
                                Wait(0)
                                x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                                roundx=tonumber(string.format("%.2f",x))
                                roundy=tonumber(string.format("%.2f",y))
                                roundz=tonumber(string.format("%.2f",z))
                                DrawTxt("~r~X:~s~ "..roundx,0.05,0.00)
                                DrawTxt("     ~r~Y:~s~ "..roundy,0.11,0.00)
                                DrawTxt("        ~r~Z:~s~ "..roundz,0.17,0.00)
                                DrawTxt("             ~r~Angle:~s~ "..GetEntityHeading(PlayerPedId()),0.21,0.00)
                                ESX.ShowNotification("~s~Informations | ~r~Appuyez sur E pour enlever les coordonnées.")
                                if IsControlJustPressed(0, 51) then
                                    affichagecoords = false
                                end
                            end
                            Wait(0)
                        end
                    end)

                        RageUI.ButtonWithStyle("~b~→ ~s~Revive Joueur", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local IdJoueur = KeyboardInput("ID du joueur", "", 100)
                                if IdJoueur ~= nil then
                                    ExecuteCommand("revive "..IdJoueur)
                                    ESX.ShowNotification("~s~Vous avez ~g~réanimé~s~ le joueur ~b~"..IdJoueur)
                                end
                            end
                        end)

                        RageUI.Line()

                        RageUI.ButtonWithStyle("~b~→ ~s~Réparer Véhicule", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local playerped = PlayerPedId()
                                local vehicle = GetVehiclePedIsIn(playerped, false)
                                SetVehicleFixed(vehicle)
                                SetVehicleDirtLevel(vehicle, 0.0)
                                ESX.ShowNotification("~s~Vous avez ~g~réparé~s~ le véhicule")
                            end
                        end)

                        RageUI.ButtonWithStyle("~b~→ ~s~Spawn Véhicule", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local vehicle = KeyboardInput("Nom du véhicule", "", 100)
                                if vehicle ~= nil then
                                    ESX.Game.SpawnVehicle(vehicle, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), function(callback_vehicle)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), callback_vehicle, -1)
                                    end)
                                    ESX.ShowNotification("~s~Vous avez ~g~spawn~s~ le véhicule ~b~"..vehicle)
                                end
                            end
                        end)

                        RageUI.ButtonWithStyle("~b~→ ~s~Full Custom", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                FullVehicleBoost()
                            end
                        end)

                        RageUI.ButtonWithStyle("~b~→ ~s~Supprimer Véhicule", nil, {RightLabel = "~s~→→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local playerped = PlayerPedId()
                                local vehicle = GetVehiclePedIsIn(playerped, false)
                                DeleteEntity(vehicle)
                                ESX.ShowNotification("~s~Vous avez ~r~supprimé~s~ le véhicule")
                            end
                        end)

                    end, function()
                    end)

                if not RageUI.Visible(main) and not RageUI.Visible(inventaire) and not RageUI.Visible(portefeuille) and not RageUI.Visible(gestionarme) and not RageUI.Visible(vetement) and not RageUI.Visible(gestionentreprise) and not RageUI.Visible(divers) and not RageUI.Visible(administation) and not RageUI.Visible(gestiongang) and not RageUI.Visible(gestionveh) and not RageUI.Visible(billing_menu) then                    main = RMenu:DeleteType("", true)
        end
    end
end)
end)
end


Keys.Register('F5', 'Menu-F5', 'Ouvrir le menu F5', function()
    MenuF5()
end)
