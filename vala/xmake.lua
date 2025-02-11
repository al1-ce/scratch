add_rules("mode.release", "mode.debug")

add_requires("glib", "gtk+3")
-- add_rules("plugin.compile_commands.autoupdate", {outputdir = ".vscode"})
target("main")
    set_kind("binary")
    add_rules("vala")
    add_files("src/**.vala")
    add_files("src/**.c")
    add_packages("glib", "gtk+3")
    set_default(true)
    add_values("vala.packages", "gtk+-3.0")
    add_values("vala.packages", "gobject-2.0")
    add_values("vala.packages", "glib-2.0")
    before_build(function (target)
        local f = io.open("meson.build", "w")
        if f == nil then return end
        local deps = target:get("values")["vala.packages"]
        local src = target:sourcebatches()["vala.build"].sourcefiles
        f:write("project('dummy', 'vala', 'c')\n")
        f:write("dependencies = [\n")
        for _, dep in ipairs(deps) do
            f:write("    dependency('" .. dep .. "'),\n")
        end
        f:write("]\n")
        f:write("sources = files(\n")
        for _, file in ipairs(src) do
            f:write("    '" .. file .. "',\n")
        end
        f:write(")\n")
        f:write("executable('dummy', sources: sources, dependencies: dependencies)\n")
        f:close()
    end)
    -- add_values("vala.flags", "-C")
target_end()

