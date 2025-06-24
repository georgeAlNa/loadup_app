import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'app_link_url.dart';
import 'error/failure.dart';

class CrudDio {
  late Dio dio;

  CrudDio() {
    BaseOptions options = BaseOptions(
      baseUrl: AppLinkUrl.baseUrl,
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(options);
  }

  Future<Either<Failure, dynamic>> dioGetMethod({
    required String endPoint,
    @required String? token,
    @required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      if (kDebugMode) {
        printRequest(
          method: "GET",
          endPoint: AppLinkUrl.baseUrl + endPoint,
          headers: headers,
          token: token,
          queryParameters: queryParameters,
        );
      }
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (kDebugMode) {
        print('Status Code : ${response.statusCode}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = response.data;
        return Right(responseBody);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> dioPostMethod({
    required String endPoint,
    required Map data,
    @required String? token,
    @required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      if (kDebugMode) {
        printRequest(
          method: "POST",
          endPoint: AppLinkUrl.baseUrl + endPoint,
          headers: headers,
          token: token,
          data: data,
          queryParameters: queryParameters,
        );
      }
      var response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responsebody = response.data;
        printResponse(responsebody, response.statusCode);
        return Right(responsebody);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> dioPutMethod({
    required String endPoint,
    @required Map? data,
    @required String? token,
    @required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      if (kDebugMode) {
        printRequest(
          method: "PUT",
          endPoint: AppLinkUrl.baseUrl + endPoint,
          headers: headers,
          token: token,
          data: data,
          queryParameters: queryParameters,
        );
      }
      var response = await dio.put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        List responsebody = response.data;
        return Right(responsebody);
      } else {
        if (kDebugMode) {
          print("Server error: ${response.statusCode}, ${response.data}");
        }
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> dioPatchMethod({
    required String endPoint,
    @required Map? data,
    @required String? token,
    @required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      if (kDebugMode) {
        printRequest(
          method: "PATCH",
          endPoint: AppLinkUrl.baseUrl + endPoint,
          headers: headers,
          token: token,
          data: data,
          queryParameters: queryParameters,
        );
      }
      var response = await dio.patch(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        List responsebody = response.data;
        return Right(responsebody);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> dioDeleteMethod({
    required String endPoint,
    @required Map? data,
    @required String? token,
    @required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      if (kDebugMode) {
        printRequest(
          method: "DELETE",
          endPoint: AppLinkUrl.baseUrl + endPoint,
          headers: headers,
          token: token,
          data: data,
          queryParameters: queryParameters,
        );
      }
      var response = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        List responsebody = response.data;
        return Right(responsebody);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  void printRequest({
    required String method,
    required String endPoint,
    required Map<String, String> headers,
    Map? data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) {
    if (kDebugMode) {
      final prettyBody =
          data != null ? JsonEncoder.withIndent("  ").convert(data) : 'No Body';
      print('''
╔════════════════════════════════════════════════╗
║              🌐 $method Request               ║
╠════════════════════════════════════════════════╣
║ 🔗 URL: $endPoint
║ 🏷 Token: ${token ?? 'No Token'}
║ 📌 Headers: ${jsonEncode(headers)}
║ 🔍 Query Params: ${jsonEncode(queryParameters ?? {})}
╠════════════════════════════════════════════════╣
║ 📦 Body:
$prettyBody
╚════════════════════════════════════════════════╝
    ''');
    }
  }

  void printResponse(Map<String, dynamic> responseBody, int? statusCode) {
    final prettyJson = const JsonEncoder.withIndent("  ").convert(responseBody);
    if (kDebugMode) {
      print('''
╔════════════════════════════════════════════════╗
║            ✅ Response Received               ║
╠════════════════════════════════════════════════╣
status code : $statusCode
$prettyJson
╚════════════════════════════════════════════════╝
  ''');
    }
  }
}

// class CrudDio {
//   final Dio dio;

//   CrudDio()
//       : dio = Dio(BaseOptions(
//           baseUrl: AppLinkUrl.baseUrl,
//           receiveDataWhenStatusError: true,
//           sendTimeout: const Duration(seconds: 10),
//           receiveTimeout: const Duration(seconds: 10),
//         ));

//   Map<String, String> _buildHeaders(String? token) => {
//         'Content-Type': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       };

//   Options _buildOptions(String? token) => Options(headers: _buildHeaders(token));

//   void _logRequest({
//     required String method,
//     required String url,
//     required Map<String, String> headers,
//     Map? data,
//     Map<String, dynamic>? queryParams,
//   }) {
//     if (kDebugMode) {
//       final prettyData = data != null ? JsonEncoder.withIndent("  ").convert(data) : 'No Body';
//       print('''

// 🔹 [$method] Request 🔹
// 🔗 URL: $url
// 🔐 Headers: ${jsonEncode(headers)}
// 🔍 Query: ${jsonEncode(queryParams ?? {})}
// 📦 Body:
// $prettyData

// ''');
//     }
//   }

//   void _logResponse(dynamic data, int? statusCode) {
//     if (kDebugMode) {
//       final prettyJson = const JsonEncoder.withIndent("  ").convert(data);
//       print('''
// ✅ Response (Status $statusCode):
// $prettyJson
// ''');
//     }
//   }

//   Future<Either<Failure, dynamic>> _handleRequest(
//     Future<Response> Function() request,
//   ) async {
//     try {
//       final response = await request();
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         _logResponse(response.data, response.statusCode);
//         return Right(response.data);
//       } else {
//         return Left(ServerFailure());
//       }
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, dynamic>> dioGetMethod({
//     required String endPoint,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final headers = _buildHeaders(token);
//     _logRequest(
//       method: 'GET',
//       url: AppLinkUrl.baseUrl + endPoint,
//       headers: headers,
//       queryParams: queryParameters,
//     );
//     return _handleRequest(() => dio.get(
//           endPoint,
//           queryParameters: queryParameters,
//           options: _buildOptions(token),
//         ));
//   }

//   Future<Either<Failure, dynamic>> dioPostMethod({
//     required String endPoint,
//     required Map data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final headers = _buildHeaders(token);
//     _logRequest(
//       method: 'POST',
//       url: AppLinkUrl.baseUrl + endPoint,
//       headers: headers,
//       data: data,
//       queryParams: queryParameters,
//     );
//     return _handleRequest(() => dio.post(
//           endPoint,
//           data: data,
//           queryParameters: queryParameters,
//           options: _buildOptions(token),
//         ));
//   }

//   Future<Either<Failure, dynamic>> dioPutMethod({
//     required String endPoint,
//     required Map data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final headers = _buildHeaders(token);
//     _logRequest(
//       method: 'PUT',
//       url: AppLinkUrl.baseUrl + endPoint,
//       headers: headers,
//       data: data,
//       queryParams: queryParameters,
//     );
//     return _handleRequest(() => dio.put(
//           endPoint,
//           data: data,
//           queryParameters: queryParameters,
//           options: _buildOptions(token),
//         ));
//   }

//   Future<Either<Failure, dynamic>> dioPatchMethod({
//     required String endPoint,
//     required Map data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final headers = _buildHeaders(token);
//     _logRequest(
//       method: 'PATCH',
//       url: AppLinkUrl.baseUrl + endPoint,
//       headers: headers,
//       data: data,
//       queryParams: queryParameters,
//     );
//     return _handleRequest(() => dio.patch(
//           endPoint,
//           data: data,
//           queryParameters: queryParameters,
//           options: _buildOptions(token),
//         ));
//   }

//   Future<Either<Failure, dynamic>> dioDeleteMethod({
//     required String endPoint,
//     required Map data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     final headers = _buildHeaders(token);
//     _logRequest(
//       method: 'DELETE',
//       url: AppLinkUrl.baseUrl + endPoint,
//       headers: headers,
//       data: data,
//       queryParams: queryParameters,
//     );
//     return _handleRequest(() => dio.delete(
//           endPoint,
//           data: data,
//           queryParameters: queryParameters,
//           options: _buildOptions(token),
//         ));
//   }
// }
