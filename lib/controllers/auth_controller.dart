import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  /// constructor method
  AuthController({required this.authRepo});

  final AuthRepo authRepo;

  bool _isLoading = false;

  /// getters
  bool get isLoading => _isLoading;

  registration(SignUpBody signUpBody) async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpBody);

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
    } else {}
  }
}
