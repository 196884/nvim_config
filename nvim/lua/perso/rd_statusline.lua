local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [" "] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["r"] = "PROMPT",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_color()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color   = "%#RdStatusLineModeAccent#"
    if current_mode == "i" or current_mode == "ic" then
        mode_color = "%#RdStatusLineInsertModeAccent#"
    end
    return mode_color
end

local function file_path()
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
    if fpath == "" or fpath == "." then
        return " "
    end
    return string.format(" %%<%s/", fpath)
end

local function file_name()
    local fname = vim.fn.expand "%:t"
    if fname == "" then
        return ""
    end
    -- flags:
    -- %m: modified ([+])
    -- %R: read only
    return fname .. "%m%R "
end

local function file_type()
    if vim.bo.filetype == "" then
        return ""
    end
    return string.format(" (%s) ", vim.bo.filetype):upper()
end

local function line_info()
    if vim.bo.filetype == "alpha" then
        return ""
    end
    -- %= for alignment
    -- %l line nb
    -- %c col nb
    -- %p line %
    -- %L total nb lines
    return "%=L%l:C%c %p%%/%L"
end

RdStatusline = {}

RdStatusline.active = function()
    result = table.concat({
        update_mode_color(),
        mode(),
        "%#RdStatusLineAccent#",
        --"%#Normal#",
        file_path(),
        file_name(),
        file_type(),
        line_info(),
    })
    return result
end

RdStatusline.inactive = function()
    return table.concat({
        "%#RdStatusLineNCAccent#",
        " %F"
    })
end

vim.api.nvim_exec([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.RdStatusline.active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.RdStatusline.inactive()
    augroup END
]], false)

