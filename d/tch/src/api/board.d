module api.board;

import std.json;

struct Board {
    /// Directory of board
    string board;

    /// Readable title
    string title;

    /// Is worksafe
    bool isWorksafe;

    /// How many threads on page
    ulong threadsPerPage;

    /// How many pages in board
    ulong pageCount;

    /// Max file allowed for non .webm attachments kb
    ulong maxFilesize;

    /// Max file allowed for .webm attachments kb
    ulong maxWebmFilesize;

    /// Max num of chars in post comment
    ulong maxCommentLength;

    /// Max duraction of .webm attachment seconds
    ulong maxWebmDuration;

    /// Max number of replied before stops bumping
    ulong bumpLimit;

    /// Max number of images before they're discarded
    ulong imageLimit;

    /// Cooldowns on ???? (images:60, replies:60, threads:600) ????
    ulong[string] cooldowns;

    /// Description for search engines
    string metaDescription;

    /// If spoilers are enabled
    bool spoilersEnabled = false;

    /// How many custom spoilers does board have
    ulong customSpoilerCount = 0;

    /// Are archives enabled
    bool archivesEnabled = false;

    /// Array of flags mapped to flag names
    string[string] boardFlags;

    /// Are flags enabled on board
    bool countryFlagsEnabled = false;

    /// Are poster ID tags enabled on board
    bool userIDEnabled = false;

    /// Can users submit drawings via browser or Oekaki app
    bool oekakiEnabled = false;

    /// Can users submit sjis [sjis] tag drawings
    bool sjisTagsEnabled = false;

    /// Does board support [code] tags
    bool codeTagsEnabled = false;

    /// Does board support [math] and [eqn] tags
    bool mathTagsEnabled = false;

    /// Are only text (no images) allowed
    bool imagesDisabled = false;

    /// Is name field disabled
    bool nameDisabled = false;

    /// Is webm with audio allowed
    bool audioEnabled = false;

    /// Do OPs require subject
    bool requireSubject = false;

    /// Min image width pixels
    ulong minImageWidth = 0;

    /// Min image height pixels
    ulong minImageHeight = 0;

    this(JSONValue j) {
        board            = j["board"].get!string;
        title            = j["title"].get!string;
        isWorksafe       = j["ws_board"].get!int == 1;
        threadsPerPage   = j["per_page"].get!ulong;
        pageCount        = j["pages"].get!ulong;
        maxFilesize      = j["max_filesize"].get!ulong;
        maxWebmFilesize  = j["max_webm_filesize"].get!ulong;
        maxCommentLength = j["max_comment_chars"].get!ulong;
        maxWebmDuration  = j["max_webm_duration"].get!ulong;
        bumpLimit        = j["bump_limit"].get!ulong;
        imageLimit       = j["image_limit"].get!ulong;
        // TODO: cooldowns
        metaDescription  = j["meta_description"].get!string;


        if ("spolers" in j) spoilersEnabled = j["spoilers"].get!int == 1;
        if ("custom_spoilers" in j) customSpoilerCount = j["custom_spoilers"].get!ulong;
        if ("is_archived" in j) archivesEnabled = j["is_archived"].get!int == 1;
        // TODO: boardFlags
        if ("country_flags" in j) countryFlagsEnabled = j["country_flags"].get!int == 1;
        if ("user_ids" in j) userIDEnabled = j["user_ids"].get!int == 1;
        if ("oekaki" in j) oekakiEnabled = j["oekaki"].get!int == 1;
        if ("sjis_tags" in j) sjisTagsEnabled = j["sjis_tags"].get!int == 1;
        if ("code_tags" in j) codeTagsEnabled = j["code_tags"].get!int == 1;
        if ("math_tags" in j) mathTagsEnabled = j["math_tags"].get!int == 1;
        if ("text_only" in j) imagesDisabled = j["text_only"].get!int == 1;
        if ("forced_anon" in j) nameDisabled = j["forced_anon"].get!int == 1;
        if ("webm_audio" in j) audioEnabled = j["webm_audio"].get!int == 1;
        if ("require_subject" in j) requireSubject = j["require_subject"].get!int == 1;
        if ("min_image_width" in j) minImageWidth = j["min_image_width"].get!ulong;
        if ("min_image_height" in j) minImageHeight = j["min_image_height"].get!ulong;

    }
}

// {
// 	"boards": [{
// 		"board": "a",
// 		"title": "Anime \u0026 Manga",
// 		"ws_board": 1,
// 		"per_page": 15,
// 		"pages": 10,
// 		"max_filesize": 4194304,
// 		"max_webm_filesize": 3145728,
// 		"max_comment_chars": 2000,
// 		"max_webm_duration": 120,
// 		"bump_limit": 500,
// 		"image_limit": 300,
// 		"cooldowns": {
// 			"threads": 600,
// 			"replies": 60,
// 			"images": 60
// 		},
// 		"meta_description": "\u0026quot;\/a\/ - Anime \u0026amp; Manga\u0026quot; is 4chan's imageboard dedicated to the discussion of Japanese animation and manga.",
// 		"spoilers": 1,
// 		"custom_spoilers": 1,
// 		"is_archived": 1
// 	}, {
// 		"board": "b",
// 		"title": "Random",
// 		"ws_board": 0,
// 		"per_page": 15,
// 		"pages": 10,
// 		"max_filesize": 2097152,
// 		"max_webm_filesize": 2097152,
// 		"max_comment_chars": 2000,
// 		"max_webm_duration": 120,
// 		"bump_limit": 300,
// 		"image_limit": 150,
// 		"cooldowns": {
// 			"threads": 60,
// 			"replies": 15,
// 			"images": 15
// 		},
// 		"meta_description": "\u0026quot;\/b\/ - Random\u0026quot; is the birthplace of Anonymous, and where people go to discuss random topics and create memes on 4chan.",
// 		"forced_anon": 1,
// 		"board_flags": {
// 			"AB": "Flag Name AB",
// 			"XY": "Flag Name XY"
// 		}
// 	}],
// }

