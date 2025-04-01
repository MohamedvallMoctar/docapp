import 'package:flutter/material.dart';

import '../../../core/theming/styles.dart';

class AlreadyHaveNoAccountText extends StatelessWidget {
  const AlreadyHaveNoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Already have no account yet ?',
                style: TextStyles.font13GrayRegular
            ),
            TextSpan(
                text: 'Sign Up',
                style: TextStyles.font13BlueRegular
            ),
          ],
        ),
    );
  }
}
