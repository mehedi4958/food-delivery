import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';
import 'big_text.dart';
import 'icon_and_text.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: '4.5'),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: '1287'),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              iconColor: AppColors.iconColor1,
              text: 'Normal',
            ),
            IconAndTextWidget(
              icon: Icons.location_pin,
              iconColor: AppColors.mainColor,
              text: '1.7km',
            ),
            IconAndTextWidget(
              icon: Icons.access_time_filled_rounded,
              iconColor: AppColors.iconColor2,
              text: '32 min',
            ),
          ],
        ),
      ],
    );
  }
}
