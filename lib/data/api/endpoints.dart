class EndPoints {
  static const String baseUrl = 'http://31.9.57.141/api';
  static const String baseDomainUrl = 'http://31.9.57.141/api';
  ////
  static const String screenFields = '/forms/show';
  static const String categories = '/forms';
  static const String sendOrder = '/orders/invoice';
  static const String createOrder = '/orders/client';


  ////languages
  static const String getLanguage = '/language';
  ////location
  static const String getAddresses = '/cities';

  ////auth
  static const String auth = '/auth/authentication';
  static const String refreshTok = '/auth/refresh-token';
  static const String myAccount = '/auth/my-account';
  static const String editAccount = '/auth/edit-account';
  static const String changeProfileImage = '/auth/change-profile-image';
  static const String deleteProfileImage = '/auth/delete-profile-image';
  static const String logout = '/auth/logout';

  ///workers
  static const String allWorkers = '/workers';
  // http://31.9.57.141/api/workers?page=1

  ///stores
  static const String stores = '/stores';
  ///section
  static const String sections = '/section';
  static const String section = '/section/1';
  static const String service = '/service/1/2';


  static const String role = '${baseUrl}role';
  static const String hotel = '${baseUrl}hotel';
  static const String hotelSearch = '${baseUrl}hotel/search/';
  static const String user = '${baseUrl}user';
  static const String favorite = '$user/fav/';
  static const String nearMe = '$user/near-hotels/';
  static const String recommended = '$user/recommended-hotels/';
}
