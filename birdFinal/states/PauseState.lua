--[[
    PauseState Class
    Author: Ian Skelskey
    iskelske@asu.edu

    The PauseState class offers a break for marathon players. Pauses all game animation and mutes music.
]]

PauseState = Class{__includes = BaseState}

require 'states/PlayState'

function PauseState:init()
    sounds['music']:pause()
end

function PauseState:update(dt)
     if love.keyboard.wasPressed('p') then
        sounds['pause']:play()
        gStateMachine:change('countdown')
    end

end

function PauseState:render()
end

function PauseState:enter()
    -- if we're coming from death, restart scrolling
    scrolling = false
end

--[[
    Called when this state changes to another state.
]]
function PauseState:exit()
    -- stop scrolling for the death/score screen
    scrolling = true
end