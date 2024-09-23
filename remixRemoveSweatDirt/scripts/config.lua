local _mod_config_R = {

    -- IMPORTANT NOTE:  minus 1.00 means no change/default value/let game handle it  IMPORTANT 

    -- Add your own here, and change logic in main.lua to assign property value that you want, see BP_Character_CharacterAbrrevationOfSomeCharacter_C definition
    -- Some of these don't work, as other game logic controls them (some of them require calling functions to change), or they don't do anything, (more of them work if your using a customisation, its a property on the BP , isCustomisable or something, I cba to go load the game again)
    
   IsEnableSweatDirtPlayer1 = -1.00, -- -1.00 do nothing, 0 = false (disables sweat and dirt), 1 = true  (enables sweat and dirt)  CONFIRMED WORKING
   -- All the below have not been tested 
   sweatBlendPlayer1 = -1.00, 
   wetnessPlayer1 = -1.00,
   dirtyBlendPlayer1 = -1.00,
   dirtColorPlayer1 = {-1.00,0,0,0}, -- R,G,B,A for dirt color
   skinTypePlayer1 = -1.00, -- 0 = ESkinType_Default , 1 = ESkinType_Devil, 2 = ESkinType_Custom, 3 = ESkinType_Max
   isSunTanPlayer1 = -1.00, -- 0 = false, 1 = true 
   overrideTintColorCustomPlayer1 = {-1,0,0,0}, -- R,G,B,A for assumedly overriding sun tan color
   tintColorOverlaySuntanRatioPlayer1 = -1.00, -- assumedly ratio of sun tan to normal skin 
   jiggleEnvelopePlayer1 = -1.00, -- JiggleEnvelope 
 
   IsEnableSweatDirtPlayer2 = -1.00, -- -1 do nothing, 0 = false (disables sweat and dirt), 1 = true  (enables sweat and dirt)  CONFIRMED WORKING
   -- All the below have not been tested 
   sweatBlendPlayer2 = -1.00, 
   wetnessPlayer2 = -1.00,
   dirtyBlendPlayer2 = -1.00,
   dirtColorPlayer2 = {-1.00,0,0,0}, -- R,G,B,A for dirt color
   skinTypePlayer2 = -1.00, -- 0 = ESkinType_Default , 1 = ESkinType_Devil, 2 = ESkinType_Custom, 3 = ESkinType_Max
   isSunTanPlayer2 = -1.00, -- 0 = false, 1 = true 
   overrideTintColorCustomPlayer2 = {-1,0,0,0}, -- R,G,B,A for assumedly overriding sun tan color
   tintColorOverlaySuntanRatioPlayer2 = -1.00, -- assumedly ratio of sun tan to normal skin 
   jiggleEnvelopePlayer2 = -1.00 -- JiggleEnvelope 
}

return _mod_config_R