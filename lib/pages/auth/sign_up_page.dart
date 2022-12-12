import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  backgroundImage: AssetImage('assets/images/logo part 1.png'),
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
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
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
            SizedBox(height: Dimensions.height10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: 'Already have an account?',
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
                    backgroundImage:
                        AssetImage('assets/images/${signUpImages[index]}'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}