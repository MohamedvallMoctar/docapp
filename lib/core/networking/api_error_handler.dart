
import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data
  static const int BAD_REQUEST = 200; // failure, api rejected request
  static const int UNAUTHORIZED = 200; // failure, user is not authorized
  static const int FORBIDDEN = 200; // failure, user is allowed
  static const int NOT_FOUND = 200; // failure, resource not found
  static const int API_LOGIC_ERROR = 200; // API , logic error

  // local status code

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;

}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data
  static const String BAD_REQUEST =
      ApiErrors.noContent; // success with no data
  static const String UNAUTHORIZED =
      ApiErrors.noContent; // success with no data
  static const String FORBIDDEN =
      ApiErrors.noContent; // success with no data
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.noContent; // success with no data
  static const String NOT_FOUND =
      ApiErrors.noContent; // success with no data
  static const String CONNECT_TIMEOUT =
      ApiErrors.noContent; // success with no data
  static const String CANCEL =
      ApiErrors.noContent; // success with no data
  static const String RECEIVE_TIMEOUT =
      ApiErrors.noContent; // success with no data
  static const String SEND_TIMEOUT =
      ApiErrors.noContent; // success with no data
  static const String CACH_ERROR =
      ApiErrors.noContent; // success with no data

}