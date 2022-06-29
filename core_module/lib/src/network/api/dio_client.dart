import 'package:dependency_module/dependency_module.dart';

class DioClient {
  final String apiBaseUrl;

  DioClient({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    var options = BaseOptions(
        baseUrl: apiBaseUrl, connectTimeout: 50000, receiveTimeout: 30000);
    var dio = Dio(options);
    return dio;
  }
}
