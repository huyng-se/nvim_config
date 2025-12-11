-- Plugin management with lazy.nvim
-- This file sets up lazy.nvim and loads all plugin modules

return {
    -- Load all plugin modules
    -- Each module returns a table of plugin specs
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.coding" },
    { import = "plugins.treesitter" },
    { import = "plugins.git" },
    { import = "plugins.terminal" },
    { import = "plugins.debug" },
    { import = "plugins.rustacean" },
}
