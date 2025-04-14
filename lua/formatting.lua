-- Autoformat C/C++ files using clang-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
    callback = function()
        -- Run clang-format using the local .clang-format file
        local pos = vim.api.nvim_win_get_cursor(0) -- cursos position
        vim.cmd("silent! %!clang-format")
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})
