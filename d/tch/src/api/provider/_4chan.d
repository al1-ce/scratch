module api.provider._4chan;

import std.format: format;

import api.provider.iapi;

final class Api4Chan: IApi {
    private const string _name   = "4chan";
    private const string _apiURL = "https://a.4cdn.org";
    private const string _stdURL = "https://s.4cdn.org";
    private const string _imgURL = "https://i.4cdn.org";

    @property string name() { return _name; }

    string boards() {
        return "%s/boards.json".format(_apiURL);
    }

    string threads(string p_board) {
        return "%s/%s/threads.json".format(_apiURL, p_board);
    }

    string thread(string p_board, size_t p_thread) {
        return "%s/%s/thread/%d.json".format(_apiURL, p_board, p_thread);
    }

    string boardURL(string p_board) {
        return "%s/%s".format(_stdURL, p_board);
    }

    string threadURL(string p_board, size_t p_thread) {
        return "%s/%s/thread/%d".format(_stdURL, p_board, p_thread);
    }

    string postURL(string p_board, size_t p_thread, size_t p_post) {
        return "%s/%s/thread/%d#p%s".format(_stdURL, p_board, p_thread, p_post);
    }

    string fileURL(string p_board, string p_filename) {
        return "%s/%s/%s".format(_imgURL, p_board, p_filename);
    }
}
