import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<LoginCubit, LoginState>(
      listenWhen: (prev, curr)=> curr is Loading || curr is Success
          || curr is Error ,
      listener: (context, state){
          state.whenOrNull(
            loading:(){
              showDialog(context: context, builder: (context)=>
                  const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
              );
            },
            success: (loginResponse){
                context.pop();
                context.pushNamed(Routes.homeScreen);
            },
            error: (error){
              context.pop();
              showDialog(context: context, builder:
              (context){
                return AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    error,
                    style: TextStyles.font13GrayRegular,
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      context.pop();
                    }, child:
                    Text(
                      'Got it',
                      style: TextStyles.font14LightRegular,
                    ))
                  ],
                );
              }
              );
            }
          );
      },
      child: const SizedBox.shrink(

      ),
    );
  }
}
