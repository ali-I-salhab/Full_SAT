import 'package:equatable/equatable.dart';
import 'package:osta/core/themes/app_theme.dart';

abstract class ThemeEvent extends Equatable{
  ThemeEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentThemeEvent extends ThemeEvent{}

class ThemeChangedEvent extends ThemeEvent{
  final AppTheme theme;
  ThemeChangedEvent({required this.theme});

  @override
  // TODO: implement props
  List<Object?> get props => [theme];
}
