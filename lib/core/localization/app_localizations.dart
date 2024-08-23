import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osta/core/localization/language_cache_helper.dart';
import 'package:osta/data/repositories/languages_repository.dart';


class AppLocalizations {
  final Locale? locale;

  AppLocalizations({
    this.locale,
  });

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, dynamic> _localizedStrings;

  Future loadJsonLanguage() async {
    print(locale!.languageCode);
    String jsonString =
    await LanguageRepository()
        .getLanguageAsset(locale!.languageCode)
        .then((value) => value.fold(
            (l) async =>
            await rootBundle.loadString("assets/lang/en.json"),
            (r) => r));
    // await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
// //
// //     // Map<String, dynamic> jsonMap = json.decode(jsonString);
// //     // _localizedStrings = jsonMap.map((key, value) {
// //     //   return MapEntry(key, value.toString());
// //     // });
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });

  }

// //   String translate(String key) => _localizedStrings[key] ?? "";
// // }
  String translate(String key,String? defaultVal) {
    var nestedmap = _getnestedvalue(key);
    return nestedmap ?? defaultVal ?? '';
  }
  dynamic _getnestedvalue(String keypath) {
    Map keymap = keypath.split('.').asMap();
    var nestedmap;
    keymap.forEach((index, key) {
      if (index == 0) {
        nestedmap = key!= null ? _localizedStrings[key]!= null ? _localizedStrings[key] : null:null;
      } else
        nestedmap = nestedmap?[key] ?? null ;
    });
    return nestedmap ;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // return AppKeys.navigatorKey.currentContext!.read<LocaleCubit>().state.languages.map((element) { return Locale(element.languageKey);}).toList().contains(locale.languageCode);
    //  LanguageRepository()
    //     .getLanguages()
    //     .then((value) => value.fold(
       //supposed to be just en , ar for testing
       //      (l)  => ['en','ar'].contains(locale.languageCode) ,
       //      (r) => r.map((element) { return Locale(element.languageKey);}).toList().contains(locale.languageCode)
    // ));
     List<String> supported = [];
    LanguageCacheHelper().getCachedSupportedLanguages()
   .then((value) {
    supported = value ;
    });
   if( supported.length !=0 )
      return supported.contains(locale.languageCode);
   else
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String tr(BuildContext context,) {
    return AppLocalizations.of(context)!.translate(this,this);
  }
}
