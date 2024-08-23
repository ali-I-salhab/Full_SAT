
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:osta/data/models/language_key_model.dart';

class ChangeLocaleState{
  final Locale locale;
  final List<LanguageKeyModel> languages;
  final bool loading;

  ChangeLocaleState({required this.locale,required this.languages,this.loading =false});
}

// class ChangeLocaleState extends Equatable{
//   final Locale locale;
//   final List<LanguageKeyModel> languages;
  // final String chosenLang;
  // ChangeLocaleState({
  //    this.locale = const Locale('en'),
  //    this.languages = const [],
// });

  //  ChangeLocaleState copyWith({Locale? locale ,List<LanguageKeyModel>? languages,}) {
  //   return ChangeLocaleState(
  //       locale: locale ?? this.locale,
  //       languages: languages ?? this.languages,
  //   );
  // }

  // @override

  // List<Object?> get props => [this.locale,this.languages];
// }


// abstract class LocaleState{
//   const LocaleState();
// }
//
// class InitLocaleState extends LocaleState{
//   final Locale locale;
//   const InitLocaleState({
//     required this.locale
//   });
// }
// class GetLanguageKeywordsSuccessState extends LocaleState{
//   final String languageKeywords ;
//   const GetLanguageKeywordsSuccessState({required this.languageKeywords});
// }
// class GetLanguageKeywordsLoadingState extends LocaleState{}
// class GetLanguageKeywordsErrorState extends LocaleState{
//   final String errorMsg;
//   const GetLanguageKeywordsErrorState({required this.errorMsg});
// }
