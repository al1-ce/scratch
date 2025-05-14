module api.writer;

import std.stdio: writef;
import std.array: split;
import std.process: execute;
import std.conv: to;
import std.algorithm.comparison: max;

import sily.bashfmt;
import sily.vector: uvec2;
import sily.html;

import api;

void writePost(Api api, Post post, uvec2 pos = uvec2.one) {

    string[] comment = post.comment.getPostText();
    string[] image = api.getImage(post, 8);

    size_t len = max(comment.length, image.length);

    post.writeHeader(pos);
    if (post.fileName != "") {
        for (int i = 0; i < len; ++i) {
            if ( i < image.length ) writef("%s ", image[i]);
            if ( i < comment.length ) writef("%s\n", comment[i]); else writef("\n");
        }
    } else {
        for (int i = 0; i < len; ++i) {
            writef("%s\n", comment[i]);
        }
    }
    writef("----------------------------------------------\n");
}

private void writeHeader(Post post, uvec2 pos) {
    writef("%s%s%s %s No.%d\n", FG.GREEN, post.name, FG.RESET, post.now, post.index);
    if (post.fileName != "") {
        writef("File: %s%s%s%s (%d KB %dx%d)\n",
                FG.BLUE, post.fileName, post.fileExtension, FG.RESET,
                post.fileSize, post.width, post.height);
    }
}


private string[] getPostText(string html, uint width = 0, bool addColor = false) {
    HTMLTag[] tags = parseHTML(html);
    string line = "";
    foreach (tag; tags) {
        line ~= getTagText(tag);
    }

    import std.array: replace;
    line = line.replace("&gt;", ">");
    line = line.replace("&lt;", "<");
    line = line.replace("&amp;", "&");
    line = line.replace("&quot;", "\"");
    line = line.replace("&#039;", "'");
    line = line.replace("&#39;", "'");

    return line.split('\n');
}

private string getTagText(HTMLTag tag) {
    import std.algorithm.searching: canFind;

    string line;

    if (tag.type == "br") { line ~= "\n"; } 

    string color = "";
    if (tag.type == "a") {
        color = FG.YELLOW;
    } else
    if (tag.type == "span" && "class" in tag.attributes && tag.attributes["class"].canFind("quote")) {
        color = FG.GREEN;
    }

    if (tag.children.length) {
        foreach (child; tag.children) {
            line ~= color;
            line ~= getTagText(child);
        }

        line ~= color;
    }

    if (tag.text.length) line ~= tag.text;

    line ~= FG.RESET;

    return line;
}

private string[] getImage(Api api, Post post, uint height) {
    string[] lines;

    string url = api.fileURL(post.board, post.timestamp.to!string ~ post.fileExtension);

    if (post.fileName != "") {
        auto pxv = execute(["pxv", "-U", url, "-r", height.to!string]);
        lines = pxv.output.split('\n')[0..$-1];
    }

    return lines;
}

