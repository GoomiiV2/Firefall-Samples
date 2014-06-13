--========================================
-- Echo_Addon
-- Arkii      11/06/14
--========================================

-- Import our library's
require 'string';
require 'lib/lib_Slash';

--=====================
--      Events       --
--=====================
function OnComponentLoad(args)
    LIB_SLASH.BindCallback({slash_list='echo', description='/echo your message: Echo back waht you say', func=OnEcho});
end

--=====================
--      Callacks     --
--=====================
function OnEcho(args)
    if args.text == '' then -- Check that we were given some text
        Component.GenerateEvent("MY_SYSTEM_MESSAGE", {text="You didn't say anything D:"});
    else -- other wise echo it back out
        Component.GenerateEvent("MY_SYSTEM_MESSAGE", {text=args.text});
    end
    
    -- Dump the whole table to the console as json
    log(tostring(args));
end