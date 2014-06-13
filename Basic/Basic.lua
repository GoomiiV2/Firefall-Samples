--========================================
-- Basic_Addon
-- Arkii      11/06/14
--========================================

--=====================
--      Events       --
--=====================
function OnWeaponChanged(args)
    -- Print out Good Job! to the system chat channel.
    Component.GenerateEvent("MY_SYSTEM_MESSAGE", {text="Good Job!"});

    -- Print Good Job! to the console.
    log("Good Job!");
end