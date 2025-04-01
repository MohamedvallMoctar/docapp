import 'package:dio/dio.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response.dart';
import '../../features/login/data/models/login_request_body.dart';
import 'api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );




}