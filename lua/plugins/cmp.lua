return {
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'onsails/lspkind-nvim' },
  { 
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)

      local cmp = require('cmp')

      opts.mapping = vim.tbl_extend('force', opts.mapping, {
        ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<cr>'] = cmp.mapping.confirm(),
        ['<tab>'] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              end
              cmp.confirm()
            else
              fallback()
            end
          end,
          { 'i', 's', 'c' }                                                             
        )
      })

      opts.sources = vim.tbl_extend('force', opts.sources, cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      }))
    end,
  },
}
