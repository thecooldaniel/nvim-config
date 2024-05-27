local systemverilog = {}

function systemverilog.setupLsp()
    require('lspconfig').verible.setup({
      -- cmd = { 'verible-verilog-ls', '--rules_config_search' },
      cmd = { 'verible-verilog-ls' },
      root_dir = require('lspconfig').util.root_pattern({'.git', 'verilator.f'}),
      format_on_save = true,
      capabilites = require'cmp_nvim_lsp'.default_capabilities(),
    })
end

function systemverilog.setupLinter(lint)
  
  lint.linters_by_ft = {
    systemverilog = { 'verilator' },
    verilog = { 'verilator' },
  }

  local verilator = lint.linters.verilator
  verilator.args = {
    "-sv",
    "-Wall",
    "--bbox-sys",
    "--bbox-unsup",
    "--lint-only",
    '-f',
    vim.fs.find('verilator.f', {upward = true, stop = vim.env.HOME})[1],
    }


  lint.linters.verilator = verilator
  -- lint.linters["verilator"] = verilator

end

function systemverilog.setupTreesitter(opts)
  table.insert(opts.ensure_installed, 'verilog')
  -- table.insert(opts.highlight.disable, {'verilog', 'systemverilog'})
end


return systemverilog
