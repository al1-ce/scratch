package std;

#if js
    import js.Browser;
#end

function println(text: String) {
    #if js
        js.Browser.console.log(text);
    #end
    #if lua
        Sys.println(text);
    #end

}
