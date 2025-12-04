return {
    'stevearc/conform.nvim',
    opts = {
    default_format_opts = { lsp_format = "fallback" },

    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },

    formatters_by_ft = {
      javascript        = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescript        = { "biome", "prettierd", "prettier", stop_after_first = true },
      javascriptreact   = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescriptreact   = { "biome", "prettierd", "prettier", stop_after_first = true },
      php = { "prettier", "php_cs_fixer", "phpcbf", stop_after_first = true },
      html = { "prettier",  stop_after_first = true },
      rust = { "rustfmt" },
      go = { "gofumpt", "goimports" },
    },
  },
}

