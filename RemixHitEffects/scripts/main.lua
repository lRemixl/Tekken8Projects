local UEHelpers = require("UEHelpers") -- Gives things
local config = require("config") -- Config.lua file 

-- ^NiagaraDataInterfaceArrayColor(?=.*GRL_01)

-- Variables ---
NDICC = nil
IsCalled = false -- holds whether or not OnInitBattleCallback is being executed 
IsSettingvalues = false -- isSetting values?
IsCalled = false -- holds whether or not OnInitBattleCallback is being executed
-- [0] = (R=149.999969,G=149.999969,B=1000.000000,A=1.000000) 
-- [1] = (R=0.007439,G=0.000000,B=1.000000,A=1.000000)
-- [2] = (R=0.000000,G=0.012901,B=1.000000,A=1.000000) 
-- [3] = (R=100.000000,G=100.000000,B=500.000000,A=1.000000)
-- Functions ---
local function PrintRemixLooker(string) -- Adds [RemixNiagaraDataColorTest] to all of our Prints() for debugging + clarity, also allows for easy turning off, just add a return 
    local aString = "[Remix Custom Hit Effects]: " .. string .. "\n"
    print(aString)
end



local function multipyShaderLut(arr, multiplier)
    local newArray = {}
    for i = 1, #arr do
        newArray[i] = arr[i] * multiplier
    end
    return newArray
end
local function adjustSaturation(arr, multiplier)
    local newArray = {}
    for i = 1, #arr, 4 do
        local r, g, b, a = arr[i], arr[i + 1], arr[i + 2], arr[i + 3]
        local gray = (r + g + b) / 3
        newArray[i]     = gray + (r - gray) * multiplier
        newArray[i + 1] = gray + (g - gray) * multiplier
        newArray[i + 2] = gray + (b - gray) * multiplier
        newArray[i + 3] = a -- Alpha stays the same
        newArray[i]     = math.min(math.max(newArray[i], 0), 1)
        newArray[i + 1] = math.min(math.max(newArray[i + 1], 0), 1)
        newArray[i + 2] = math.min(math.max(newArray[i + 2], 0), 1)
    end
    return newArray
end
local function findObjectSetHitEffect(uClass_I, NS_EF_Zbr_Saifu02_I, SL_0, SL_1, SL_2, SL_3, path1, path2, path3, path4)
    -- Uses Shortnames and FindObject instead of StaticFindObject as thats probs the cause of the error icl
    
    IsSettingvalues = true
    PrintRemixLooker("Setting Hit Effect ")
    PrintRemixLooker("Path1 is " .. path1)
    -- local longNamePlease = "/Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam001_3.EventScript_0.NiagaraDataInterfaceColorCurve_0" 
   local longNamePlease = path1 
   local UObjectSaifu02_CC_0 = FindObject(uClass_I,NS_EF_Zbr_Saifu02_I, longNamePlease, true)
    
    --local FnameSaifu02DI2 = "/Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam002_11.EventScript_0.NiagaraDataInterfaceColorCurve_0"
    local FnameSaifu02DI2 = path2
    local UObjectSaifu02_CC_1 = FindObject(uClass_I,NS_EF_Zbr_Saifu02_I, FnameSaifu02DI2, true)
    
   -- FnameSaifu02DI2 = "/Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam003_4.EventScript_0.NiagaraDataInterfaceColorCurve_0"
   FnameSaifu02DI2 = path3
   local UObjectSaifu02_CC_2 = FindObject(uClass_I,NS_EF_Zbr_Saifu02_I, FnameSaifu02DI2, true)
    
  --  FnameSaifu02DI2 = "/Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam_4.EventScript_0.NiagaraDataInterfaceColorCurve_0"
  FnameSaifu02DI2 = path4
  local UObjectSaifu02_CC_3 = FindObject(uClass_I,NS_EF_Zbr_Saifu02_I, FnameSaifu02DI2, true)
    
    if (UObjectSaifu02_CC_0 ~=nil and UObjectSaifu02_CC_1  ~=nil and UObjectSaifu02_CC_2  ~=nil and UObjectSaifu02_CC_3  ~=nil) then
  UObjectSaifu02_CC_0.ShaderLUT:ForEach(function(index, elem)
    SetShaderLUTValue(index, elem, SL_0) end)
  UObjectSaifu02_CC_1.ShaderLUT:ForEach(function(index, elem)
    SetShaderLUTValue(index, elem, SL_1) end)
  UObjectSaifu02_CC_2.ShaderLUT:ForEach(function(index, elem)
    SetShaderLUTValue(index, elem, SL_2) end)
  UObjectSaifu02_CC_3.ShaderLUT:ForEach(function(index, elem)
   SetShaderLUTValue(index, elem, SL_3) end)
  else
    PrintRemixLooker("UObjectSaifu02 branch is false Oh No : ( ")
end
 IsSettingvalues = false
end
function SetColorData(index, elem, lutArray) -- TArray and I aren't friends after this shit
-- 854.90196078431, 647.05882352941, 125.49019607843, 
-- 0.85490196078431, 0.64705882352941, 0.12549019607843,
--  0.85490196078431, 0.85490196078431, 0.85490196078431,
--- 85.490196078431, 64.705882352941, 12.549019607843
    PrintRemixLooker("elem type: ".. elem:get():type())
    local colorQuad = elem:get()
    local indexC = index - 1 
    

    colorQuad['R'] = lutArray[(indexC * 3) + 1 ] 
    colorQuad['G'] = lutArray[(indexC * 3 ) + 2]
    colorQuad['B'] = lutArray[(indexC * 3) + 3]

    print("colorQuad at index: " .. index)
    print("has value R:  " .. colorQuad['R'])
    print("has value G:  " .. colorQuad['G'])
    print("has value B:  " .. colorQuad['B'])
    -- PrintRemixLooker("indexC * 3 : " .. ((indexC * 3)))
    -- PrintRemixLooker("lutArray[(indexC * 3)] : " .. lutArray[(indexC * 3) + 1 ]  )
   --  PrintRemixLooker("lutArray[(indexC * 3 )] + 2] : " .. lutArray[(indexC * 3 ) + 2]  )
    -- PrintRemixLooker("lutArray[(indexC * 3) +   3]: " .. lutArray[(indexC * 3) + 3]  )
    
       -- elem:set(lutArray[index])
    
    
  
end
local function findObjectSetHitEffectArray(uClass_I, parentNiagaraSystem_I, path1, lutArrayInput)
    -- Uses Shortnames and FindObject instead of StaticFindObject as thats probs the cause of the error icl
    
    IsSettingvalues = true
    PrintRemixLooker("Setting Hit Effect ")
    PrintRemixLooker("Path1 is " .. path1)
    -- local longNamePlease = "/Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam001_3.EventScript_0.NiagaraDataInterfaceColorCurve_0" 
   local longNamePlease = path1 
   local UObjectSaifu02_CC_0 = FindObject(uClass_I,parentNiagaraSystem_I, longNamePlease, true)
    if (UObjectSaifu02_CC_0 ~=nil) then
    local colorDataS = UObjectSaifu02_CC_0.colorData
    PrintRemixLooker("colorDataS type: " .. colorDataS:type())
    colorDataS:ForEach(
  function(index, elem)
    SetColorData(index, elem, lutArrayInput)  
    end)
  else
    PrintRemixLooker("UObjectSaifu02 branch is false Oh No : ( ")
end
 IsSettingvalues = false
end
local function doFindObjectArray(UobjectTempt, uClass, NiagaraSystemNonInstance,path1, lutArrayInput)
    PrintRemixLooker("doFindObject path1 is: " .. path1)
    if (UobjectTempt ~= nil and UobjectTempt:IsValid()) then
        PrintRemixLooker("Before 2")
        -- NiagaraDataInterfaceColorCurve /Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam001_3.EventScript_0.NiagaraDataInterfaceColorCurve_0
        local aUobject = FindObject(uClass,UobjectTempt, path1, true)
         PrintRemixLooker("After 2 ")
         if aUobject ~= nil then
             PrintRemixLooker("Found object, checking validity")
             if aUobject:IsValid() then
                 PrintRemixLooker("aUobject is Valid, Calling findObjectSetHitEffect, path is : " .. path1)
                 findObjectSetHitEffectArray(uClass, UobjectTempt, path1, lutArrayInput)
                 else
                 PrintRemixLooker("aUobject is invalid, path is : " .. path1)
             end
         else
             PrintRemixLooker("aUobject is nil")
         end
      end
end
local function doFindObject(UobjectTempt, uClass, NiagaraSystemNonInstance, SL_0,SL_1,SL_2, SL_3, path1, path2, path3, path4)
    PrintRemixLooker("doFindObject path1 is: " .. path1)
    if (UobjectTempt ~= nil and UobjectTempt:IsValid()) then
        PrintRemixLooker("Before 2")
        -- NiagaraDataInterfaceColorCurve /Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02:DynamicBeam001_3.EventScript_0.NiagaraDataInterfaceColorCurve_0
        local aUobject = FindObject(uClass,UobjectTempt, path1, true)
         PrintRemixLooker("After 2 ")
         if aUobject ~= nil then
             PrintRemixLooker("Found object, checking validity")
             if aUobject:IsValid() then
                 PrintRemixLooker("aUobject is Valid, Calling findObjectSetHitEffect, path is : " .. path1)
                 findObjectSetHitEffect(uClass, UobjectTempt, SL_0,SL_1,SL_2, SL_3, path1, path2, path3, path4)
                 else
                 PrintRemixLooker("aUobject is invalid, path is : " .. path1)
             end
         else
             PrintRemixLooker("aUobject is nil")
         end
      end
end
local function OnInitBattleCallBack_Org(Context,Param)
    -- NiagaraSystem /Game/Effect/Polariswork/Character/zbr/NiagaraSystem/NS_EF_Zbr_Saifu02.NS_EF_Zbr_Saifu02
    -- NiagaraSystem /Script/Niagara.Default__NiagaraSystem
 if not (NDICC ~= nil) then
    -- NiagaraDataInterfaceArrayColor /Script/Niagara.Default__NiagaraDataInterfaceArrayColor
        -- NDICC = StaticFindObject("/Script/Niagara.Default__NiagaraDataInterfaceColorCurve")
        NDICC = StaticFindObject("/Script/Niagara.Default__NiagaraDataInterfaceArrayColor")
  end
 if(NDICC:IsValid()) then
    local path1 = nil
    local path2 = nil 
    local path3 = nil 
    local path4 = nil
    local NSClass = StaticFindObject("/Script/Niagara.Default__NiagaraSystem")
  --  if(NSClass:IsValid()) then
    local uClass = NDICC:GetClass()
    local UobjectPathRelativePackage = "DynamicBeam001_3/EventScript_0/NiagaraDataInterfaceColorCurve_5"
    local UobjectTemp = nil
    PrintRemixLooker("Before 1")
      if config.switchElectricHitEffectKazuyaColor then
        PrintRemixLooker("switchElectricHitEffectColor 1 ")
        -- NiagaraDataInterfaceArrayColor /Game/Effect/Polariswork/Character/grl/NiagaraSystem/ns_ef_GRL_01.ns_ef_GRL_01:Lightning_all_2.SpawnScript.NiagaraDataInterfaceArrayColor_0
        -- colorData in one line ((R=149.999969,G=149.999969,B=1000.000000,A=1.000000),(R=0.007439,G=0.000000,B=1.000000,A=1.000000),(R=0.000000,G=0.012901,B=1.000000,A=1.000000),(R=100.000000,G=100.000000,B=500.000000,A=1.000000))
        -- colorData array of arrays? , has four array [0] = (R=149.999969,G=149.999969,B=1000.000000,A=1.000000) [1] = (R=0.007439,G=0.000000,B=1.000000,A=1.000000), [2] = (R=0.000000,G=0.012901,B=1.000000,A=1.000000) , [3] = ((R=149.999969,G=149.999969,B=1000.000000,A=1.000000),(R=0.007439,G=0.000000,B=1.000000,A=1.000000),(R=0.000000,G=0.012901,B=1.000000,A=1.000000),(R=100.000000,G=100.000000,B=500.000000,A=1.000000)) 
        -- colorData is of type StructProperty colorData./Script/Niagara.NiagaraDataInterfaceArrayColor:colorData
        path1 = "/Game/Effect/Polariswork/Character/grl/NiagaraSystem/ns_ef_GRL_01.ns_ef_GRL_01:Lightning_all_2.SpawnScript.NiagaraDataInterfaceArrayColor_0"         
        UobjectTemp = FindObject("NiagaraSystem","ns_ef_GRL_01")
        local colorR = config.ElectricHitEffectKazuyaColor[1] / 255
        local colorG = config.ElectricHitEffectKazuyaColor[2] / 255
        local colorB = config.ElectricHitEffectKazuyaColor[3] / 255
        local lutArray = {1,1,1,1,1,1,1,1,1,1,1,1}
       --  local lutArray = {colorR * 1000, colorG * 1000, colorB * 1000, colorR, colorG, colorB, colorR, colorG, colorB, colorR * 100, colorG * 100 , colorB * 100}
        -- lets agree not to talk about this
        print(table.concat(lutArray,", "))


        lutArray[1] = colorR * 1000
        lutArray[2] = colorG * 1000
        lutArray[3] = colorB * 1000
        lutArray[4] =  colorR 
        lutArray[5] = colorG
        lutArray[6] = colorB
        lutArray[7] =  colorR
        lutArray[8] = colorG
        lutArray[9] = colorB
        lutArray[10] = colorR * 100
        lutArray[11] = colorG * 100
        lutArray[12] = colorB * 100
        print(table.concat(lutArray,", "))
        doFindObjectArray(UobjectTemp, uClass,NSClass,path1, lutArray)

     end
     if config.switchElectricHitEffectDevilJinColor then
        print("Rand")
     end
     if config.switchElectricHitEffectJinColor then
        -- NiagaraDataInterfaceCurve'NS_EF_Ant_01:BiribiriTop_2.UpdateScript.NiagaraDataInterfaceCurve_0
        print("efjdsofojis")
     end

     if config.switchElectricHitEffectReinaColor then 
        print("efjdsofojis")
     end

    end
    IsCalled = false
PrintRemixLooker("Done Function OnInitBattleCallBackV3 : ) ")
 end
local function callFunctionInstantThenDelay_org(Context, param)
    if(IsSettingvalues or IsCalled) then
        return
    end
    IsCalled = true
    ExecuteWithDelay(1500, function () OnInitBattleCallBack_Org(Context, param)end)
    
 end

------------------- MAIN -------------------

PrintRemixLooker("LOADED LOADED LOADED")
RegisterHook("/Script/Polaris.PolarisCharacterActor:OnInitBattle", callFunctionInstantThenDelay_org) 

