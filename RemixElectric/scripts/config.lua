local _my_mod_config = {  
    -- Changes Kazuya's Electric color, for Devil Jin, Jin, Heihachi , use the other mods alongside this (Dvj_blue, Jin_blue) to change their electrics to Kazuya's then use this to change Kazuya's electric color
    switchElectricColor = false,      -- Set to true to use the below
    electricColor = {0, 0, 0},          -- Requires above to be true : (R,G,B) Values for the electric color (0-255)
    electricIntensityBoost = 1.0, -- (Brightness intensity) 1.0 is normal, values below 1.0 decrease its intensity values above 1.0 increase it , (NOT THE BEST TO USE)
    electricCOLORSaturationBooster = 1.0, -- (Color intensity) 1.0 is normal, values below 1.0 decreases saturation, values above 1.0 increase it
   ---- For Angel Jin ---- 
    switchAngelJin = false,  -- Works, Is for Angel Jin's electrics
    angelJinElectricColor = {0, 0, 0},
    ---- For Jin -----
    switchJin = false, -- Not implemented use switchElectricColor and Jin_blue mod
    jinElectricColor = {0,200,0}, -- Not implemented use switchElectricColor and Jin_blue mod
    ---- For Devil Jin -----
    switchDvjColor = false,  -- Works, has black streaks use switchElectricColor and Dvj_blue mod
    dvjElectricColor = {0, 0, 0}, -- Works, has black streaks use switchElectricColor and Dvj_blue mod 
    ---- For Reina ------
    switchReinaElectricColor = false, -- Set to true to use the below
    reinaElectricColor = {0,0,0},     -- Requires above to be true : (R,G,B) Values for the Reina's Electric color (0-255)
    reinaElectricIntensityBoost = 1.0,    --  (Brightness intensity) Set this above 1.0 to increase the intensity of the color 
    reinaElectricCOLORSaturationBooster = 1.0, -- (Color intensity) 1.0 is normal, values below 1.0 decreases saturation, values above 1.0 increase it

    switchReinaKickColor = false,     -- Set to true to use the below
    reinaKickColor = {0,0,0},         -- Requires above to be true : (R,G,B) Values for the Reina's Kick color (0-255)
    reinaKickIntensityBoost = 1.0, -- (Brightness intensity) Set this above 1.0 to increase the intensity of the color 
    reinaKickCOLORSaturationBooster = 1.0, -- (Color intensity) 1.0 is normal, values below 1.0 decreases saturation, values above 1.0 increase it
   --------------------------
    kazuyaRainbow = false, -- If you want to rainbow electrics for Dvj, or jin set this to true and use Dvj_blue or Jin_blue respectivly
    reinaRainbow = false,
}
return _my_mod_config