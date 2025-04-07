import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio()  {

    Duration timeOut = const Duration(seconds: 30);

    if(dio == null ){
      dio = Dio();
      dio!
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    }else
      {
        return dio!;
      }
  }

  static void addDioHeaders(){

    dio?.options.headers = {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzQzOTg3NzU3LCJleHAiOjE3NDQwNzQxNTcsIm5iZiI6MTc0Mzk4Nzc1NywianRpIjoiZnhVVkpkaHFnR3l2ZGRaMiIsInN1YiI6IjM1NTUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2jdWNK7-IHPn9fp71XqExN1b3U6yNo_TeVJ3Pt5B6m4',
    };

  }
  static void addDioInterceptor(){
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      )
    );
  }

}
