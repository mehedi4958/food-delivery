import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/app_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    var signUpImages = [
      't.png',
      'f.png',
      'g.png',
    ];

    void login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (phone.isEmpty) {
        showCustomSnackBar('Type in your phone number', title: 'Phone');
        // }
        // else if (!GetUtils.isPhoneNumber(phone)) {
        //   showCustomSnackBar('Type in a valid phone number',
        //       title: 'Valid phone number');
      } else if (password.isEmpty) {
        showCustomSnackBar('Type in your password', title: 'Password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password cannot be less than six characters',
            title: 'Password');
      } else {
        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: const Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/logo part 1.png'),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize:
                                  Dimensions.font20 * 3 + Dimensions.font20 / 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sign-in to your account',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      textController: phoneController,
                      hinText: 'Phone number',
                      icon: Icons.phone,
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      isObscure: true,
                      textController: passwordController,
                      hinText: 'Password',
                      icon: Icons.password_sharp,
                    ),
                    // SizedBox(height: Dimensions.height20),

                    // Row(
                    //   children: [
                    //     Expanded(child: Container()),
                    //     RichText(
                    //       text: TextSpan(
                    //         style: TextStyle(
                    //           color: Colors.grey[500],
                    //           fontSize: Dimensions.font20,
                    //         ),
                    //         text: 'Sign-in to your account',
                    //       ),
                    //     ),
                    //     SizedBox(width: Dimensions.width20),
                    //   ],
                    // ),
                    SizedBox(height: Dimensions.screenHeight * 0.05),

                    /// sign in button
                    GestureDetector(
                      onTap: () {
                        login(authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: 'Sign in',
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height30),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                        text: 'Don\'t have an account?',
                        children: [
                          TextSpan(
                            text: '  Create',
                            style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => const SignUpPage(),
                                  transition: Transition.fade),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    RichText(
                      text: TextSpan(
                        text: 'Sign in using',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16,
                        ),
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: Dimensions.radius30,
                            backgroundImage: AssetImage(
                                'assets/images/${signUpImages[index]}'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
