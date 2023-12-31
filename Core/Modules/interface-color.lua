local M = {}

local function getTextColor(rgb)
    return '[' .. rgb[1] .. ', ' .. rgb[2] .. ', ' .. rgb[3] .. ']'
end

M.new = function(rgb, listener)
    if not M.group then
        ALERT = false
        M.hexAlert = true
        M.slidersValue = {}
        M.listener = listener
        M.group = display.newGroup()

        local bg = display.newRoundedRect(CENTER_X, CENTER_Y - 120, 500, 700, 20)
            bg:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
        M.group:insert(bg)

        local block = display.newRoundedRect(CENTER_X, 320, 200, 200, 10)
            block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
        M.group:insert(block)

        local colorText = display.newText('', CENTER_X, 470, 'ubuntu', 26)
            colorText:setFillColor(unpack(LOCAL.themes.text))
            colorText.text = getTextColor(rgb)
        M.group:insert(colorText)

        local red = display.newText(STR['blocks.color.red'], CENTER_X - 120, CENTER_Y - 100, 'ubuntu', 26)
            red:setFillColor(unpack(LOCAL.themes.interfaceColors.r))
            red.anchorX = 1
        M.group:insert(red)

        local redSlider = WIDGET.newSlider({
                x = 425, y = CENTER_Y - 100,
                width = 250, value = math.round(rgb[1] / 2.55), listener = function(event)
                    if event.value then
                        if not M.hexAlert then
                            event.value = M.slidersValue[1]
                            event.target:setValue(event.value)
                        end

                        rgb[1] = math.round(event.value * 2.55)
                        colorText.text = getTextColor(rgb)
                        block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
                    end
                end
            })
        M.group:insert(redSlider)

        local redPlus = display.newRoundedRect(580, CENTER_Y - 100, 30, 30, 3)
            redPlus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
            redPlus.line1 = display.newRect(580, CENTER_Y - 100, 20, 3)
            redPlus.line2 = display.newRect(580, CENTER_Y - 100, 3, 20)
        M.group:insert(redPlus)
        M.group:insert(redPlus.line1)
        M.group:insert(redPlus.line2)

        local redMinus = display.newRoundedRect(270, CENTER_Y - 100, 30, 30, 3)
            redMinus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
            redMinus.line1 = display.newRect(270, CENTER_Y - 100, 20, 3)
        M.group:insert(redMinus)
        M.group:insert(redMinus.line1)

        local green = display.newText(STR['blocks.color.green'], CENTER_X - 120, CENTER_Y - 50, 'ubuntu', 26)
            green:setFillColor(unpack(LOCAL.themes.interfaceColors.g))
            green.anchorX = 1
        M.group:insert(green)

        local greenSlider = WIDGET.newSlider({
                x = 425, y = CENTER_Y - 50,
                width = 250, value = math.round(rgb[2] / 2.55), listener = function(event)
                    if event.value then
                        if not M.hexAlert then
                            event.value = M.slidersValue[2]
                            event.target:setValue(event.value)
                        end

                        rgb[2] = math.round(event.value * 2.55)
                        colorText.text = getTextColor(rgb)
                        block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
                    end
                end
            })
        M.group:insert(greenSlider)

        local greenPlus = display.newRoundedRect(580, CENTER_Y - 50, 30, 30, 3)
            greenPlus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
            greenPlus.line1 = display.newRect(580, CENTER_Y - 50, 20, 3)
            greenPlus.line2 = display.newRect(580, CENTER_Y - 50, 3, 20)
        M.group:insert(greenPlus)
        M.group:insert(greenPlus.line1)
        M.group:insert(greenPlus.line2)

        local greenMinus = display.newRoundedRect(270, CENTER_Y - 50, 30, 30, 3)
            greenMinus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
            greenMinus.line1 = display.newRect(270, CENTER_Y - 50, 20, 3)
        M.group:insert(greenMinus)
        M.group:insert(greenMinus.line1)

        local blue = display.newText(STR['blocks.color.blue'], CENTER_X - 120, CENTER_Y, 'ubuntu', 26)
            blue:setFillColor(unpack(LOCAL.themes.interfaceColors.b))
            blue.anchorX = 1
        M.group:insert(blue)

        local blueSlider = WIDGET.newSlider({
                x = 425, y = CENTER_Y,
                width = 250, value = math.round(rgb[3] / 2.55), listener = function(event)
                    if event.value then
                        if not M.hexAlert then
                            event.value = M.slidersValue[3]
                            event.target:setValue(event.value)
                        end

                        rgb[3] = math.round(event.value * 2.55)
                        colorText.text = getTextColor(rgb)
                        block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
                    end
                end
            })
        M.group:insert(blueSlider)

        local bluePlus = display.newRoundedRect(580, CENTER_Y, 30, 30, 3)
            bluePlus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
            bluePlus.line1 = display.newRect(580, CENTER_Y, 20, 3)
            bluePlus.line2 = display.newRect(580, CENTER_Y, 3, 20)
        M.group:insert(bluePlus)
        M.group:insert(bluePlus.line1)
        M.group:insert(bluePlus.line2)

        local blueMinus = display.newRoundedRect(270, CENTER_Y, 30, 30, 3)
            blueMinus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
            blueMinus.line1 = display.newRect(270, CENTER_Y, 20, 3)
        M.group:insert(blueMinus)
        M.group:insert(blueMinus.line1)

        -- local alpha = display.newText(STR['blocks.color.alpha'], CENTER_X - 120, CENTER_Y + 50, 'ubuntu', 26)
        --     alpha:setFillColor(0.9)
        --     alpha.anchorX = 1
        -- M.group:insert(alpha)
        --
        -- local alphaSlider = WIDGET.newSlider({
        --         x = 425, y = CENTER_Y + 50,
        --         width = 250, value = math.round(rgb[4] / 2.55), listener = function(event)
        --             if event.value then
        --                 rgb[4] = math.round(event.value * 2.55)
        --                 colorText.text = getTextColor(rgb)
        --                 block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255, rgb[4]/255)
        --             end
        --         end
        --     })
        -- M.group:insert(alphaSlider)
        --
        -- local alphaPlus = display.newRoundedRect(580, CENTER_Y + 50, 30, 30, 3)
        --     alphaPlus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
        --     alphaPlus.line1 = display.newRect(580, CENTER_Y + 50, 20, 3)
        --     alphaPlus.line2 = display.newRect(580, CENTER_Y + 50, 3, 20)
        -- M.group:insert(alphaPlus)
        -- M.group:insert(alphaPlus.line1)
        -- M.group:insert(alphaPlus.line2)
        --
        -- local alphaMinus = display.newRoundedRect(270, CENTER_Y + 50, 30, 30, 3)
        --     alphaMinus:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
        --     alphaMinus.line1 = display.newRect(270, CENTER_Y + 50, 20, 3)
        -- M.group:insert(alphaMinus)
        -- M.group:insert(alphaMinus.line1)

        local colorHexRect = display.newRect(CENTER_X, CENTER_Y + 120 - 50, 300, 50)
            colorHexRect:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
        M.group:insert(colorHexRect)

        local colorHex = display.newText('HEX', CENTER_X, CENTER_Y + 120 - 50, 'ubuntu', 26)
            colorHex:setFillColor(unpack(LOCAL.themes.text))
            colorHex:toFront()
        M.group:insert(colorHex)

        colorHexRect:addEventListener('touch', function(e)
            if M.hexAlert then
                if e.phase == 'began' then
                    display.getCurrentStage():setFocus(e.target)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd4Color))
                    e.target.click = true
                elseif e.phase == 'moved' and (math.abs(e.x - e.xStart) > 30 or math.abs(e.y - e.yStart) > 30) then
                    display.getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    e.target.click = false
                elseif e.phase == 'ended' or e.phase == 'cancelled' then
                    display.getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    if e.target.click then
                        e.target.click, M.hexAlert = false, false
                        M.slidersValue = {redSlider.value, greenSlider.value, blueSlider.value}
                        INPUT.new(STR['blocks.color.hex'], function(event)
                            if (event.phase == 'ended' or event.phase == 'submitted') and not ALERT then
                                INPUT.remove(true, event.target.text)
                            end
                        end, function(e)
                            if e.input then
                                e.text = UTF8.trim(e.text)
                                if UTF8.sub(e.text, 1, 1) == '#' then e.text = UTF8.sub(e.text, 2, 7) end
                                -- if UTF8.len(e.text) == 6 then e.text = e.text .. 'FF' end
                                if UTF8.len(e.text) ~= 6 then e.text = 'FFFFFF' end local errorHex = false
                                local filterHex = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'}
                                for indexHex = 1, 6 do local symHex = UTF8.upper(UTF8.sub(e.text, indexHex, indexHex))
                                    for i = 1, #filterHex do if symHex == filterHex[i] then break elseif i == #filterHex then errorHex = true end end
                                end if errorHex then e.text = 'FFFFFF' end
                                rgb = math.hex(e.text)
                                colorText.text = getTextColor(rgb)
                                redSlider:setValue(math.round(rgb[1] / 2.55))
                                greenSlider:setValue(math.round(rgb[2] / 2.55))
                                blueSlider:setValue(math.round(rgb[3] / 2.55))
                                -- alphaSlider:setValue(math.round(rgb[4] / 2.55))
                                block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
                            end ALERT, M.hexAlert = false, true timer.performWithDelay(1, function() EXITS.add(M.remove, false) end)
                        end) native.setKeyboardFocus(INPUT.box)
                    end
                end
            end return true
        end)

        local colorButton = display.newRect(CENTER_X + 120, CENTER_Y + 210 - 50, 248, 101.6)
            colorButton:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
        M.group:insert(colorButton)

        local colorButtonText = display.newText({
                font = 'ubuntu.ttf', width = 180, height = 80, text = STR['button.okay'],
                x = CENTER_X + 120, y = CENTER_Y + 232 - 50, fontSize = 26, align = 'center'
            }) colorButtonText:setFillColor(unpack(LOCAL.themes.text))
        M.group:insert(colorButtonText)

        colorButton:addEventListener('touch', function(e)
            if M.hexAlert then
                if e.phase == 'began' then
                    display.getCurrentStage():setFocus(e.target)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd4Color))
                    e.target.click = true
                elseif e.phase == 'moved' and (math.abs(e.x - e.xStart) > 30 or math.abs(e.y - e.yStart) > 30) then
                    display:getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    e.target.click = false
                elseif e.phase == 'ended' or e.phase == 'cancelled' then
                    display.getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    if e.target.click then
                        e.target.click = false
                        M.remove(true, getTextColor(rgb))
                    end
                end
            end return true
        end)

        local colorPlus = function(e, colorName)
            if M.hexAlert then
                if e.phase == 'began' then
                    display.getCurrentStage():setFocus(e.target)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd4Color))
                    e.target.click = true
                elseif e.phase == 'moved' and (math.abs(e.x - e.xStart) > 30 or math.abs(e.y - e.yStart) > 30) then
                    display:getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    e.target.click = false
                elseif e.phase == 'ended' or e.phase == 'cancelled' then
                    display.getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    if e.target.click then
                        e.target.click = false
                        if colorName == 'red' then
                            rgb[1] = rgb[1] < 255 and rgb[1] + 1 or 255
                            redSlider:setValue(math.round(rgb[1] / 2.55))
                        elseif colorName == 'green' then
                            rgb[2] = rgb[2] < 255 and rgb[2] + 1 or 255
                            greenSlider:setValue(math.round(rgb[2] / 2.55))
                        elseif colorName == 'blue' then
                            rgb[3] = rgb[3] < 255 and rgb[3] + 1 or 255
                            blueSlider:setValue(math.round(rgb[3] / 2.55))
                        -- elseif colorName == 'alpha' then
                        --     rgb[4] = rgb[4] < 255 and rgb[4] + 1 or 255
                        --     blueSlider:setValue(math.round(rgb[4] / 2.55))
                        end colorText.text = getTextColor(rgb)
                        block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
                    end
                end
            end return true
         end

        local colorMinus = function(e, colorName)
            if M.hexAlert then
                if e.phase == 'began' then
                    display.getCurrentStage():setFocus(e.target)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd4Color))
                    e.target.click = true
                elseif e.phase == 'moved' and (math.abs(e.x - e.xStart) > 30 or math.abs(e.y - e.yStart) > 30) then
                    display:getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    e.target.click = false
                elseif e.phase == 'ended' or e.phase == 'cancelled' then
                    display.getCurrentStage():setFocus(nil)
                    e.target:setFillColor(unpack(LOCAL.themes.bgAdd3Color))
                    if e.target.click then
                        e.target.click = false
                        if colorName == 'red' then
                            rgb[1] = rgb[1] > 0 and rgb[1] - 1 or 0
                            redSlider:setValue(math.round(rgb[1] / 2.55))
                        elseif colorName == 'green' then
                            rgb[2] = rgb[2] > 0 and rgb[2] - 1 or 0
                            greenSlider:setValue(math.round(rgb[2] / 2.55))
                        elseif colorName == 'blue' then
                            rgb[3] = rgb[3] > 0 and rgb[3] - 1 or 0
                            blueSlider:setValue(math.round(rgb[3] / 2.55))
                        -- elseif colorName == 'alpha' then
                        --     rgb[4] = rgb[4] > 0 and rgb[4] - 1 or 0
                        --     blueSlider:setValue(math.round(rgb[4] / 2.55))
                        end colorText.text = getTextColor(rgb)
                        block:setFillColor(rgb[1]/255, rgb[2]/255, rgb[3]/255)
                    end
                end
            end return true
        end

        EXITS.add(M.remove, false) M.group:toFront()
        redPlus:addEventListener('touch', function(e) colorPlus(e, 'red') return true end)
        redMinus:addEventListener('touch', function(e) colorMinus(e, 'red') return true end)
        greenPlus:addEventListener('touch', function(e) colorPlus(e, 'green') return true end)
        greenMinus:addEventListener('touch', function(e) colorMinus(e, 'green') return true end)
        bluePlus:addEventListener('touch', function(e) colorPlus(e, 'blue') return true end)
        blueMinus:addEventListener('touch', function(e) colorMinus(e, 'blue') return true end)
        -- alphaPlus:addEventListener('touch', function(e) colorPlus(e, 'alpha') return true end)
        -- alphaMinus:addEventListener('touch', function(e) colorMinus(e, 'alpha') return true end)
    end
end

M.remove = function(input, rgb)
    if M and M.group then
        ALERT = true
        INPUT.remove(false)
        native.setKeyboardFocus(nil)
        M.listener({input = input, rgb = rgb})
        M.group:removeSelf()
        M.group = nil
    end
end

return M
