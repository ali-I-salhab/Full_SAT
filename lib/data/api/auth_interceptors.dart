// // import 'package:dio/dio.dart';
// // import 'package:osta/core/helpers/cache_helper.dart';
// //
// // class AuthInterceptor extends Interceptor {
// //   final Dio _dio;
// //
// //   AuthInterceptor(this._dio);
// //
// //   @override
// //   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
// //     if (options.headers["requiresToken"] == false) {
// //       // if the request doesn't need token, then just continue to the next interceptor
// //       options.headers.remove("requiresToken"); //remove the auxiliary header
// //       return handler.next(options);
// //     }
// //
// //     // get tokens from local storage, you can use Hive or flutter_secure_storage
// //     final accessToken = CacheHelper.getStringData(key: 'userToken');
// //
// //     if (accessToken == null ) {
// //       _performLogout(_dio);
// //
// //       // create custom dio error
// //       options.extra["tokenErrorType"] = TokenErrorType.tokenNotFound; // I use enum type, you can chage it to string
// //       final error = DioError(requestOptions: options, type: DioErrorType.other);
// //       return handler.reject(error);
// //     }
// //
// //     // check if tokens have already expired or not
// //     // I use jwt_decoder package
// //     // Note: ensure your tokens has "exp" claim
// //     final accessTokenHasExpired = JwtDecoder.isExpired(accessToken);
// //     final refreshTokenHasExpired = JwtDecoder.isExpired(refreshToken);
// //
// //     var _refreshed = true;
// //
// //     if (refreshTokenHasExpired) {
// //       _performLogout(_dio);
// //
// //       // create custom dio error
// //       options.extra["tokenErrorType"] = TokenErrorType.refreshTokenHasExpired;
// //       final error = DioError(requestOptions: options, type: DioErrorType.other);
// //
// //       return handler.reject(error);
// //     } else if (accessTokenHasExpired) {
// //       // regenerate access token
// //       _dio.interceptors.requestLock.lock();
// //       _refreshed = await _regenerateAccessToken();
// //       _dio.interceptors.requestLock.unlock();
// //     }
// //
// //     if (_refreshed) {
// //       // add access token to the request header
// //       options.headers["Authorization"] = "Bearer $accessToken";
// //       return handler.next(options);
// //     } else {
// //       // create custom dio error
// //       options.extra["tokenErrorType"] = TokenErrorType.failedToRegenerateAccessToken;
// //       final error = DioError(requestOptions: options, type: DioErrorType.other);
// //       return handler.reject(error);
// //     }
// //   }
// //
// //   @override
// //   void onError(DioError err, ErrorInterceptorHandler handler) {
// //     if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
// //       // for some reasons the token can be invalidated before it is expired by the backend.
// //       // then we should navigate the user back to login page
// //
// //       _performLogout(_dio);
// //
// //       // create custom dio error
// //       err.type = DioErrorType.other;
// //       err.requestOptions.extra["tokenErrorType"] = TokenErrorType.invalidAccessToken;
// //     }
// //
// //     return handler.next(err);
// //   }
// //
// //   void _performLogout(Dio dio) {
// //     _dio.interceptors.requestLock.clear();
// //     _dio.interceptors.requestLock.lock();
// //
// //     _localStorage.removeTokens(); // remove token from local storage
// //
// //     // back to login page without using context
// //     // check this https://stackoverflow.com/a/53397266/9101876
// //     navigatorKey.currentState?.pushReplacementNamed(LoginPage.routeName);
// //
// //     _dio.interceptors.requestLock.unlock();
// //   }
// //
// //   /// return true if it is successfully regenerate the access token
// //   Future<bool> _regenerateAccessToken() async {
// //     try {
// //       var dio = Dio(); // should create new dio instance because the request interceptor is being locked
// //
// //       // get refresh token from local storage
// //       final refreshToken = _localStorage.getRefreshToken();
// //
// //       // make request to server to get the new access token from server using refresh token
// //       final response = await dio.post(
// //         "https://yourDomain.com/api/refresh",
// //         options: Options(headers: {"Authorization": "Bearer $refreshToken"}),
// //       );
// //
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         final newAccessToken = response.data["accessToken"]; // parse data based on your JSON structure
// //         _localStorage.saveAccessToken(newAccessToken); // save to local storage
// //         return true;
// //       } else if (response.statusCode == 401 || response.statusCode == 403) {
// //         // it means your refresh token no longer valid now, it may be revoked by the backend
// //         _performLogout(_dio);
// //         return false;
// //       } else {
// //         print(response.statusCode);
// //         return false;
// //       }
// //     } on DioError {
// //       return false;
// //     } catch (e) {
// //       return false;
// //     }
// //   }
// // }
//
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:osta/core/helpers/cache_helper.dart';
//
// class AuthenticationInterceptor extends Interceptor {
//   final String _token;
//
//   AuthenticationInterceptor({
//     required String token,
//   }) : _token = token;
//
//   @override
//   Future<void> onRequest(
//       RequestOptions options,
//       RequestInterceptorHandler handler,
//       ) async {
//     options.headers = {
//       ...options.headers,
//       'authorization': 'Bearer ${CacheHelper.getStringData(key: 'userToken')}',
//     };
//     handler.next(options);
//   }
//
//
//   @override
//   Future<void> onError(
//       DioException err,
//       ErrorInterceptorHandler handler,
//       ) async {
//     if (!err.shouldRetry || err.requestOptions.isRetriedAttempt) {
//       handler.next(err);
//       return;
//     }
//     try {
//
//     // actual retrying goes here
//     // retried result is stored in a response variable
//
//     handler.resolve(response);
//     } on DioException catch (e) {
//     handler.next(e);
//     }
//   }
//
//
//   const _retryExtraTag = 'isRetry';
//
//   extension on RequestOptions {
//   RequestOptions retryWith({
//     Object? data,
//   }) {
//     return copyWith(
//       extra: {
//         _retryExtraTag: true,
//         ...extra,
//       },
//       data: data ?? this.data,
//     );
//   }
//   bool get isRetriedAttempt => extra[_retryExtraTag] == true;
//
// }
//
// extension on DioException {
//   bool get shouldRetry => response?.statusCode == HttpStatus.unauthorized;
// }
//
//
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:osta/core/appkeys/app_keys.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/repositories/auth_repository.dart';
import 'package:osta/presentation/router/routes.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final Dio dio;

  AuthInterceptor(this.dio);

  // when accessToken is expired & having multiple requests call
  // this variable to lock others request to make sure only trigger call refresh token 01 times
  // to prevent duplicate refresh call
  bool _isRefreshing = false;

  // when having multiple requests call at the same time, you need to store them in a list
  // then loop this list to retry every request later, after call refresh token success
  final _requestsNeedRetry = <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = CacheHelper.getStringData(key: 'userToken');
    options.headers['authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    if (response != null &&
        // status code for unauthorized usually 401
        response.statusCode == 401 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exlude it to prevent loop infinite call
        response.requestOptions.path != EndPoints.refreshTok) {
      // if hasn't not refreshing yet, let's start it
      if (!_isRefreshing) {
        _isRefreshing = true;

        // add request (requestOptions and handler) to queue and wait to retry later
        _requestsNeedRetry.add((options: response.requestOptions, handler: handler));

        // call api refresh token
        final isRefreshSuccess = await AuthRepository().refreshToken().then((value) => value.fold(
                (l) {
                  print("refresh token fail ${l.errorMessage.toString()}");
                  CacheHelper.removeData(key: 'userToken');
                  return false;
                }, (r){
          print("refresh token success");
          final refreshResponse = r;
          CacheHelper.saveData(key: 'userToken', value: r);
          return true;
        }));

        _isRefreshing = false;

        if (isRefreshSuccess) {
          // refresh success, loop requests need retry
          for (var requestNeedRetry in _requestsNeedRetry) {
            // don't need set new accessToken to header here, because these retry
            // will go through onRequest callback above (where new accessToken will be set to header)
            final retry = await dio.fetch(requestNeedRetry.options);
          return requestNeedRetry.handler.resolve(retry);
          }
          _requestsNeedRetry.clear();
        } else {
          _requestsNeedRetry.clear();
          // if refresh fail, force logout user here
          AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);
        }
      } else {
        // if refresh flow is processing, add this request to queue and wait to retry later
        _requestsNeedRetry.add((options: response.requestOptions, handler: handler));
      }
    }
    // else if(response != null &&
    //     response.statusCode == 426 ){
    //   showAdaptiveDialog(context: AppKeys.navigatorKey.currentContext!,
    //       builder: (_){
    //
    //       });
    //
    // }
    else {
      // ignore other error is not unauthorized
      return handler.next(err);
    }

  }
}