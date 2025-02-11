local test = {
	tt = function ()
	end
};
test:tt();
some:func();
some.func();
vim.api:nvim_create_user_command("asdf", "fdasdfs");
local Job = require("plenary.job");
(function()
	local __tmp = Job:new({
		command = "rg",
		args = {
			"--files"
		},
		cwd = "/usr/bin",
		env = {
			["a"] = "b"
		},
		on_exit = function(j, return_val)
			print(return_val);
			print(j:result())
		end
	})
	return __tmp:sync()
end)();
local a;
local b;
local function c()
end;
local d = function()
end;
local e = function()
end;
local obj_func;
do
	local __tmp = obj;
	obj_func = __tmp.func
end;
local vim_api_nvim_create_user_command;
do
	local __tmp = vim.api;
	vim_api_nvim_create_user_command = __tmp.nvim_create_user_command
end;
obj:func()
