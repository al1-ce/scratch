module api.provider.iapi;

interface IApi {
    @property string name();

    string boards();
    string threads(string p_board);
    string thread(string p_board, size_t p_thread);

    string boardURL(string p_board);
    string threadURL(string p_board, size_t p_thread);
    string postURL(string p_board, size_t p_thread, size_t p_post);
    string fileURL(string p_board, string p_filename);
}
