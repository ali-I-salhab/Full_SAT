import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/core/localization/language_cache_helper.dart';
import 'package:osta/core/localization/locale_cubit/locale_state.dart';
import 'package:osta/data/models/language_key_model.dart';
import 'package:osta/data/repositories/languages_repository.dart';


class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: Locale('en'),languages: [LanguageKeyModel(languageName: 'English', languageKey: 'en'),])){
     // getLanguages();
  }

  static LocaleCubit get(BuildContext context) => BlocProvider.of<LocaleCubit>(context);

   List<LanguageKeyModel> supportedLanguages = [];

// LanguageRepository languageRepository = LanguageRepository();
//   Future<String> getLanguageKeywords(String languageCode) async {
//     emit(GetLanguageKeywordsLoadingState());
//     await languageRepository.getLanguageAsset(languageCode).then((value) {
//       value.fold((l) {
//         print(l.errorMessage);
//         emit(GetLanguageKeywordsErrorState(errorMsg: l.errorMessage ?? ''));
//         return '';
//       },
//               (r) {
//             emit(GetLanguageKeywordsSuccessState(languageKeywords: r));
//             return r;
//           } );
//     });
//     return '';
//   }
//

LanguageRepository languageRepository = LanguageRepository();
  Future<void> getLanguages() async {
    // emit(GetLanguageKeywordsLoadingState());
    await languageRepository.getLanguages().then((value) {
      value.fold((l) {
        print(l.errorMessage);
        // emit(GetLanguageKeywordsErrorState(errorMsg: l.errorMessage ?? ''));
        // return '';
      },
              (r) {
        print(r);
        supportedLanguages = r ;
        LanguageCacheHelper().cacheSupportedLanguages(r.map((e) => e.languageKey).toList());
            emit(ChangeLocaleState(locale: state.locale, languages: r));
            // emit(state.copyWith(languages: r));
            // return r;
          } );
    });
    // return '';
  }


  Future<void> getSavedLanguage() async{
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode),languages: supportedLanguages));
    // emit(state.copyWith(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async{
    emit(ChangeLocaleState(locale: state.locale, languages: state.languages,loading: true));
    Future.wait([
    // LanguageRepository().getLanguageAsset(languageCode),
    LanguageCacheHelper().cacheLanguageCode(languageCode),
    ]);
    emit(ChangeLocaleState(locale: Locale(languageCode),languages: supportedLanguages,loading: false));
    // emit(state.copyWith(locale: Locale(languageCode)));
  }

  Future<void> initLanguages() async{
    Future.wait([
      getSavedLanguage(),
      getLanguages()
    ]);
  }

}
