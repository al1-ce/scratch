const test = { tt() { } }

test.tt();

some.func();
new some.func();

vim.api.nvim_create_user_command("asdf", "fdasdfs");
// const d = {
//   ...d3,
//   foo: 1,
//   end() { },
//   end2() { },
// };

const Job = require("plenary.job");

Job.new({
    command: "rg",
    args: ["--files"],
    cwd: "/usr/bin",
    env: { ["a"]: "b" },
    on_exit: function (j, return_val) {
        print(return_val);
        print(j.result());
    }
}).sync();

let a;
var b;

function c() { }
let d = function () { }
var e = function () { }

const { func: obj_func } = obj

const {nvim_create_user_command: vim_api_nvim_create_user_command} = vim.api

obj.func();
