-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "g++ build",
  builder = function()
    -- Full path to current file (see :help expand())
    -- local file = vim.fn.expand("%:p")
    return {
      cmd = { "make" },
      -- cmd = { "make clean && make && ./out/main" },
      args = { },
      components = { { "on_output_quickfix", open = true }, "default" },

      -- cmd = { "g++" },
      -- args = { file },
      -- components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
