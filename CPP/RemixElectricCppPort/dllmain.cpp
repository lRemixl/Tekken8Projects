#include <stdio.h>
#include <Mod/CppUserModBase.hpp>

class RemixElectricCppPort : public RC::CppUserModBase
{
public:
    RemixElectricCppPort() : CppUserModBase()
    {
        ModName = STR("RemixElectricCppPort");
        ModVersion = STR("1.0");
        ModDescription = STR("This is my awesome mod");
        ModAuthors = STR("Remix");
        // Do not change this unless you want to target a UE4SS version
        // other than the one you're currently building with somehow.
        //ModIntendedSDKVersion = STR("2.6");
        
        printf("RemixElectricCppPort says hello\n");
    }

    ~RemixElectricCppPort() override
    {
    }

    auto on_update() -> void override
    {
    }
};

#define MY_AWESOME_MOD_API __declspec(dllexport)
extern "C"
{
    MY_AWESOME_MOD_API RC::CppUserModBase* start_mod()
    {
        return new RemixElectricCppPort();
    }

    MY_AWESOME_MOD_API void uninstall_mod(RC::CppUserModBase* mod)
    {
        delete mod;
    }
}