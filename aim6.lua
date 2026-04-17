BPM = 1
silentAimActive = false
silentAimMode = "normal"
fovActive = false
fovItems = {}
noRecoilActive = false
infiniteRunActive = false
infiniteRunItems = {}
coordsSaved = false
nameTagsActive = false
nameTagsItems = {}
nameTagsValue = 1000.0
dexterityActive = false
dexterityItems = {}
joystickActive = false
joystickItems = {}

-- Обновлённый список администрации (без агентов поддержки)
personnelList = {
    -- Специальная и главная администрация
    {name = "Danya_Menschikov", role = "Специальный Администратор [7 lvl]"},
    {name = "Kirill_Brago", role = "Главный Администратор [6 lvl]"},
    {name = "Roman_Rustamov", role = "Заместитель ГА [5 lvl] / ВРиО ГСХ [5 lvl]"},
    {name = "Ray_Kristov", role = "Куратор старшей администрации [5 lvl]"},
    {name = "Mixail_Majorka", role = "Куратор младшей администрации [5 lvl] / ВРиО ГС ОПГ [5 lvl]"},
    {name = "Vladislav_Davletov", role = "ЗГСХ [3 lvl]"},
    {name = "Daniil_Shadows", role = "ЗГС ОПГ [4 lvl]"},
    {name = "Rich_Tsoy", role = "ГС ГОСС [4 lvl]"},
    {name = "Alexander_Burn", role = "ЗГС ГОСС [3 lvl]"},
    {name = "Abdulla_Groznyy", role = "Куратор форума [3 lvl]"},
    -- Администрация сервера
    {name = "Ded_Mavrodi", role = "Администратор [3 lvl]"},
    {name = "Zhenya_Berkys", role = "Администратор [3 lvl]"},
    {name = "Vanya_Alpatov", role = "Администратор [3 lvl]"},
    {name = "Maksimka_Sharov", role = "Администратор [3 lvl]"},
    {name = "Yan_Blessed", role = "Администратор [3 lvl]"},
    {name = "Matteo_Derzkiy", role = "Администратор [3 lvl]"},
    {name = "Deni_Macalister", role = "Администратор [3 lvl]"},
    {name = "Maxim_Medvedev", role = "Администратор [3 lvl]"},
    {name = "Ivan_Porona", role = "Администратор [3 lvl]"},
    -- Модерация сервера
    {name = "Timofey_Appeal", role = "Модератор [2 lvl]"},
    {name = "David_Novikov", role = "Модератор [2 lvl]"},
    {name = "Danill_Zateev", role = "Модератор [2 lvl]"},
    {name = "Malik_Goldenberg", role = "Модератор [2 lvl]"},
    {name = "Sergey_Prisuhin", role = "Модератор [2 lvl]"},
    {name = "Nikita_Comarov", role = "Модератор [2 lvl]"},
    {name = "Winki_Litvinenko", role = "Модератор [2 lvl]"},
    {name = "Dmitriy_Nesabydy", role = "Модератор [2 lvl]"},
    {name = "Danil_Ferteev", role = "Модератор [2 lvl]"},
    {name = "Hira_Simple", role = "Модератор [2 lvl]"},
    {name = "Trofim_Afanasev", role = "Модератор [2 lvl]"},
    {name = "Evgeniy_Shikhtenkov", role = "Модератор [2 lvl]"},
    {name = "Robert_Jakson", role = "Модератор [2 lvl]"},
    {name = "Andrey_Greenov", role = "Модератор [2 lvl]"},
    -- Младшая модерация
    {name = "Hayden_Faraonov", role = "Младший модератор [1 lvl]"},
    {name = "Holod_Toretto", role = "Младший модератор [1 lvl]"},
    {name = "Denis_Dybov", role = "Младший модератор [1 lvl]"},
    {name = "Maga_Kingdom", role = "Младший модератор [1 lvl]"},
    {name = "Saha_Putilov", role = "Младший модератор [1 lvl]"},
    {name = "Andrey_Diep", role = "Младший модератор [1 lvl]"},
    {name = "Cristian_Belle", role = "Младший модератор [1 lvl]"}
}

function menu()
    BPM = 0
    local status = ""
    if silentAimActive then status = " ✓ " else status = "  " end
    
    local modeText = ""
    if silentAimActive then
        if silentAimMode == "normal" then 
            modeText = " [ɴᴏʀᴍᴀʟ]" 
        else 
            modeText = " [ʜᴀʀᴅ]" 
        end
    end
    
    local status2 = ""
    if noRecoilActive then status2 = " ✓ " else status2 = "  " end
    
    local status3 = ""
    if fovActive then status3 = " ✓ " else status3 = "  " end
    
    local status5 = ""
    if infiniteRunActive then status5 = " ✓ " else status5 = "  " end
    
    local status6 = ""
    if nameTagsActive then status6 = " ✓ " else status6 = "  " end
    
    mine = gg.choice({
        "⌜ sɪʟᴇɴᴛ ᴀɪᴍ ⌟" .. status .. modeText,
        "⌜ ɴᴏ ʀᴇᴄᴏɪʟ ⌟" .. status2,
        "⌜ ғᴏᴠ ⌟" .. status3,
        "⌜ ɪɴғɪɴɪᴛᴇ ʀᴜɴ ⌟" .. status5,
        "⌜ ɴᴀᴍᴇ ᴛᴀɢs ⌟" .. status6,
        "⌜ ᴏᴛʜᴇʀ ⌟",
        "ᴇxɪᴛ"
    }, nil, "ᴄʜᴇᴀᴛ ʙʏ ᏘpΌḼikナ ᴛʜᴀɴᴋ ᴛɪᴋᴛᴏɴɪᴋ")
    
    if mine == 1 then
        if silentAimActive then
            revertSilentAim()
            silentAimActive = false
        else
            selectAimMode()
        end
    end
    if mine == 2 then toggleNoRecoil() end
    if mine == 3 then toggleFov() end
    if mine == 4 then toggleInfiniteRun() end
    if mine == 5 then toggleNameTags() end
    if mine == 6 then otherMenu() end
    if mine == 7 then exit() end
end

function otherMenu()
    while true do
        local status8 = ""
        if dexterityActive then status8 = " ✓ " else status8 = "  " end
        
        local status9 = ""
        if joystickActive then status9 = " ✓ " else status9 = "  " end
        
        local choice = gg.choice({
            "⌜ ᴅᴇxᴛᴇʀɪᴛʏ ⌟" .. status8,
            "⌜ ᴅᴊᴏʏsᴛɪᴋ ⌟" .. status9,
            "⌜ ᴘᴏɪsᴋ ᴀᴅᴍɪɴᴏᴠ ⌟"
        }, nil, "ᴏᴛʜᴇʀ")
        
        if choice == nil then
            break
        elseif choice == 1 then
            toggleDexterity()
        elseif choice == 2 then
            toggleJoystick()
        elseif choice == 3 then
            searchPersonnel()
        end
    end
    menu()
end

-- ============ ФУНКЦИЯ ПОИСКА АДМИНИСТРАЦИИ (с маркером и групповым поиском) ============
function searchPersonnel()
    -- ДИАГНОСТИКА: сначала просто поищем маркер
    local marker = -7053398773622161374
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber(tostring(marker), gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local markerResults = gg.getResults(100)
    gg.clearResults()
    
    if not markerResults or #markerResults == 0 then
        -- Если маркера нет, ищем имена по всей памяти (без маркера)
        searchPersonnelFallback()
        return
    end
    
    local baseAddr = markerResults[1].address
    local startAddr = math.max(0, baseAddr - 20000)  -- увеличил до 20000
    local endAddr = baseAddr + 20000
    
    
    -- Поиск в UTF-8 и UTF-16LE
    local foundAdmins = {}
    
    -- Функция поиска по одному имени (надёжнее, чем групповой)
    local function searchSingleName(searchName)
        -- Ищем как UTF-8
        gg.searchNumber(searchName, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, startAddr, endAddr)
        local results8 = gg.getResults(10)
        if results8 and #results8 > 0 then
            return true
        end
        gg.clearResults()
        
        -- Ищем как UTF-16LE (каждый байт чередуется с нулём)
        local utf16 = ""
        for i = 1, #searchName do
            utf16 = utf16 .. string.char(string.byte(searchName, i)) .. string.char(0)
        end
        gg.searchNumber(utf16, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, startAddr, endAddr)
        local results16 = gg.getResults(10)
        if results16 and #results16 > 0 then
            return true
        end
        gg.clearResults()
        return false
    end
    
    for _, person in ipairs(personnelList) do
        local searchName = ":" .. person.name
        if searchSingleName(searchName) then
            foundAdmins[person.name] = person.role
        end
        -- Небольшая задержка, чтобы GG успевал
        gg.sleep(10)
    end
    
    if next(foundAdmins) == nil then
        gg.alert("Администраторы не найдены")
    else
        local msg = "Найдены в сети:\n\n"
        local count = 0
        for name, role in pairs(foundAdmins) do
            msg = msg .. "✓ " .. name .. " — " .. role .. "\n"
            count = count + 1
        end
        msg = msg .. "\nВсего: " .. count .. " из " .. #personnelList
        gg.alert(msg)
    end
end
-- =====================================================

function selectAimMode()
    local choice = gg.choice({
        "ɴᴏʀᴍᴀʟ ᴍᴏᴅᴇ",
        "ʜᴀʀᴅ ᴍᴏᴅᴇ",
        "ᴇxɪᴛ"
    }, nil, "ᴀɪᴍ")
    
    if choice == 1 then
        silentAimMode = "normal"
        applySilentAim()
        silentAimActive = true
    elseif choice == 2 then
        silentAimMode = "hard"
        applySilentAim()
        silentAimActive = true
    elseif choice == 3 then
        menu()
    end
end

function applySilentAim()
    gg.setRanges(gg.REGION_OTHER)
    gg.processResume()
    
    gg.searchNumber("1,043,878,380", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(400)
    
    if results and #results > 0 then
        if silentAimMode == "normal" then
            gg.editAll("1,065,350,350", gg.TYPE_DWORD)
        else
            gg.editAll("1,070,300,300", gg.TYPE_DWORD)
        end
    end
    
    gg.clearResults()
end

function revertSilentAim()
    gg.setRanges(gg.REGION_OTHER)
    gg.processResume()
    
    if silentAimMode == "normal" then
        gg.searchNumber("1,065,350,350", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    else
        gg.searchNumber("1,070,300,300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    end
    
    local results = gg.getResults(400)
    if results and #results > 0 then
        gg.editAll("1,043,878,380", gg.TYPE_DWORD)
    end
    gg.clearResults()
end

function toggleNoRecoil()
    if noRecoilActive then
        gg.setRanges(gg.REGION_CODE_APP)
        gg.processResume()
        gg.searchNumber("95", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(100)
        if #results > 0 then
            gg.editAll("100", gg.TYPE_FLOAT)
        end
        gg.clearResults()
        noRecoilActive = false
    else
        gg.setRanges(gg.REGION_CODE_APP)
        gg.processResume()
        gg.searchNumber("100.0;900.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        
        local results = gg.getResults(100)
        if #results > 0 then
            gg.editAll("95", gg.TYPE_FLOAT)
        end
        gg.clearResults()
        noRecoilActive = true
    end
    gg.processResume()
end

function toggleFov()
    if fovActive then
        if #fovItems > 0 then
            local restoreList = {}
            for _, item in ipairs(fovItems) do
                table.insert(restoreList, {
                    address = item.address,
                    flags = gg.TYPE_FLOAT,
                    value = item.originalValue
                })
            end
            gg.setValues(restoreList)
            local addrList = {}
            for _, item in ipairs(fovItems) do
                table.insert(addrList, {address = item.address, flags = gg.TYPE_FLOAT})
            end
            gg.removeListItems(addrList)
            fovItems = {}
        end
        gg.clearResults()
        fovActive = false
    else
        gg.setRanges(gg.REGION_CODE_APP)
        gg.searchNumber("4252262742350898174", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)
        
        if results and #results > 0 then
            fovItems = {}
            local modifications = {}
            local addrToAdd = {}
            
            for _, r in ipairs(results) do
                local targetAddr = r.address + 12
                local current = gg.getValues({{address = targetAddr, flags = gg.TYPE_FLOAT}})
                if current and current[1] then
                    local originalVal = current[1].value
                    table.insert(fovItems, {
                        address = targetAddr,
                        originalValue = originalVal
                    })
                    table.insert(modifications, {
                        address = targetAddr,
                        flags = gg.TYPE_FLOAT,
                        value = 90.0
                    })
                    table.insert(addrToAdd, {address = targetAddr, flags = gg.TYPE_FLOAT})
                end
            end
            
            if #modifications > 0 then
                gg.setValues(modifications)
                if #addrToAdd > 0 then
                    gg.addListItems(addrToAdd)
                end
                fovActive = true
            else
                fovItems = {}
            end
        else
        end
        gg.clearResults()
    end
end

function toggleInfiniteRun()
    if infiniteRunActive then
        if #infiniteRunItems > 0 then
            gg.removeListItems(infiniteRunItems)
            infiniteRunItems = {}
        end
        gg.clearResults()
        infiniteRunActive = false
    else
        gg.setRanges(gg.REGION_OTHER)
        gg.processResume()
        gg.searchNumber("281474993487972", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)

        if results and #results > 0 then
            local freezeList = {}
            for i, r in ipairs(results) do
                local addr = r.address - 0x160
                local val = gg.getValues({{address = addr, flags = gg.TYPE_FLOAT}})
                if val and val[1] then    
                    val[1].value = 450.0
                    val[1].freeze = true
                    val[1].freezeType = gg.FREEZE_NORMAL
                    table.insert(freezeList, val[1])
                end
            end
            if #freezeList > 0 then
                gg.setValues(freezeList)
                gg.addListItems(freezeList)
                infiniteRunItems = freezeList
                infiniteRunActive = true
            end
        end
        gg.clearResults()
    end
    gg.processResume()
end

function toggleNameTags()
    if nameTagsActive then
        if #nameTagsItems > 0 then
            gg.setValues(nameTagsItems)
            nameTagsItems = {}
        end
        nameTagsActive = false
        gg.clearResults()
        return
    end

    local valueInput = gg.prompt({
        "Введите значение для Name Tags"
    }, {
        tostring(nameTagsValue)
    }, {"number"})

    if not valueInput then
        return
    end
    
    nameTagsValue = tonumber(valueInput[1]) or nameTagsValue
    
    local offset = 0.5 * 8
    local modifications = {}
    nameTagsItems = {}
    local changedCount = 0
    
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER + gg.REGION_C_ALLOC)
    gg.searchNumber("4715268810952671232", gg.TYPE_QWORD)
    
    local results = gg.getResults(10000)

    if #results > 0 then
        for i, result in ipairs(results) do
            local targetAddress = result.address + offset
            local targetData = gg.getValues({
                {address = targetAddress, flags = gg.TYPE_FLOAT}
            })[1]
            if targetData and targetData.value == 15 then
                table.insert(nameTagsItems, {
                    address = targetAddress,
                    value = 15.0,
                    flags = gg.TYPE_FLOAT
                })
                
                table.insert(modifications, {
                    address = targetAddress,
                    value = nameTagsValue,
                    flags = gg.TYPE_FLOAT
                })
                changedCount = changedCount + 1
            end
        end
    end

    if changedCount > 0 then
        gg.setValues(modifications)
        nameTagsActive = true
    else
        gg.alert("Значение не найдено!")
        nameTagsItems = {}
    end
    gg.clearResults()
end

function toggleDexterity()
    if dexterityActive then
        if #dexterityItems > 0 then
            local restoreList = {}
            for _, item in ipairs(dexterityItems) do
                table.insert(restoreList, {
                    address = item.address,
                    flags = gg.TYPE_FLOAT,
                    value = item.originalValue
                })
            end
            gg.setValues(restoreList)
            local addrList = {}
            for _, item in ipairs(dexterityItems) do
                table.insert(addrList, {address = item.address, flags = gg.TYPE_FLOAT})
            end
            gg.removeListItems(addrList)
            dexterityItems = {}
        end
        gg.clearResults()
        dexterityActive = false
    else
        gg.setRanges(gg.REGION_CODE_APP)
        gg.searchNumber("-21471005369171956", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)
        
        if results and #results > 0 then
            dexterityItems = {}
            local modifications = {}
            local addrToAdd = {}
            
            for _, r in ipairs(results) do
                local targetAddr = r.address + 220
                local current = gg.getValues({{address = targetAddr, flags = gg.TYPE_FLOAT}})
                if current and current[1] then
                    local originalVal = current[1].value
                    table.insert(dexterityItems, {
                        address = targetAddr,
                        originalValue = originalVal
                    })
                    table.insert(modifications, {
                        address = targetAddr,
                        flags = gg.TYPE_FLOAT,
                        value = 3.8
                    })
                    table.insert(addrToAdd, {address = targetAddr, flags = gg.TYPE_FLOAT})
                end
            end
            
            if #modifications > 0 then
                gg.setValues(modifications)
                if #addrToAdd > 0 then
                    gg.addListItems(addrToAdd)
                end
                dexterityActive = true
            else
                dexterityItems = {}
            end
        else
        end
        gg.clearResults()
    end
end

function toggleJoystick()
    if joystickActive then
        if #joystickItems > 0 then
            local restoreList = {}
            for _, item in ipairs(joystickItems) do
                table.insert(restoreList, {
                    address = item.address,
                    flags = gg.TYPE_FLOAT,
                    value = item.originalValue
                })
            end
            gg.setValues(restoreList)
            local addrList = {}
            for _, item in ipairs(joystickItems) do
                table.insert(addrList, {address = item.address, flags = gg.TYPE_FLOAT})
            end
            gg.removeListItems(addrList)
            joystickItems = {}
        end
        gg.clearResults()
        joystickActive = false
    else
        gg.setRanges(gg.REGION_CODE_APP)
        gg.searchNumber("30240346315186802", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)
        
        if results and #results > 0 then
            joystickItems = {}
            local modifications = {}
            local addrToAdd = {}
            
            for _, r in ipairs(results) do
                local targetAddr = r.address + 8
                local current = gg.getValues({{address = targetAddr, flags = gg.TYPE_FLOAT}})
                if current and current[1] then
                    local originalVal = current[1].value
                    table.insert(joystickItems, {
                        address = targetAddr,
                        originalValue = originalVal
                    })
                    table.insert(modifications, {
                        address = targetAddr,
                        flags = gg.TYPE_FLOAT,
                        value = 0.15
                    })
                    table.insert(addrToAdd, {address = targetAddr, flags = gg.TYPE_FLOAT})
                end
            end
            
            if #modifications > 0 then
                gg.setValues(modifications)
                if #addrToAdd > 0 then
                    gg.addListItems(addrToAdd)
                end
                joystickActive = true
            else
                joystickItems = {}
            end
        else
        end
        gg.clearResults()
    end
end

-- ============ ВЫХОД ============
function exit()
    if silentAimActive then
        revertSilentAim()
    end
    if noRecoilActive then
        gg.setRanges(gg.REGION_CODE_APP)
        gg.processResume()
        gg.searchNumber("95", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(100)
        if #results > 0 then
            gg.editAll("100", gg.TYPE_FLOAT)
        end
        gg.clearResults()
    end
    if fovActive then
        if #fovItems > 0 then
            local restoreList = {}
            for _, item in ipairs(fovItems) do
                table.insert(restoreList, {
                    address = item.address,
                    flags = gg.TYPE_FLOAT,
                    value = item.originalValue
                })
            end
            gg.setValues(restoreList)
            local addrList = {}
            for _, item in ipairs(fovItems) do
                table.insert(addrList, {address = item.address, flags = gg.TYPE_FLOAT})
            end
            gg.removeListItems(addrList)
            fovItems = {}
        end
        gg.clearResults()
    end
    if infiniteRunActive then
        if #infiniteRunItems > 0 then
            gg.removeListItems(infiniteRunItems)
            infiniteRunItems = {}
        end
        gg.clearResults()
    end
    if nameTagsActive then
        if #nameTagsItems > 0 then
            gg.setValues(nameTagsItems)
            nameTagsItems = {}
        end
        gg.clearResults()
    end
    if dexterityActive then
        if #dexterityItems > 0 then
            local restoreList = {}
            for _, item in ipairs(dexterityItems) do
                table.insert(restoreList, {
                    address = item.address,
                    flags = gg.TYPE_FLOAT,
                    value = item.originalValue
                })
            end
            gg.setValues(restoreList)
            local addrList = {}
            for _, item in ipairs(dexterityItems) do
                table.insert(addrList, {address = item.address, flags = gg.TYPE_FLOAT})
            end
            gg.removeListItems(addrList)
            dexterityItems = {}
        end
        gg.clearResults()
    end
    if joystickActive then
        if #joystickItems > 0 then
            local restoreList = {}
            for _, item in ipairs(joystickItems) do
                table.insert(restoreList, {
                    address = item.address,
                    flags = gg.TYPE_FLOAT,
                    value = item.originalValue
                })
            end
            gg.setValues(restoreList)
            local addrList = {}
            for _, item in ipairs(joystickItems) do
                table.insert(addrList, {address = item.address, flags = gg.TYPE_FLOAT})
            end
            gg.removeListItems(addrList)
            joystickItems = {}
        end
        gg.clearResults()
    end
    print("sʟᴀʙ")
    os.exit()
end

while true do
    if gg.isVisible(true) then
        BPM = 1
        gg.setVisible(false)
    end
    if BPM == 1 then menu() end
end