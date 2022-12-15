import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = [
      't.png',
      'f.png',
      'g.png',
    ];

    void registration(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar('Type in your email', title: 'Email');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Type in a valid email address',
            title: 'Valid email address');
      } else if (password.isEmpty) {
        showCustomSnackBar('Type in your password', title: 'Password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password cannot be less than six characters',
            title: 'Password');
      } else if (name.isEmpty) {
        showCustomSnackBar('Type in your name', title: 'Name');
      } else if (phone.isEmpty) {
        showCustomSnackBar('Type in your phone number', title: 'Phone number');
      } else {
        showCustomSnackBar('All went well', title: 'Perfect');
        SignUpBody signUpBody = SignUpBody(
          email: email,
          password: password,
          name: name,
          phone: phone,
        );

        authController.registration(signUpBody).then((status) {
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
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
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
                    AppTextField(
                      textController: emailController,
                      hinText: 'Email',
                      icon: Icons.email,
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      isObscure: true,
                      textController: passwordController,
                      hinText: 'Password',
                      icon: Icons.password_sharp,
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      textController: nameController,
                      hinText: 'Name',
                      icon: Icons.person,
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      textController: phoneController,
                      hinText: 'Phone',
                      icon: Icons.phone,
                    ),
                    SizedBox(height: Dimensions.height20),

                    /// sign up button
                    GestureDetector(
                      onTap: () {
                        registration(authController);
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
                            text: 'Sign up',
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                        text: 'Already have an account?',
                        children: [
                          TextSpan(
                            text: '  Sign in',
                            style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.screenHeight * 0.05),

                    /// sign up options
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16,
                        ),
                        text: 'Sign up using',
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
