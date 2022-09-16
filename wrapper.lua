local library = {
    ['Square'] = {
        ['Properties'] = {
            'Visible',
            'ZIndex',
            'Transparency',
            'Color',
            
            'Thickness',
            'Size',
            'Position',
            'Filled'
        },
        ['Base'] = {
            ['Visible'] = true,
            ['ZIndex'] = 1,
            ['Transparency'] = 1,
            ['Color'] = Color3.fromRGB(127, 127, 127),
            
            ['Thickness'] = 1,
            ['Size'] = Vector2.new(100, 100),
            ['Position'] = Vector2.new(0, 0),
            ['Filled'] = true
        }
    },
    ['Image'] = {
        ['Properties'] = {
            'Visible',
            'ZIndex',
            'Transparency',
            
            'Size',
            'Position',
            'Rounding',
            'Data'
        },
        ['Base'] = {
            ['Visible'] = true,
            ['ZIndex'] = 1,
            ['Transparency'] = 1,
            
            ['Size'] = Vector2.new(490, 475),
            ['Position'] = Vector2.new(0, 0),
            ['Rounding'] = 0,
            ['Data'] = syn.request(
                {
                    ['Url'] = 'https://cdn.discordapp.com/attachments/901594324670771290/908552131928285235/tab_image.png'
                }
            ).Body
        }
    },
    ['Text'] = {
        ['Properties'] = {
            'Visible',
            'ZIndex',
            'Transparency',
            'Color',
            
            'Text',
            'Size',
            'Center',
            'Outline',
            'OutlineColor',
            'Position',
            'Font'
        },
        ['Base'] = {
            ['Visible'] = true,
            ['ZIndex'] = 1,
            ['Transparency'] = 1,
            ['Color'] = Color3.fromRGB(200, 200, 200),
            
            ['Text'] = 'Tab',
            ['Size'] = 13,
            ['Center'] = false,
            ['Outline'] = false,
            ['OutlineColor'] = Color3.fromRGB(0, 0, 0),
            ['Position'] = Vector2.new(0, 0),
            ['Font'] = 2
        }
    }
}

function library:create(...)
    local objects = {}
    local object_properties_table = {...}
    
    for _, object_properties in ipairs(object_properties_table) do
        local drawing_object = Drawing.new(object_properties['Object'])
        
        for _, property in ipairs(library[object_properties['Object']]['Properties']) do
            if object_properties[property] then
                if property == 'Position' then
                    drawing_object[property] = object_properties[property] + object_properties['Offset']
                else
                    drawing_object[property] = object_properties[property]
                end
            else
                if property == 'Position' then
                    drawing_object[property] = library[object_properties['Object']]['Base'][property] + object_properties['Offset']
                else
                    drawing_object[property] = library[object_properties['Object']]['Base'][property]
                end
            end
        end
        
        table.insert(objects, drawing_object)
    end

    return objects
end

return library
