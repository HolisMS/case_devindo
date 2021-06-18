import '../models/pagination.dart';
import 'package:dio/dio.dart';
import '../models/post_model.dart';

class ServiceApi {
  Dio _dio;

  ServiceApi(this._dio);

  Future<List<PostModel>> getDataPost(Pagination params) async {
    return _dio
        .get('/posts',
            queryParameters: {
              '_start': params.start,
              '_limit': params.limit,
            },
            options: Options(headers: _headers))
        .then((value) =>
            value.data.map<PostModel>((x) => PostModel.fromJson(x)).toList());
  }

  Map<String, String> _headers = {'content-type': 'application/json'};
}
