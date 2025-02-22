local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
    },

    formatters = {
        ruff_format = {
            prepend_args = {},
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
