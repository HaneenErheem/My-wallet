import 'package:shared_preferences/shared_preferences.dart';
enum prefKeys{loggedIn ,email,language}
class SharedPrefController{
  static final SharedPrefController _instance=SharedPrefController._();
  late SharedPreferences _sharedPreferences;
  factory SharedPrefController(){
    return _instance;
  }
  SharedPrefController._();

  Future <void> initPref()async{
    _sharedPreferences =await SharedPreferences.getInstance();
  }

  //-------------- language function ------------
  Future<bool> changeLanguage(String language) async{
return await _sharedPreferences.setString(
  prefKeys.language.toString(), language);
  }

  String get language=> 
  _sharedPreferences.getString(prefKeys.language.toString()) ??'en';

  //---------save function -----------------------
 Future <void>save({required String email})async{
  await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), true);
  await _sharedPreferences.setString(prefKeys.email.toString(), email);
 }

 //---------check login function-----------

 bool get loggedIn=>
 _sharedPreferences.getBool(prefKeys.loggedIn.toString()) ?? false;

//------------- delete function -----------
Future<bool> remove({required String key})async{
  if(_sharedPreferences.containsKey(key)){
    return await _sharedPreferences.remove(key);
  }
return false;
}

//------------- clear all in shared preferences --------
Future<bool> claer()async{
return  await _sharedPreferences.clear();
}
 
String get email => 
_sharedPreferences.getString(prefKeys.email.toString()) ?? '';

}