return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})
        require('telescope').load_extension 'remote-sshfs'
        local builtin = require('telescope.builtin')
        local api = require('remote-sshfs.api')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        local connections = require("remote-sshfs.connections")
        vim.keymap.set('n', '<leader>ff', function()
            if connections.is_connected() then
                api.find_files()
            else
                builtin.find_files()
            end
        end, {})
        vim.keymap.set('n', '<leader>fg', function()
            if connections.is_connected() then
                api.live_grep()
            else
                builtin.live_grep()()
            end
        end, {})
    end
}

