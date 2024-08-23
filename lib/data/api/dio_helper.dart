import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/appkeys/app_keys.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/localization/locale_cubit/locale_cubit.dart';
import 'package:osta/data/api/app_interceptors.dart';
import 'package:osta/data/api/endpoints.dart';

class DioHelper {
  static Dio? dio;

  static init({String token = ""}) {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        validateStatus: (status) {
          return status! <= 500;
        },
        receiveDataWhenStatusError: true,
        followRedirects: false,
        headers: {
          "authorization": "Bearer $token",
          // "Accept-Language":
          // AppKeys.navigatorKey.currentState!.context.read<LocaleCubit>().state.locale.languageCode,
          // AppLocalizations().locale!.languageCode,
          "Accept": "application/json",
          "X-Version": "0.0.1"
        },
      ),
    );
    dio!.interceptors.addAll([
      AppInterceptors(dioinstance: dio),
      // AuthInterceptor(dio!)
    ]
    );

    if (kDebugMode) {
      dio!.interceptors.add(LogInterceptor());
    }
  }

}
