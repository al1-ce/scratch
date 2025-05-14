import std.stdio;
import std.json;

import sily.getopt;

import api;

int main() {
    writeln("Welcome to cancer of 4chan");
    Api api = new Api4Chan();

    bool isDebug = false;

    if (isDebug) {

        writeln("Getting boards");
        writeln(api.boards);
        JSONValue jboards = fetch(api.boards);

        if (!( "boards" in jboards )) {
            writeln("Error: Could not get boards.");
        }

        JSONValue[] b = jboards["boards"].array;
        Board[] boards = [];

        for (int i = 0; i < b.length; ++i) {
            boards ~= Board(b[i]);
        }

        writeln("Board 5 name: ", boards[4].board);
        writeln("Board 7 usersID enabled: ", boards[6].userIDEnabled);

        import core.thread: Thread, seconds;
        Thread.sleep(seconds(1));

        writeln("Getting threads for board /vt/");
        writeln(api.threads("vt"));
        JSONValue[] jthreadPages = fetch(api.threads("vt")).array;

        ThreadPage[] pages;

        writeln("Getting pages");
        for (int i = 0; i < jthreadPages.length; ++i) {
            pages ~= ThreadPage(jthreadPages[i]);
        }

        writeln("Page 2: ", pages[1].page);
        writeln("Page 2 thread 3 reply count: ", pages[1].threads[2].replies);

        Thread.sleep(seconds(1));
        writeln("Getting posts");
        size_t threadurl = pages[0].threads[1].index; // pages[0].threads[1].index;
        writeln(api.thread("vt", threadurl));
        JSONValue[] jposts = fetch(api.thread("vt", threadurl))["posts"].array;

        Post[] posts;

        // for (int i = 0; i < jposts.length; ++i) {
        for (int i = 0; i < 15; ++i) {
            posts ~= Post(jposts[i], "vt");
        }

        // writeln("vt/0/ post: ", posts[0]);
        // writeln("vt/1/ post: ", posts[1]);

        import std.conv: to;
        for (int k = 0; k < posts.length; ++k) {
            writePost(api, posts[k]);
        }

        return 0;
    }

    JSONValue jboards = fetch(api.boards);

    if (!( "boards" in jboards )) {
        writeln("Error: Could not get boards.");
        return 1;
    }

    JSONValue[] b = jboards["boards"].array;
    Board[] boards = [];

    for (int i = 0; i < b.length; ++i) {
        boards ~= Board(b[i]);
    }

    for (int i = 0; i < boards.length; ++i) {
        write("/", boards[i].board, "/ ");
    }

    writeln();

    write("Select board: ");
    string bname = readln()[0..$-1];
    int bidx = -1;

    for (int i = 0; i < boards.length; ++i) {
        if (bname == boards[i].board) bidx = i;
    }

    if (bidx == -1) {
        writeln("Error selecting board");
        return 1;
    }

    import core.thread: Thread, seconds;
    // Thread.sleep(seconds(1));

    JSONValue[] jthreadPages = fetch(api.threads("vt")).array;
    ThreadPage[] pages;

    for (int i = 0; i < jthreadPages.length; ++i) {
        pages ~= ThreadPage(jthreadPages[i]);
    }
    for (int i = 0; i < pages.length; ++i) {
        write(pages[0].threads[0]);
    }

    return 0;
}

JSONValue fetch(string url) {
    import std.net.curl: HTTPStatusException;
    import curl = sily.curl;

    JSONValue json;

    auto onJsonParse = delegate void(string data) {
        json = parseJSON(data);
    };

    auto onJsonError = delegate void(HTTPStatusException e) {
        import core.stdc.stdlib: exit;
        import core.stdc.errno: EFAULT;
        writeln("Error ", e.status, ": ", getErrorMessage(e.status));
        exit(EFAULT);
    };

    curl.get(url).then(onJsonParse).except(onJsonError);

    return json;
}

string getErrorMessage(int status) {
    switch (status) {
        case 301: return "Moved permanently.";
        // case 301: return "Task was transferred to another repository."; break;
        case 304: return "Not modified.";
        case 403: return "Forbidden.";
        case 404: return "Resource not found.";
        // case 404: writeln("Task does not exist or user lacks read access."); break;
        case 410: return "Gone.";
        // case 410: writeln("Issues are disabled in repository."); break;
        // case 410: writeln("Task was permanently deleted."); break;
        case 422: return "Validation failed.";
        default: return "Unknown error code.";
    }
}

