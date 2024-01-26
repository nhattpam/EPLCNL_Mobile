import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SessionManager? _instance;
  factory SessionManager() => _instance ??= SessionManager._();
  SessionManager._();

  SharedPreferences? _preferences;

  String? userId;

  // Save the user ID to the session
  void setUserId(String id) {
    _preferences?.setString('userId', id);
  }

  // Get the user ID from the session
  int? getUserId() {
    return _preferences?.getInt('userId');
  }

  // Initialize the session manager
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }


  //logout
  // Clear user session data (logout)
  void clearSession() {
    _preferences?.clear();
  }
}
