-- :h mason-default-settings
local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})


local servers = {
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  clangd = require("lsp.config.clangd"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end


--[[
   [-- 一定要在前面先加载上
   [local lspconfig = require('lspconfig')
   [
   [require("mason-lspconfig").setup_handlers({
   [  function (server_name)
   [    require("lspconfig")[server_name].setup{}
   [  end,
   [  -- Next, you can provide targeted overrides for specific servers.
   [  ["lua_ls"] = function ()
   [    lspconfig.lua_ls.setup {
   [      settings = {
   [        Lua = {
   [          diagnostics = {
   [            globals = { "vim" }
   [          }
   [        }
   [    }
   [  }
   [  end,
   [  ["clangd"] = function ()
   [    lspconfig.clangd.setup {
   [      cmd = {
   [        "clangd",
   [        "--header-insertion=never",
   [        "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
   [        "--all-scopes-completion",
   [        "--completion-style=detailed",
   [      }
   [    }
   [  end
   [})
   ]]
