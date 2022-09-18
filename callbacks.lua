local contextactionservice = game:GetService('ContextActionService')

local objects = {}
local callback = {}

local players = game:GetService('Players')
local guiservice = game:GetService('GuiService')

local localplayer = players.LocalPlayer
local mouse = localplayer:GetMouse()

function handle(action, state, object)
    local gui_inset = guiservice:GetGuiInset()
    local mouse_position = Vector2.new(mouse.X + gui_inset.X, mouse.Y + gui_inset.Y)
    
    if state == Enum.UserInputState.End then
        for _, data in ipairs(objects) do
            local corners = data[1]
            local callback = data[3]
            
            if (mouse_position.X > corners[1] and mouse_position.X < corners[2]) and (mouse_position.Y > corners[3] and mouse_position.Y < corners[4]) then
                callback()
            end
        end
    end
end

function callback:new(object, callback)
    local data = {{}}
    
    table.insert(data[1], object.Position.X)
    table.insert(data[1], object.Position.X + object.Size.X)
    table.insert(data[1], object.Position.Y)
    table.insert(data[1], object.Position.X + object.Size.Y)
    
    table.insert(data, object)
    table.insert(data, callback)
    
    table.insert(objects, data)
end

contextactionservice:BindAction('handle', handle, false, Enum.UserInputType.MouseButton1)

return callback
