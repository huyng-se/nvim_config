return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({
        sources = {
          require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee_connections.json"),
        },
      })
    end,
    keys = {
      { "<leader>dd", "<cmd>Dbee<cr>", desc = "Open Database Client" },
    },
  },
}