import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
final getit = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio  apiService
  Dio dio = DioFactory.getDio() ;
  getit.registerLazySingleton<ApiService>(() =>ApiService(dio));

  getit.registerLazySingleton<LoginRepo>(() =>LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() =>LoginCubit(getit()));

  // home
  getit.registerLazySingleton<HomeApiService>(() =>HomeApiService(dio));

  getit.registerLazySingleton<HomeRepo>(() => HomeRepo(getit()));
  //getit.registerLazySingleton<HomeCubit>(() => HomeCubit(getit()));

}


