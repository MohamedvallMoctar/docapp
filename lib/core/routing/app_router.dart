import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter_complete_project/features/login/ui/login_screen.dart';
import 'package:flutter_complete_project/features/onboarding/onboarding_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/home_screen.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.onBoardingScreen :
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen :
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context)=> getit<LoginCubit>(),
            child: const LoginScreen(),
        ),);

      case Routes.homeScreen :
        return MaterialPageRoute(builder: (_)=>
        BlocProvider(
            create: (context) => HomeCubit(getit())..getSpecializations(),
            child: const HomeScreen())
        );
      default :
        return null;
    }
  }
}