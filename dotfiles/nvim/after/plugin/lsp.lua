-- configure nvim-cmp with Super-tab
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require("luasnip")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<Tab>'] = cmp_action.luasnip_supertab(),
    -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- optional mapping: use ctrl-c just for snippet expansion
    -- ['<c-c>'] = cmp.mapping(function(fallback)
    --   luasnip.expand_or_jump()
    -- end),

    -- Super-Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ["<c-j>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
    --   -- they way you will only jump inside the snippet region
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   end
    -- end, { "i", "s" }),

    -- go back in snippet completion - not very useful?
    ["<c-k>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
    -- ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip', { use_show_condition = false, show_autosnippets = true } }
  })
})


local on_attach = function(client, bufnr)
    -- check :help lspconfig-keybindings
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)



--  lsp.default_keymaps({buffer = bufnr})

-- LSP Actions
-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
-- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
-- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

  -- Open diagnostics from current buffer in separate window
  vim.keymap.set("n", "<Leader>q", function()
    vim.diagnostic.setloclist({ open = false })
    vim.cmd.lwindow()
  end, { buffer = bufnr })
end

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities() -- vim.lsp.protocol.make_client_capabilities())

-- Python
lspconfig.pylsp.setup {
  on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
        -- disable other plugins and just use ruff for everything
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        pyflakes = { enabled = false },
				ruff = {
					enabled = true,
		      -- extendSelect = { "I" },
				},
        pylsp_mypy = { enabled = true }, -- ruff doesnt do typechecking
        -- No need to run black if ruff is already present?
        -- black = { enabled = true, line_length = 90 }
        jedi_completion = {
          include_params = true,
        },
			}
		}
	}
}

-- Lua
lspconfig.lua_ls.setup {
  on_attach = on_attach,
	capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
}

require("luasnip.loaders.from_vscode").load({ include = { "python" } })
