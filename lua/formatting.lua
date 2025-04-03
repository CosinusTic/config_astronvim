-- Autoformat C/C++ files using clang-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
    callback = function()
        -- Run clang-format using the local .clang-format file
        vim.cmd("silent! %!clang-format")

    end,
})
