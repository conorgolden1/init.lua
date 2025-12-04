return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            -- JS / TS
            "biome", -- fast formatter+linter
            "prettierd", -- daemonized Prettier (fallback)

            -- PHP
            "php-cs-fixer",
            "phpcbf",

            -- Go
            "gofumpt",
            "goimports",
            -- (Rustfmt comes from your Rust toolchain, not Mason)
        },
        auto_update = true,
        run_on_start = true,
    },
}
