-- Specify the required version of xmake
set_xmakever("2.3.4")
set_languages("cxx20")
set_toolchains("msvc", "rust")
set_project("CPP")
	
-- Add subdirectories (these correspond to submodules or other xmake.lua files in the directories)
includes("RE-UE4SS")
includes("RemixElectricCppPort")
