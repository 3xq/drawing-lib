local Library = {
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
    },
    ['Offsets'] = {
        ['X'] = 100,
        ['Y'] = 100
    }
}

function Library:Set_Offset(X, Y)
    Library['Offsets']['X'] = X
    Library['Offsets']['Y'] = Y
end

function Library:Create(...)
    local Objects = {}
    local Object_Properties_Table = {...}
    
    for _, Object_Properties in ipairs(Object_Properties_Table) do
        local Drawing_Object = Drawing.new(Object_Properties['Object'])
        
        for _, Property in ipairs(Library[Object_Properties['Object']]['Properties']) do
            if Object_Properties[Property] then
                if Property == 'Position' then
                    Drawing_Object[Property] = Object_Properties[Property] + Vector2.new(Library['Offsets']['X'], Library['Offsets']['Y'])
                else
                    Drawing_Object[Property] = Object_Properties[Property]
                end
            else
                if Property == 'Position' then
                    Drawing_Object[Property] = Library[Object_Properties['Object']]['Base'][Property] + Vector2.new(Library['Offsets']['X'], Library['Offsets']['Y'])
                else
                    Drawing_Object[Property] = Library[Object_Properties['Object']]['Base'][Property]
                end
            end
        end
        
        table.insert(Objects, Drawing_Object)
    end

    return Objects
end

return Library
