-- Пример использования библиотеки
local TradeScript = loadstring(game:HttpGet("https://your-host.com/trade_script_library.lua"))()

-- Создание экземпляра с конфигурацией
local myScript = TradeScript.new({
    allowedPlaceId = 7346416636, -- Опционально: проверка места
    defaultLanguage = "English",
    languages = { -- Опционально: свои переводы
        English = {
            title = "MY TRADE SCRIPT",
            onBoard = "On Board",
            accepted = "Accepted",
            scamMode = "Scam Mode",
            autoGroup = "Auto Group",
            autoVip = "Auto Vip",
            xray = "XRAY",
            jump = "JUMP",
            enableScam = "ENABLE SCAM",
            disableScam = "DISABLE SCAM",
            xrayBtn = "XRAY",
            jumpBtn = "JUMP",
            resetBtn = "RESET",
            settings = "Settings",
            close = "Close",
            transparency = "Transparency"
        }
    }
})

-- Использование методов
if myScript then
    -- Управление
    myScript:show()
    myScript:hide()
    myScript:toggleVisibility()
    
    -- Действия
    myScript:jump()
    myScript:reset()
    myScript:toggleXray()
    
    -- Настройки
    myScript:openSettings()
    myScript:closeSettings()
    myScript:setLanguage("Russian")
    myScript:setTransparency(50)
    
    -- Получение состояния
    local state = myScript:getState()
    print(state.onBoard, state.accepted)
    
    -- Установка состояния
    myScript:setState({
        scamEnabled = true,
        transparency = 30
    })
    
    -- Добавление нового языка
    myScript:addLanguage("Spanish", {
        title = "SCRIPT DE INTERCAMBIO",
        onBoard = "En tablero",
        accepted = "Aceptado",
        scamMode = "Modo estafa",
        autoGroup = "Auto grupo",
        autoVip = "Auto Vip/Oro",
        xray = "RAYOS X",
        jump = "SALTAR",
        enableScam = "ACTIVAR ESTAFA",
        disableScam = "DESACTIVAR ESTAFA",
        xrayBtn = "RAYOS X",
        jumpBtn = "SALTAR",
        resetBtn = "REINICIAR",
        settings = "Ajustes",
        close = "Cerrar",
        transparency = "Transparencia"
    })
    
    -- Закрытие скрипта
    -- myScript:destroy()
end
