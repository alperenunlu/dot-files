return {
  -- Install markdown preview, use npx if available.
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function(plugin)
    if vim.fn.executable 'npx' then
      vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn['mkdp#util#install']()
    end
  end,
  config = function()
    vim.cmd [[
    function OpenMarkdownPreview (url)
        execute "silent ! open -g " . a:url
    endfunction
    ]]

    vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    if vim.fn.executable 'npx' then
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  end,
}