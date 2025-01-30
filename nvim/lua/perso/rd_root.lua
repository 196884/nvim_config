_G.rd_root = vim.fn.getcwd()

_G.rd_get_root = function()
    return rd_root
end

_G.rd_print_root = function()
    root = rd_get_root()
    print(string.format("rd_root: %s", root))
end

_G.rd_set_root_netrw_line = function()
    buf_name = vim.api.nvim_buf_get_name(0)
    rd_root = buf_name
    vim.api.nvim_set_current_dir(rd_root)
    rd_print_root()
end

_G.rd_set_root = function()
    if vim.bo.filetype == "netrw" then
        return rd_set_root_netrw_line()
    end
    print(string.format("rd_set_root - not supported for buffer of type '%s'", vim.bo.filetype))
end

local rd_resolve_template_file = function(template_pattern, name, filename)
    local cmd = template_pattern:gsub("{" .. name .. "}", vim.fn.fnameescape(filename))
    return vim.api.nvim_replace_termcodes(cmd, true, true, true)
end

local rd_resolve_root = function(pattern)
    return rd_resolve_template_file(pattern, "RD_ROOT", rd_root)
end

_G.rd_root_cmd_wrapper = function(cmd)
    return function()
        local resolved_cmd = rd_resolve_root(cmd)
        print(string.format("FIXME:RD rd_root_cmd_wrapper - resolved_cmd: %s", resolved_cmd))
        vim.api.nvim_feedkeys(resolved_cmd, "n", false)
    end
end

vim.keymap.set('n', '<leader>sr', ':lua rd_set_root()<CR>', { desc = 'Set rd_root' })
