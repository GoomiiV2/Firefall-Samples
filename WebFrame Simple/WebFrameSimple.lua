--========================================
-- WebFrame Simple
-- Arkii      01/07/14
--========================================

-- Import our library's
require 'string';
require 'lib/lib_InterfaceOptions';
require "lib/lib_callback2"; -- only needed for the relaod bonus

--=====================
--      Constants    --
--=====================
-- Get the references to the frames and the widgets in the xml
WEB = Component.GetFrame("Main");
URL = "https://duckduckgo.com";

--=====================
--      Varables     --
--=====================
local cb_reload = nil;

-- Register our frame as moveable
InterfaceOptions.AddMovableFrame({
	frame = WEB,
	label = "WebFrame-Sample",
	scalable = true,
});

-- Add a check box to the options menu
InterfaceOptions.AddCheckBox({id="ENABLED", label="Enabled:", default=true});

--=====================
--      Events       --
--=====================
function OnComponentLoad(args)
    -- Tell the settings manager waht function to call when a setting changes
    InterfaceOptions.SetCallbackFunc(OnMessage, "WebFrame-Simple");
    
    WEB:SetUrlFilters("*"); -- Allow us to load any url
    WEB:LoadUrl(URL); -- now load the url
    WEB:Show(true);
    
    -- Bonus, un comment to have the page reload every 10 seconds
    --StartReloadCycle();
end

function OnMessage(id, val)
    if (id == "ENABLED") then -- It is the enabled checkbox
        WEB:Show(val);
    end
end

function StartReloadCycle()
    cb_reload = Callback2.CreateCycle(DoPageReload, nil);
	cb_reload:Run(10); -- Star the cycle, will run once every 10 seconds
end

function DoPageReload()
    WEB:LoadUrl(URL);
end
