import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/appkeys/app_keys.dart';
import 'package:osta/core/constants/app_strings.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/localization/language_cache_helper.dart';
import 'package:osta/core/localization/locale_cubit/locale_cubit.dart';
import 'package:osta/core/localization/locale_cubit/locale_state.dart';
import 'package:osta/core/themes/app_theme.dart';
import 'package:osta/core/themes/theme_bloc/theme_bloc.dart';
import 'package:osta/core/themes/theme_bloc/theme_events.dart';
import 'package:osta/core/themes/theme_bloc/theme_states.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/firebase_options.dart';
import 'package:osta/logic/auth/auth_cubit.dart';
import 'package:osta/logic/home/sections_cubit/sections_cubit.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_cubit.dart';
import 'package:osta/logic/join_us/worker_application_cubit/worker_application_cubit.dart';
import 'package:osta/logic/location/location_cubit.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/logic/navigation_cubit/navigation_cubit.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/logic/requests/requests_cubit.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_bloc.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_event.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_bloc.dart';
import 'package:osta/logic/workers_cubits/all_workers_bloc.dart';
import 'package:osta/logic/workers_cubits/all_workers_cubit/all_workers_cubit.dart';
import 'package:osta/logic/workers_cubits/all_workers_event.dart';

import 'core/helpers/cache_helper.dart';

import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/app_router.dart';


String t = "";

Future<bool> checkUserConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      t = "Turn off the data and repress again";
      return true;
    }
  } on SocketException catch (_) {
    t = "Turn On the data and repress again";
    return false;
  }
  return false;
}


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await CacheHelper.initSharedPref();
  DioHelper.init(token: CacheHelper.getStringData(key:'userToken') ??'');
  Bloc.observer = AppBlocObserver();
  // CacheHelper.getIntData(key: 'userId');
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) =>
        ThemeBloc()
          ..add(GetCurrentThemeEvent())),
        BlocProvider(create: (_) => LocaleCubit()..initLanguages()),
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => ProfileCubit()..getSavedUserInfoInSP()),
        BlocProvider(create: (_) => SectionsCubit()),
        BlocProvider(create: (_) => AllWorkersCubit()),
        BlocProvider(create: (_) => JoinUsCubit()),
        BlocProvider(create: (_) => WorkerApplicationCubit()),
        BlocProvider(create: (_) => LocationCubit()..getAddresses()),
        BlocProvider(create: (_) => MainCubit()),
        BlocProvider(create: (_) => AllWorkersBloc()),
        BlocProvider(create: (_) => AllStoresBloc()),
        BlocProvider(create: (_) => StoreProductsBloc()),
        BlocProvider(create: (_) => MainStoreCubit()),
        BlocProvider(create: (_) => RequestsCubit()),

      ],
          child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, ChangeLocaleState>(
      builder: (context, localeState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              if (themeState is LoadedThemeState) {
                return ScreenUtilInit(
                  designSize: const Size(428, 926),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder:(context,_)=> MaterialApp(
                    navigatorKey: AppKeys.navigatorKey,
                    locale: localeState.locale,
                    supportedLocales:
                    context.read<LocaleCubit>().supportedLanguages.isNotEmpty ? context.read<LocaleCubit>().supportedLanguages.map((element) { return Locale(element.languageKey);}).toList():[
                      Locale('en'),
                      Locale('ar'),
                    ],
                    // localeState.languages.map((element) { return Locale(element.languageKey);}).toList(),
                     // localeState.languages.map((element) { return Locale(element.languageKey);}).toList().length !=0 :
                     // Iterable<Locale>   [Locale('en'),Locale('ar')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    title: AppStrings.appTitle,
                    theme: appThemeData[AppTheme.lightTheme],
                    // themeState.themeData,
                    // darkTheme: appThemeData[AppTheme.darkTheme],
                    // themeMode: ThemeMode.system,
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: AppRoutes.onGenerateRoute,

                  ),
                );
              }
              return Container();
            },
          );
      },
    );
  }
}
