import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinmumLength;

  const PasswordValidations({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharacter, required this.hasNumber, required this.hasMinmumLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At Least 1 lower case letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 upper case letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 number ', hasNumber),
        verticalSpace(2),
        buildValidationRow('At Least 6 characters', hasMinmumLength),
        verticalSpace(2),
        buildValidationRow('At Least 1 special character ', hasSpecialCharacter),
        verticalSpace(2),
      ],
    );



  }

  Widget buildValidationRow(String text, bool hasValidated){
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(text,
        style: TextStyles.font13DarkBlueMedium.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidated ? ColorsManager.darkBlue : Colors.red,
        ),
        ),

      ],
    );
  }
}
