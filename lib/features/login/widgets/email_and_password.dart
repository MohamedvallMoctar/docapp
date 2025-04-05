import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/widgets/password_validations.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {

  bool isObscureText = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState(){
  super.initState();
  passwordController = context.read<LoginCubit>().passwordController;
  setupPasswordControllerListener();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(hintText: 'Email',
          validator: (value){
            if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)){
              return 'Please enter a valid email';
            }else{
              return null;
            }
          },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            validator: (value){
              if(value == null  || value.isEmpty || !AppRegex.isPasswordValid(value) ){
                return 'Please enter a valid password';
              }else{
                return null;
              }
            },
            isObscureText: isObscureText ,
            suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility)), ),

          verticalSpace(24),
        PasswordValidations(hasLowerCase: hasLowerCase,hasSpecialCharacter: hasSpecialCharacter, hasMinmumLength: hasMinLength,hasNumber:  hasNumber, hasUpperCase:  hasUpperCase,),

        ],
      ),
    );
  }

  void setupPasswordControllerListener() {
    passwordController.addListener( (){
        setState(() {
          hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
          hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
          hasNumber = AppRegex.hasNumber(passwordController.text);
          hasMinLength = AppRegex.hasMinLength(passwordController.text);
          hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        });
    }
    );

  }

  @override
  void dispose(){
    passwordController.dispose();
    super.dispose();
  }


}
