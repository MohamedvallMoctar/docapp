import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/font_weight_helper.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/widgets/already_have_no_account_text.dart';
import 'package:flutter_complete_project/features/login/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import 'app_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    'Welcome Back ',
                    style: TextStyles.font32BlueBold
                    ),
                    verticalSpace(8),
                    Text(
                      'We\'re excited to have you back, can\'t wait to see what you\'ve been ',
                      style: TextStyles.font13GrayRegular
                    ),
                    verticalSpace(30),
                    Form(
                      key: formKey,
                      child:
                      Column(
                        children: [
                          const AppTextFormField(hintText: 'Email', ),
                          verticalSpace(18),
                          AppTextFormField(
                            hintText: 'Password',
                            isObscureText: isObscureText ,
                            suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility)), ),
                          verticalSpace(24),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                                'Forget passsord',
                                style: TextStyles.font13BlueRegular,
                            ),
                          ),
                          verticalSpace(40),
                          AppTextButton(
                            onPressed: (){

                            },
                            buttonText: 'Login',
                            textStyle: TextStyles.font16WhiteSemiBold,
                          ),
                          verticalSpace(16),

                          TermsAndConditionsText(),

                          verticalSpace(70),

                          AlreadyHaveNoAccountText(),



                        ],
                      )
                    ),
                  ],
                ),
              )
          ),
        )


    );
  }
}
