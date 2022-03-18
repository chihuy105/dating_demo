import 'package:dating_demo/all_file/all_file.dart';

enum PagingState { Ide, Fetching, FetchingMore, Empty, Fail }

extension StateTypeExtension on PagingState {
  String get hintText => [
        '',
        'Loading',
        'Empty',
        'No connection',
      ][index];
}

mixin MixinPaging<T> {
  var pageSize = AppConstant.PAGE_SIZE_DEFAULT;

  var _page = 1;

  get page => _page;

  set page(value) {
    _page = value;
  }

  final ValueNotifier<List<T>> _listNF = ValueNotifier([]);

  ValueNotifier<List<T>> get listNF => _listNF;

  List<T> get list => _listNF.value;

  final pagingStateNF = PagingState.Ide.obs;

  bool _hasMore = true;

  bool get hasMore => _hasMore;

  Future<dynamic> fetchListData(int page, int pageSize);

  /*
  If the value return from the fetchListData is NOT data list then
  override this method and transform the value
  EX: data list is contain inside fetchListData return value
   */
  List<T> transformValue(dynamic value) {
    return value as List<T>;
  }

  void onListDataChange([List<T>? value]) {}

  void loadData(bool loadMore) {
    setPagingState(PagingState.Fetching);
    fetchListData(page, pageSize)
        .then((value) => {
              if (loadMore)
                onLoadMoreSuccess(transformValue(value))
              else
                onNewList(transformValue(value))
            })
        .catchError((Object obj) {
      setPagingState(PagingState.Ide);
      logger.e('${runtimeType} ==> catchError');
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          throw obj;
      }
    });
  }

  void onRefresh() {
    page = 1;
    loadData(false);
  }

  void loadMore() {
    page++;
    loadData(true);
  }

  void onNewList(List<T> dataList) {
    if (dataList != null) {
      /// 30 data in one page, equal to 30 items, there is next page
      /// The specific processing logic is processed according to the specific interface situation, this part can be extracted
      setHasMore(dataList.length == pageSize);

      /// refresh
      list.clear();
      if (dataList.isEmpty) {
        setPagingState(PagingState.Empty);
      } else {
        addAll(dataList);
      }
    }
  }

  void onLoadMoreSuccess(List<T> dataList) {
    addAll(dataList);
  }

  void onFail() {
    /// Failed to load
    setHasMore(false);
    setPagingState(PagingState.Ide);
  }

  void setPagingState(PagingState value) {
    pagingStateNF.value = value;
  }

  void setHasMore(bool hasMore) {
    _hasMore = hasMore;
  }

  void add(T data) {
    logger.d('$T ==> add element');
    _listNF.value.add(data);
    invalidate();
  }

  void addAll(List<T> data) {
    logger.d('$T : addAll ==> ');
    _listNF.value.addAll(data);
    invalidate();
  }

  void insert(int i, T data) {
    logger.d('$T ==> insert');
    _listNF.value.insert(i, data);
    invalidate();
  }

  void insertAll(int i, List<T> data) {
    logger.d('$T ==> insertAll');
    _listNF.value.insertAll(i, data);
    invalidate();
  }

  void remove(T data) {
    logger.d('$T ==> remove');
    _listNF.value.remove(data);
    invalidate();
  }

  void removeAt(int i) {
    logger.d('$T ==> removeAt');
    _listNF.value.removeAt(i);
    invalidate();
  }

  void clear() {
    logger.d('$T ==> clear');
    _listNF.value.clear();
    invalidate();
  }

  void invalidate() {
    _listNF.value = _listNF.value;
    onListDataChange(_listNF.value);
  }
}
