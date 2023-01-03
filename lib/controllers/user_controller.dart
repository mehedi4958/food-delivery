import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:get/get.dart';

import '../models/response_model.dart';

class UserController extends GetxController implements GetxService {
  /// constructor method
  UserController({required this.userRepo});

  final UserRepo userRepo;

  bool _isLoading = false;
  late UserModel _userModel;

  /// getters
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  ///
  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    //update();
    Response response = await userRepo.getUserInfo();

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      responseModel = ResponseModel(true, 'successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
