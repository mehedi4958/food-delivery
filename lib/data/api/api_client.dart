import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  /// constructor method
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = ({
      'content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    });
  }

  final String appBaseUrl;
  late String token;
  late Map<String, String> _mainHeaders;

  void updateHeader(String token) {
    _mainHeaders = ({
      'content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    });
  }

  /// get request
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  /// post request
  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
