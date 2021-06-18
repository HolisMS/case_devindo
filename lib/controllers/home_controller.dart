import '../models/pagination.dart';
import '../models/post_model.dart';
import '../services/service_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final _list = <PostModel>[].obs;
  final ServiceApi _service;
  final _pagination = Pagination().obs;
  var isLoading = false.obs;
  var _lastPage = false.obs;

  HomeController(this._service);

  List<PostModel> get list => _list.toList();
  int get limit => _pagination.value.limit!;
  int get _start => _pagination.value.start!;
  bool get lastPage => _lastPage.value;

  @override
  void onInit() {
    ever(_pagination, (_) => _fetchData());
    _changePagination(0, 10);
    super.onInit();
  }

  _fetchData() async {
    isLoading(true);
    try {
      var items = await _service.getDataPost(_pagination.value);
      if (items.isEmpty) {
        _lastPage.value = true;
      }
      _list.addAll(items);
    } finally {
      isLoading(false);
    }
  }

  void _changePagination(int start, int limit) {
    _pagination.update((val) {
      val!.start = start;
      val.limit = limit;
    });
  }

  void loadNextData() => _changePagination(_start, limit + 1);
}
