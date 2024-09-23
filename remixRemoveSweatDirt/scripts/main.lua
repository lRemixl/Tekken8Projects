local UEHelpers = require("UEHelpers") -- Required for UE4SS
local config = require("config") -- Config.lua file 
-- Hello there



-- Variables ---
NDICC = nil -- Holds Default Object of parent of property that we are looking for NOT USED

IsCalled = false -- holds whether or not OnInitBattleCallback is being executed 
IsSettingvalues = false -- isSetting values? LEFT OVER CODE
IsCalled = false -- holds whether or not OnInitBattleCallback is being executed
FighterIds_Current = {0,0} -- NOT USED
-- Functions ---
local function PrintRemixLooker(string) -- Adds [RemixNiagaraDataColorTest] to all of our Prints() for debugging + clarity, also allows for easy turning off, just add a return 
    local aString = "[Remix Remove Sweat Dirt]: " .. string .. "\n"
    print(aString)
end

local function findPropertyOfName(arrayProperty, name, number) -- looks in arrayProperty for element with a full name that contains the "name" parameter as a substring if it does adds it to the matches array/table and returns it
    local matches = {}
    PrintRemixLooker("IN findPropertyOfName")
arrayProperty:ForEach(function(index, elem)
    local potentialMatch = elem:get()
    local potentialMatchString = potentialMatch:GetFullName()
    PrintRemixLooker("potentialMatchString: " .. potentialMatchString)
    if string.find(potentialMatchString, name) then
        PrintRemixLooker("Found adding to matches")
        table.insert(matches, potentialMatch)
    end
    end)
    return matches
end

local function OnInitBattleCallBack_Org(Context,Param)
    PrintRemixLooker("OnInitBattleCallBack_Org")
 if not (NDICC ~= nil) then
        -- PolarisCharacterManager /Script/Polaris.Default__PolarisCharacterManager
        NDICC = StaticFindObject("/Script/Polaris.Default__PolarisCharacterManager") -- Get PolarisCharacterManager so we can search for it when in game using FindObject overload see RemixElectric mod for example
        ClassDefaultObjectBP_PolarisBattleGameMode_C = StaticFindObject("/Game/Battle/BP_PolarisBattleGameMode.Default__BP_PolarisBattleGameMode_C")
        -- Other types
         -- NDICC = StaticFindObject("/Script/Niagara.Default__NiagaraDataInterfaceColorCurve")
         -- NDICC = StaticFindObject("/Script/Niagara.Default__NiagaraDataInterfaceArrayColor")

  end
  local BP_PolarisBattleGameMode_C = FindFirstOf("BP_PolarisBattleGameMode_C")
  if BP_PolarisBattleGameMode_C ~= nil and BP_PolarisBattleGameMode_C:IsValid() then
    local BP_Character_Array = findPropertyOfName(BP_PolarisBattleGameMode_C.Children,"BP_Character",2 )
    PrintRemixLooker("Size of BP_Character_Array = :" .. #BP_Character_Array )
    for _, Object in pairs(BP_Character_Array) do
        if Object.PlayerNumber == 0 then 
            PrintRemixLooker("Object.PlayerNumber == 0")
         if config.IsEnableSweatDirtPlayer1 == 0 then  
         PrintRemixLooker("IsEnableSweatDirtPlayer1 == 0")
            Object.IsEnableSweatDirt = false 
         elseif config.IsEnableSweatDirtPlayer1 == 1 then
            PrintRemixLooker("IsEnableSweatDirtPlayer1 == 1")
            Object.IsEnableSweatDirt = true
         end

         if not (config.jiggleEnvelopePlayer1 == -1.00) then
            PrintRemixLooker("jiggleEnvelopePlayer1 == -1.00")
            Object.JiggleEnvelope =  config.jiggleEnvelopePlayer1
        end

         if not (config.sweatBlendPlayer1 == -1.00) then
            PrintRemixLooker("sweatBlendPlayer1 == -1.00")
         Object.SweatBlend = config.sweatBlendPlayer1
        end

        if not (config.wetnessPlayer1 == -1.00) then
            PrintRemixLooker("wetnessPlayer1 == -1.00")
            Object.Wetness = config.wetnessPlayer1
           end

           if not (config.dirtyBlendPlayer1 == -1.00) then
            PrintRemixLooker("dirtyBlendPlayer1 == -1.00")
            Object.DirtyBlend = config.dirtyBlendPlayer1
           end

        elseif Object.PlayerNumber == 1 then
            PrintRemixLooker("Object.PlayerNumber == 1")
            if config.IsEnableSweatDirtPlayer2 == 0 then  
                Object.IsEnableSweatDirt = false 
                PrintRemixLooker("IsEnableSweatDirtPlayer2 == 0")
             elseif config.IsEnableSweatDirttPlayer2 == 1 then
                Object.IsEnableSweatDirt = true
                PrintRemixLooker("IsEnableSweatDirttPlayer2 == 1")
             end

             if not (config.jiggleEnvelopePlayer2 == -1.00) then
                Object.JiggleEnvelope =  config.jiggleEnvelopePlayer2
                PrintRemixLooker("jiggleEnvelopePlayer2 == -1.00")
            end

             if not (config.sweatBlendPlayer2 == -1.00) then
             Object.SweatBlend = config.sweatBlendPlayer2
             PrintRemixLooker("sweatBlendPlayer2 == -1.00")
            end

            if not (config.wetnessPlayer2 == -1.00) then
                PrintRemixLooker("wetnessPlayer2 == -1.00")
                Object.Wetness = config.wetnessPlayer2
               end

            if not (config.dirtyBlendPlayer2 == -1.00) then
                PrintRemixLooker("dirtyBlendPlayer2 == -1.00")
                Object.DirtyBlend = config.dirtyBlendPlayer2
               end

        end
     end
    
    else
        if BP_PolarisBattleGameMode_C ~= nil then
            PrintRemixLooker("BP_PolarisBattleGameMode_C Isn't valid ")
        else 
            PrintRemixLooker("BP_PolarisBattleGameMode_C Is nil ")
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

