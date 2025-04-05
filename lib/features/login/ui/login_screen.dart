import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/core/theming/font_weight_helper.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/widgets/already_have_no_account_text.dart';
import 'package:flutter_complete_project/features/login/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../data/models/login_request_body.dart';
import '../widgets/email_and_password.dart';
import 'app_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                    Column(
                      children: [
                        const EmailAndPassword(),
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
                            validateThenDoLogin(context);
                            context.pushNamed(Routes.homeScreen);
                          },
                          buttonText: 'Login',
                          textStyle: TextStyles.font16WhiteSemiBold,
                        ),
                        verticalSpace(16),

                        TermsAndConditionsText(),

                        verticalSpace(70),

                        AlreadyHaveNoAccountText(),



                      ],
                    ),
                  ],
                ),
              )
          ),
        )


    );
  }


  void validateThenDoLogin(BuildContext context){
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
        context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ));
    }
  }
}
