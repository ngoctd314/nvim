local options = {
    ensure_installed = { "lua" },

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        use_languagetree = true,
    },
    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
        -- filetypes = { "html", "xml", "js", "jsx", "ts", "tsx" },
    },

    indent = { enable = true },
}

return options
