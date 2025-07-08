return {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require('remote-sshfs').setup({
            connections = {
                ssh_configs = {
                    vim.fn.expand "$HOME" .. "/.ssh/config",
                },
                sshfs_args = {
                    "-o reconnect",
                    "-o ConnectTimeout=5",
                }
            },
            mounts = {
                base_dir = vim.fn.expand "$HOME" .. "/.sshfs/",
                unmount_on_exit = true,
            },
            handlers = {
                on_connect = {
                    change_dir = false,
                },
                on_disconnect = {
                    clean_mount_folders = false,
                },
                on_edit = {

                },
            },
            ui = {
                select_prompts = false,
                confirm = {
                    connect = true,
                    change_dir = true,
                },
            },
            log = {
                enabled = true,
                truncate = false,
                types = {
                    all = true,
                    util = false,
                    handler = false,
                    sshfs = false,
                },
            }
        })
        local api = require('remote-sshfs.api')
        vim.keymap.set('n', '<leader>rc', api.connect, {})
        vim.keymap.set('n', '<leader>rd', api.disconnect, {})
        vim.keymap.set('n', '<leader>re', api.edit, {})
    end,
}
