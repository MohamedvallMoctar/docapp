import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:flutter_complete_project/core/networking/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';

class HomeRepo{
  final HomeApiService _homeApiServiceService;
  HomeRepo(this
  ._homeApiServiceService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try{
        final response = await _homeApiServiceService.getSpecializations();
        return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}