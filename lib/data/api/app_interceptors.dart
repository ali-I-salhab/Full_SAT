import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/appkeys/app_keys.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/localization/locale_cubit/locale_cubit.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/repositories/auth_repository.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/router/routes.dart';


class AppInterceptors extends InterceptorsWrapper {
  AppInterceptors({required this.dioinstance});
  final Dio? dioinstance;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers['Authorization'] = 'Bearer ${CacheHelper.getStringData(key: 'userToken')}';
    print(AppKeys.navigatorKey.currentState?.context.read<LocaleCubit>().state.locale.languageCode);
    print(AppLocalizations().locale?.languageCode);
    options.headers['Accept-Language'] = AppKeys.navigatorKey.currentState?.context.read<LocaleCubit>().state.locale.languageCode;
    // options.headers['X-Version'] = '0.0.2';
    // options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
    // return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    if (response.statusCode == 401 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exlude it to prevent loop infinite call
        response.requestOptions.path != EndPoints.refreshTok) {
      // if hasn't not refreshing yet, let's start it
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
      if (isRefreshSuccess) {
        // refresh success, loop requests need retry
        //   final retry = await dioinstance!.fetch(.options);
        // return requestNeedRetry.handler.resolve(retry);
        // handler.resolve(await _retry(err.requestOptions));
        response.requestOptions.headers['Authorization'] = 'Bearer ${CacheHelper.getStringData(key: 'userToken')}';
        return handler.resolve(await dioinstance!.fetch(response.requestOptions));
    } else {
        AppKeys.navigatorKey.currentContext != null ?
        await showAdaptiveDialog(context:
        AppKeys.navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (context) => ErrorDialog(errorText:'common.session_expired'.tr(context),
          btnText: 'setting.logout'.tr(context),
              btnFunc: ()=> AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute)
          ),

        ) : AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);
    }
    }
    if(response.statusCode == 426){
      // AppKeys.navigatorKey.currentState?.context.getBack();
      AppKeys.navigatorKey.currentContext != null ?
     await showAdaptiveDialog(context:
         AppKeys.navigatorKey.currentContext!,
       barrierDismissible: false,
         builder: (context) => ErrorDialog(errorText:'common.upgrade_required'.tr(context),
         btnText: 'common.upgrade'.tr(context),
           // btnFunc: (){},
         ),
     ) : null;
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions
            .path}');
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
      if (isRefreshSuccess) {
        // refresh success, loop requests need retry
        //   final retry = await dioinstance!.fetch(.options);
          // return requestNeedRetry.handler.resolve(retry);
        // handler.resolve(await _retry(err.requestOptions));
        err.requestOptions.headers['Authorization'] = 'Bearer ${CacheHelper.getStringData(key: 'userToken')}';
        return handler.resolve(await dioinstance!.fetch(err.requestOptions));
      } else {
        AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);

    }
  }
    return handler.next(err);
    // super.onError(err, handler);

}
}
