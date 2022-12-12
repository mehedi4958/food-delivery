import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  /// constructor method
  AuthController({required this.authRepo});

  final AuthRepo authRepo;
}
