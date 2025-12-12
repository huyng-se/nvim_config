return {
    -- Load all plugin modules
    -- Each module returns a table of plugin specs
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.coding" },
    { import = "plugins.git" },
    { import = "plugins.terminal" },
    { import = "plugins.debug" },
    { import = "plugins.rustacean" },
    { import = "plugins.ux" },
    { import = "plugins.database" },
}
