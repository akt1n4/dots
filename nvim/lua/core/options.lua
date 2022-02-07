local options = {
  clipboard = "unnamedplus",
  fileencoding = "utf-8",
  number = true,
  relativenumber = true,
  autoindent = true,
  wrap = true,
  colorcolumn = '80',
  swapfile = false,
  incsearch = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,
  showmode = false,
  splitbelow = true,
  splitright = true,
  signcolumn = "yes",
}

for options, value in pairs(options) do
  vim.opt[options] = value
end
