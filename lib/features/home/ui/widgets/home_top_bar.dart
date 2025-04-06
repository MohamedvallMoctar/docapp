import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                'Hi, Med vall',
                style: TextStyles.font18DarkBlueBold,
              ),
            Text(
              'How are you today ? ',
              style: TextStyles.font12GrayRegular,
            ),

          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGray ,
          child: SvgPicture.asset("assets/svgs/notifications.svg"),
        ),
      ],
    );
  }
}
