local path = ColdBeans.path .. "assets/videos/secret.ogv"
local f = NFS.read(path)
love.filesystem.write("cbean_secret_video.ogv", f)
local love_video = love.graphics.newVideo("cbean_secret_video.ogv")
if love_video:getSource() then
    love_video:getSource():setVolume(G.SETTINGS.SOUND.volume * G.SETTINGS.SOUND.game_sounds_volume / 1000)
end

love_video:getSource().

NAMETEAM.secret_video = love_video

function NAMETEAM.start_secret_video()
    NAMETEAM.secret_video:play()
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 213,
        timer = "REAL",
        func = function()
            NAMETEAM.end_secret_video()
            return true
        end
    }))
end

function NAMETEAM.end_secret_video()
    NAMETEAM.secret_video:pause()
    NAMETEAM.secret_video:rewind()
end

local draw_hook = love.draw
function love.draw()
    draw_hook()
    if NAMETEAM.secret_video:isPlaying() then
        local x, y = love.graphics.getDimensions()
        local x_scale, y_scale = x / 1920, y / 1080
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(
            NAMETEAM.secret_video,
            0,
            0,
            0,
            3 * x_scale,
            3 * y_scale
        )
    end
end