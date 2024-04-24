---- ## Nvim Config ## ----

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	-- Check for automatic plugin updates
	checker = { enabled = true },
	spec = {
		-- Add LazyVim and its plugins
		{
			"LazyVim/LazyVim",
			opts = {
				colorscheme = "desert",
			},
			import = "lazyvim.plugins",
		},
		-- Extras plugins
		{ import = "lazyvim.plugins.extras.ui.mini-animate" },
		{ import = "lazyvim.plugins.extras.coding.copilot" },
		-- Custom plugins (override defaults)
		{ import = "plugins" },
	},
	defaults = {
		-- If false, only lazy-loads LazyVim plugins. Custom plugins will load at startup.
		lazy = false,
		-- Set to false to avoid breaking the current Neovim install with outdated plugin versions.
		version = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"getscript",
				"getscriptPlugin",
				"gzip",
				"rrhelper",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
})
