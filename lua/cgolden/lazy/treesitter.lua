return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        if lang == "html" or lang == "go" then
                            return true
                        end
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            vim.notify(
                                "File larger than 100KB treesitter disabled for performance",
                                vim.log.levels.WARN,
                                { title = "Treesitter" }
                            )
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = { "markdown" },
                },
                indent = {
                    enable = true,
                },
            })

            -- Install parsers (replaces ensure_installed)
            local wanted = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", "go", "php", "html",
            }
            local installed = require("nvim-treesitter.config").get_installed()
            local missing = vim.tbl_filter(function(p)
                return not vim.tbl_contains(installed, p)
            end, wanted)
            if #missing > 0 then
                require("nvim-treesitter").install(missing)
            end

            -- Register templ parser
            vim.filetype.add({ extension = { templ = "templ" } })
            vim.treesitter.language.register("templ", "templ")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- replaces `after`
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = false,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
