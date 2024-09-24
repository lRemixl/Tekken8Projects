-- Set the project name and target
target("RemixElectricCppPort")
    -- Set the target kind (shared library)
    set_kind("shared")

    -- Add source files
    add_files("dllmain.cpp")

    -- Add include directories
    add_includedirs(".")

    -- Add dependencies (link with UE4SS)
    add_deps("UE4SS")

    -- Set linking options, if needed (e.g., specifying additional libraries)
    add_links("UE4SS")

    -- Add additional configurations as needed
