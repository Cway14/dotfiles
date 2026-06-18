-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>:q<CR>")

if vim.g.vscode then
  local vscode = require("vscode")

  -- find (<leader>f) — matches LazyVim snacks_picker
  vim.keymap.set("n", "<leader>ff", function() vscode.action("workbench.action.quickOpen") end)
  vim.keymap.set("n", "<leader>fb", function() vscode.action("workbench.action.showAllEditors") end)
  vim.keymap.set("n", "<leader>fr", function() vscode.action("workbench.action.openRecent") end)
  vim.keymap.set("n", "<leader>fn", function() vscode.action("workbench.action.files.newUntitledFile") end)

  -- search (<leader>s) — matches LazyVim snacks_picker
  vim.keymap.set("n", "<leader>sg", function() vscode.action("workbench.action.findInFiles") end)
  vim.keymap.set("n", "<leader>sw", function() vscode.action("editor.action.addSelectionToNextFindMatch") end)
  vim.keymap.set("n", "<leader>ss", function() vscode.action("workbench.action.gotoSymbol") end)
  vim.keymap.set("n", "<leader>sS", function() vscode.action("workbench.action.showAllSymbols") end)
  vim.keymap.set("n", "<leader>sd", function() vscode.action("workbench.actions.view.problems") end)
  vim.keymap.set("n", "<leader>sh", function() vscode.action("workbench.action.showCommands") end)
  vim.keymap.set("n", "<leader>sk", function() vscode.action("workbench.action.openGlobalKeybindings") end)

  -- LSP — matches LazyVim lsp keymaps
  vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end)
  vim.keymap.set("n", "gr", function() vscode.action("editor.action.goToReferences") end)
  vim.keymap.set("n", "gI", function() vscode.action("editor.action.goToImplementation") end)
  vim.keymap.set("n", "gy", function() vscode.action("editor.action.goToTypeDefinition") end)
  vim.keymap.set("n", "<leader>ca", function() vscode.action("editor.action.quickFix") end)
  vim.keymap.set("n", "<leader>cr", function() vscode.action("editor.action.rename") end)
  vim.keymap.set("n", "<leader>cf", function() vscode.action("editor.action.formatDocument") end)

  -- diagnostics — matches LazyVim
  vim.keymap.set("n", "]d", function() vscode.action("editor.action.marker.next") end)
  vim.keymap.set("n", "[d", function() vscode.action("editor.action.marker.prev") end)
  vim.keymap.set("n", "<leader>cd", function() vscode.action("editor.action.showHover") end)

  -- git — matches LazyVim
  vim.keymap.set("n", "<leader>gg", function() vscode.action("lazygit-vscode.toggle") end)
  vim.keymap.set("n", "<leader>gb", function() vscode.action("gitlens.toggleLineBlame") end)

  -- buffers — matches LazyVim
  vim.keymap.set("n", "<leader>bd", function() vscode.action("workbench.action.closeActiveEditor") end)
  vim.keymap.set("n", "<leader>bo", function() vscode.action("workbench.action.closeOtherEditors") end)
end
