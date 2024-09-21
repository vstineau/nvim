
function Class(opts)
	vim.api.nvim_command("vsplit")
	vim.api.nvim_command("edit " .. opts.fargs[1] .. ".hpp")
	local buffer = vim.api.nvim_get_current_buf()
	local lines = {
		"",
		"#ifndef ".. string.upper(opts.fargs[1]) .. "_HPP",
		"# define ".. string.upper(opts.fargs[1]) .. "_HPP",
		"",
		"class " .. opts.fargs[1] .. " {",
		"",
		"public:",
		"	"..opts.fargs[1].."();",
		"	"..opts.fargs[1].."(const "..opts.fargs[1].."&);",
		"	~"..opts.fargs[1].."();",
		"	"..opts.fargs[1].." &operator=(const "..opts.fargs[1].."&);",
		"",
		"private:",
		"};",
		"",
		"#endif"
	}
	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
	vim.api.nvim_command(":w " .. opts.fargs[1]..".hpp")
	vim.api.nvim_command("split")
	vim.api.nvim_command("edit " .. opts.fargs[1] .. ".cpp")
	local buffer2 = vim.api.nvim_get_current_buf()
	local lines2 = {
		"",
		'#include "' .. opts.fargs[1] .. '.hpp"',
		"",
		opts.fargs[1] .. "::" .. opts.fargs[1] .."()",
		"{}",
		"",
		opts.fargs[1] .. "::" .. "~" .. opts.fargs[1] .."()",
		"{}",
		"",
		opts.fargs[1] .. "::" .. opts.fargs[1] .."(const "..opts.fargs[1].."&)",
		"{}",
		"",
		opts.fargs[1] .. "& " .. opts.fargs[1] .."::operator=(const "..opts.fargs[1].."&)",
		"{}",
		""
	}
	vim.api.nvim_buf_set_lines(buffer2, 0, -1, false, lines2)
	vim.api.nvim_command(":w " .. opts.fargs[1]..".cpp")
end

vim.api.nvim_create_user_command("BuildClass", Class, {nargs = 1})
