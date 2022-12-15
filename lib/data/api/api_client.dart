import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  /// constructor method
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    _mainHeaders = ({
      'content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    });
  }

  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late String token;
  late Map<String, String> _mainHeaders;

  void updateHeader(String token) {
    _mainHeaders = ({
      'content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    });
  }

  /// get request
  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
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
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
