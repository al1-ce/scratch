local _ENV = require("castl.runtime");
local t2,t1,plenary,smt,Smt,test;

Smt = (function (this)
this.a = 42;
do return _obj({
["a"] = 73
}); end
end);
test = _obj({
["constructor"] = (function (this)
local a;
a = 1234;
end),
["asdf"] = (function (this)
do return "asdfsdf"; end
end),
["method"] = (function (this, params)

end)
});
test:asdf();
test:constructor();
tset:method();
smt = _new(Smt);
plenary = require(_ENV,"plenary.async");
t1 = 323;
t2 = 938;
t1 = _inc(t1);
t2 = _inc(t2);