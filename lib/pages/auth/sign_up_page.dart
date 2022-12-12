import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimension.dart';

import '../../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
        ],
      ),
    );
  }
}
