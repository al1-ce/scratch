module api.thread;

import std.json;

struct ThreadPage {
    /// Page index
    ulong page;

    /// Threads on page
    Thread[] threads;

    this(JSONValue j) {
        page = j["page"].get!int;
        JSONValue[] t = j["threads"].array;

        for (int i = 0; i < t.length; ++i) {
            threads ~= Thread(t[i]);
        }
    }
}

struct Thread {
    /// Thread number
    ulong index;

    /// UNIX timestamp
    ulong lastModified;

    /// Count of replies
    ulong replies;

    this(JSONValue j) {
        index = j["no"].get!ulong;
        lastModified = j["last_modified"].get!ulong;
        replies = j["replies"].get!ulong;
    }
}

