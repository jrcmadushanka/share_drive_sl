import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getLoggedInUserType(){
    return _prefs.then((value) =>
        value.getString("type") ?? ""
    );
  }

  Future<String> getLoggedInUserAddress(){
    return _prefs.then((value) =>
        value.getString("address") ?? ""
    );
  }

  Future<String> getLoggedInUserId(){
    return _prefs.then((value) =>
        value.getString("id") ?? ""
    );
  }

  Future<String> getLoggedInUserName(){
    return _prefs.then((value) =>
        value.getString("name") ?? ""
    );
  }

  Future<double> getLoggedInUserLatitude(){
    return _prefs.then((value) =>
      value.getDouble("lat") ?? 0
    );
  }

  Future<double> getLoggedInUserLongitude(){
    return _prefs.then((value) =>
      value.getDouble("lng") ?? 0
    );
  }

  Future<bool> setLoggedInUserId(String id){
    return _prefs.then((value) =>
        value.setString("id", id)
    );
  }

  Future<bool> setLoggedInUserLocation(double lat, double lng){
    return _prefs.then((value) {
        value.setDouble("lat", lat);
        value.setDouble("lng", lng);
        return true;
      }
    );
  }

  Future<String> getLoggedInUserEmail(){
    return _prefs.then((value) =>
        value.getString("email") ?? ""
    );
  }

  Future<bool> setLoggedInUserEmail(String email){
    print("Setting email -- " + email );
    return _prefs.then((value) =>
        value.setString("email", email)
    );
  }

  Future<bool> setLoggedInUserAddress(String address){
    return _prefs.then((value) =>
        value.setString("address", address)
    );
  }

  Future<bool> setLoggedInUserType(String type){
    return _prefs.then((value) =>
        value.setString("type", type)
    );
  }

  Future<bool> setLoggedInUserImage(String image){
    return _prefs.then((value) =>
        value.setString("image", image)
    );
  }

  Future<String> getLoggedInUserImage(){
    return _prefs.then((value) =>
        value.getString("image") ?? ""
    );
  }

  Future<bool> isLoggedIn(){
    return _prefs.then((value) =>
        value.getBool("isLoggedIn") ?? false
    );
  }

  Future<bool> setLoggedIn(bool isLoggedIn){
    return _prefs.then((value) =>
        value.setBool("isLoggedIn", isLoggedIn)
    );
  }

  Future<bool> setUserName(String firstName){
    return _prefs.then((value) =>
      value.setString("name", firstName)
    );
  }

  Future<bool> setLoggedInUserPassword(String password){
    return _prefs.then((value) =>
        value.setString("password", password)
    );
  }

  Future<bool> setLocationSelected(bool locationSubmitted){
    return _prefs.then((value) =>
      value.setBool("locationSubmitted", locationSubmitted)
    );
  }

  Future<bool> getLocationSelected(){
    return _prefs.then((value) =>
        value.getBool("locationSubmitted") ?? false
    );
  }
}