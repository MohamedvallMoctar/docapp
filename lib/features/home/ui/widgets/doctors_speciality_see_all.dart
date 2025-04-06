import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors speciality ',
          style: TextStyles.font18DarkSemiBold,
        ),
        const Spacer(),
        Text(
          'Seel ALl',
          style: TextStyles.font12BlueRegular,
        ),

      ],
    );
  }
}
