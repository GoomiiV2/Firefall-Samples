--========================================
-- mascot
-- Arkii      11/06/14
--========================================

-- Import our library's
require 'string';
require 'lib/lib_InterfaceOptions';

--=====================
--      Constants    --
--=====================
-- Get the references to the frames and the widgets in the xml
MAIN = Component.GetFrame("Main");
IMAGE = Component.GetWidget("image");

-- Register our frame as moveable
InterfaceOptions.AddMovableFrame({
	frame = MAIN,
	label = "Mascot",
	scalable = true,
});

-- Add a check box to the options menu
InterfaceOptions.AddCheckBox({id="ENABLED", label="Enabled:", default=true});

--=====================
--      Events       --
--=====================
function OnComponentLoad(args)
    -- Tell the settings manager waht function to call when a setting changes
    InterfaceOptions.SetCallbackFunc(OnMessage, "Mascot");
end

function OnMessage(id, val)
    if (id == "ENABLED") then -- It is the enabled checkbox
        IMAGE:Show(val); -- use it to show or hide the image
    end
end
