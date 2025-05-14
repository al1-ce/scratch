module api.post;

import std.json;

struct Post {
    /// Numberic post id
    ulong index;

    /// ID of thread replied to (for OP is always 0)
    ulong thread;

    /// If thread is pinned to top of page
    bool sticky;

    /// If thread is closed to replies
    bool closed;

    /// MM/DD/YY(Day)HH:MM EST/EDT timezone
    string now;

    /// UNIX timestamp the post was created
    ulong time;

    /// Name of user posted
    string name;

    /// User's tripcode in format !tripcode or !!secure
    string trip = "";

    /// Poster's ID
    string id = "";

    /// Capcode identifier for a post (i.e mod, admin)
    string capcode = "";

    /// Poster's 2 char ISO country code
    string country = "";

    /// Country name
    string countryName = "";

    /// Poster's board flag code
    string boardFlag = "";

    /// Poster's board flag name
    string flagName = "";

    /// OP subject text
    string subject = "";

    /// HTML escaped comment
    string comment = "";

    /// UNIX timestamp + microtime of image upload (4ch image url)
    ulong timestamp = 0;

    /// Filename of attachment
    string fileName = "";

    /// Filetype
    string fileExtension = "";

    /// Size of uploaded file
    ulong fileSize = 0;

    /// MD5 hash of file
    string md5 = "";

    /// Width of image
    ulong width = 0;

    /// Height of image
    ulong height = 0;

    /// Width of thumbnail
    ulong thumbnailWidth = 0;

    /// Height of thumbnail
    ulong thumbnailHeight = 0;

    /// If file was deleted from post
    bool fileDeleted = false;

    /// Is image spoilered
    bool imageSpoiler = false;

    /// Custom spoiler ID for spoilered image
    ulong customSpoiler = 0;

    /// OP only number of replies to thread
    ulong replyCount = 0;

    /// OP only number of images to thread
    ulong imageCount = 0;

    /// Is bump limit reached
    bool bumpLimit = false;

    /// Is image limit has been reached
    bool imageLimit = false;

    /// OP only /f/ (flash) only
    string swfCategory = "";

    /// SEO URL slug
    string semanticURL = "";

    /// Year pass was bought
    ulong sincePass = 0;

    /// OP only if not archived
    ulong uniqueIPCount = 0;

    /// Does post contain mobile optimised image
    bool mobileImage = false;

    /// OP only if thread is archived
    bool archived = false;

    /// UNIX timestamp if thread was archived
    ulong archivedDate = 0;

    /// Board that's post is in
    string board = "";

    this(JSONValue j, string p_board = "") {
        index  = j["no"].get!ulong;
        thread = j["resto"].get!ulong;
        if ("sticky" in j) sticky = j["sticky"].get!ulong == 1;
        if ("closed" in j) closed = j["closed"].get!ulong == 1;
        now    = j["now"].get!string;
        time   = j["time"].get!ulong;
        name   = j["name"].get!string;

        if ("trip" in j) trip                    = j["trip"].get!string;
        if ("id" in j) id                        = j["id"].get!string;
        if ("capcode" in j) capcode              = j["capcode"].get!string;
        if ("coutry" in j) country               = j["coutry"].get!string;
        if ("coutry_name" in j) countryName      = j["coutry_name"].get!string;
        if ("board_flag" in j) boardFlag         = j["board_flag"].get!string;
        if ("flag_name" in j) flagName           = j["flag_name"].get!string;
        if ("sub" in j) subject                  = j["sub"].get!string;
        if ("com" in j) comment                  = j["com"].get!string;
        if ("tim" in j) timestamp                = j["tim"].get!ulong;
        if ("filename" in j) fileName            = j["filename"].get!string;
        if ("ext" in j) fileExtension            = j["ext"].get!string;
        if ("fsize" in j) fileSize               = j["fsize"].get!ulong;
        if ("md5" in j) md5                      = j["md5"].get!string;
        if ("w" in j) width                      = j["w"].get!ulong;
        if ("h" in j) height                     = j["h"].get!ulong;
        if ("tn_w" in j) thumbnailWidth          = j["tn_w"].get!ulong;
        if ("tn_h" in j) thumbnailHeight         = j["tn_h"].get!ulong;
        if ("filedeleted" in j) fileDeleted      = j["filedeleted"].get!ulong == 1;
        if ("spoiler" in j) imageSpoiler         = j["spoiler"].get!ulong     == 1;
        if ("custom_spoiler" in j) customSpoiler = j["custom_spoiler"].get!ulong;
        if ("replies" in j) replyCount           = j["replies"].get!ulong;
        if ("images" in j) imageCount            = j["images"].get!ulong;
        if ("bumplimit" in j) bumpLimit          = j["bumplimit"].get!ulong   == 1;
        if ("imagelimit" in j) imageLimit        = j["imagelimit"].get!ulong  == 1;
        if ("tag" in j) swfCategory              = j["tag"].get!string;
        if ("semantic_url" in j) semanticURL     = j["semantic_url"].get!string;
        if ("since4pass" in j) sincePass         = j["since4pass"].get!ulong;
        if ("unique_ips" in j) uniqueIPCount     = j["unique_ips"].get!ulong;
        if ("m_img" in j) mobileImage            = j["m_img"].get!ulong       == 1;
        if ("archived" in j) archived            = j["archived"].get!ulong    == 1;
        if ("archived_on" in j) archivedDate     = j["archived_on"].get!ulong;

        board = p_board;
    }
}

// {
//     "posts": [{
//         "no": 570368,
//         "sticky": 1,
//         "closed": 1,
//         "now": "12\/31\/18(Mon)17:05:48",
//         "name": "Anonymous",
//         "sub": "Welcome to \/po\/!",
//         "com": "Welcome to \/po\/! We specialize in origami, papercraft, and everything that\u2019s relevant to paper engineering. This board is also an great library of relevant PDF books and instructions, one of the best resource of its kind on the internet.<br><br>Questions and discussions of papercraft and origami are welcome. Threads for topics covered by paper engineering in general are also welcome, such as kirigami, bookbinding, printing technology, sticker making, gift boxes, greeting cards, and more.<br><br>Requesting is permitted, even encouraged if it\u2019s a good request; fulfilled requests strengthens this board\u2019s role as a repository of books and instructions. However do try to keep requests in relevant threads, if you can.<br><br>\/po\/ is a slow board! Do not needlessly bump threads.",
//         "filename": "yotsuba_folding",
//         "ext": ".png",
//         "w": 530,
//         "h": 449,
//         "tn_w": 250,
//         "tn_h": 211,
//         "tim": 1546293948883,
//         "time": 1546293948,
//         "md5": "uZUeZeB14FVR+Mc2ScHvVA==",
//         "fsize": 516657,
//         "resto": 0,
//         "capcode": "mod",
//         "semantic_url": "welcome-to-po",
//         "replies": 2,
//         "images": 2,
//         "unique_ips": 1
//     }]
// }
