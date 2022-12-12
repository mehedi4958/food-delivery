import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

class AuthRepo {
  /// constructor method
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
}
