import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper{

  Future<void> cacheLanguageCode(String languageCode) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('LOCALE', languageCode);
  }

  Future<void> cacheSupportedLanguages(List<String> supportedLanguages) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('supportedLanguages', supportedLanguages);
  }

  Future<List<String>> getCachedSupportedLanguages() async{
    final sp = await SharedPreferences.getInstance();
    final cachedSupportedLanguages = sp.getStringList('supportedLanguages');
    if(cachedSupportedLanguages != null){
      return cachedSupportedLanguages;
    }else {
      return ['en'];
    }
  }

  Future<String> getCachedLanguageCode() async{
    final sp = await SharedPreferences.getInstance();
    final cachedLanguageCode = sp.getString('LOCALE');
    if(cachedLanguageCode != null){
      return cachedLanguageCode;
    }else {
      return "en";
    }
  }
}