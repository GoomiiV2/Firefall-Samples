--========================================
-- Http
-- Arkii      13/06/14
--========================================

require 'string';
require 'lib/lib_Slash';

local weatherUrl = "http://api.openweathermap.org/data/2.5/weather?q=%s";

--=====================
--      Events       --
--=====================
function OnComponentLoad(args)
    LIB_SLASH.BindCallback({slash_list='weather', description='/Weather city (Look up the weather in a city)', func=LoopUpWeather});
end

--=====================
--     Callbacks     --
--=====================
function LoopUpWeather(args)
    if args.text == '' then
        Component.GenerateEvent("MY_SYSTEM_MESSAGE", {text="[Weather] Ermm I need a city to look up D:"});
    else
        if (HTTP.IsRequestPending()) then -- check if a web request is already pending
            Component.GenerateEvent("MY_SYSTEM_MESSAGE", {text="[Weather] A request is already pending, please wait a little bit and try again."});
        else
            local url = weatherUrl:format(args.text); -- Add the id
            HTTP.IssueRequest(url, "GET", nil, onHttpResponce); -- Issue the request
            -- nil can be a Lua table to be sent to the server, it will arrive as json on the other end
            -- An important note about HTTP.IssueRequest is that the content served needs to be marked as "application/json" or else the engine will reject it
        end
    end
end

function onHttpResponce(data, err)
    if (data) then
        -- Format: city, country, weather message
        local message = "[Weather] %s, %s: %s";
        message = message:format(data.name, data.sys.country, data.weather[1].description);
        Component.GenerateEvent("MY_SYSTEM_MESSAGE", {text=message});
    else
        warn(tostring(err));
    end
end