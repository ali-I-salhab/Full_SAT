import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/themes/app_theme.dart';
import 'package:osta/core/themes/theme_bloc/theme_events.dart';
import 'package:osta/core/themes/theme_bloc/theme_states.dart';
import 'package:osta/core/themes/theme_cache_helper.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ThemeBloc():super(ThemeInitial()){
    on<ThemeEvent>((event, emit) async{
      if(event is GetCurrentThemeEvent){
      final themeIndex =  await ThemeCacheHelper().getCachedThemeIndex();
      final theme = AppTheme.values.firstWhere((element) => element.index == themeIndex);
      emit(LoadedThemeState(themeData: appThemeData[theme]!));
      }
      else if(event is ThemeChangedEvent){
        final themeIndex = event.theme.index;
        await ThemeCacheHelper().cacheThemeIndex(themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[event.theme]!));
      }
    });
  }
}