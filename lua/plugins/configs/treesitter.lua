local options = {
    ensure_installed = { "lua" },

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 50 * 1024 -- 50 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        use_languagetree = true,
    },

    indent = { enable = true },
}

return options
