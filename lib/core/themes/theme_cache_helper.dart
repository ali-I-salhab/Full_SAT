import 'package:osta/core/helpers/cache_helper.dart';

class ThemeCacheHelper{
  Future<void> cacheThemeIndex(int themeIndex) async{
    await CacheHelper.saveData(key: 'THEME_INDEX', value: themeIndex);
  }
  Future<int> getCachedThemeIndex() async{
    final cachedThemeIndex = await CacheHelper.getIntData(key: 'THEME_INDEX');
    if(cachedThemeIndex != null){
      return cachedThemeIndex;
    }else{
      return 0;
    }
  }
}