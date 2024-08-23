import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable{
  const ThemeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ThemeInitial extends ThemeState{}

class LoadedThemeState extends ThemeState{
  final ThemeData themeData;
  const LoadedThemeState({required this.themeData});
  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}