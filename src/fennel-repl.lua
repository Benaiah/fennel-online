local js = require("js")

package.path = "./lib/?.lua"
local fennel = require("fennel")

print("hello world")
print(fennel.eval("(+ 1 2)"))
local document = js.global.document

function get_input_element()
    return document:getElementById("fennel-repl-input")
end

function get_output_element()
    return document:getElementById("fennel-repl-output")
end

local input_element = get_input_element()
local output_element = get_output_element()

input_element:addEventListener(
    "keydown",
    function (_, event)
        -- enter submits
        if event.keyCode == 13 and not event.shiftKey then
            event:preventDefault()
            event:stopPropagation()
            local input = input_element.value
            output_element.textContent = fennel.eval(input)
            input_element.value = ""
        end
    end
)

