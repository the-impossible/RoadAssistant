class APIEndPoints {
  // static const String baseURL = 'http://192.168.122.106:8000/';
  static const String baseURL = 'http://192.168.43.193:8000/';
  // static const String baseURL = 'http://172.20.10.3:8000/';
  static final AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String signIn = 'auth/login/';
  final String signOut = 'auth/logout/';
  final String signUp = 'auth/register/';
  final String profile = 'auth/getUser/';
  final String updateProfile = 'auth/updateProfile/';
  final String getMec = 'auth/getMec/';
  final String getAMec = 'auth/getAMec/';
  final String requestAMec = 'auth/requestAMec/';
  final String verifyRequest = 'auth/verifyRequest/';
  final String getDriverHistory = 'auth/GetDriverHistory/';
  final String getRequest = 'auth/getRequest/';

  final String cancelRequest = 'auth/cancelRequest/';
  final String approveRequest = 'auth/approveRequest/';
  
  final String mecRequest = 'auth/allMecRequest/';
  final String getMecRequest = 'auth/getMecRequest/';
}
