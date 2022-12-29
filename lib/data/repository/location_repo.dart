import 'package:food_delivery/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
}
