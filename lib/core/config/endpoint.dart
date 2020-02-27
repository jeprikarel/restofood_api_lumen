
class Endpoint {
//  static String _baseURL = "https://leeyurani.com/restofood/public/api";
//  static String _baseURL = "http://localhost:8000/restofood20200229/public/api";
  static String _baseURL = "http://192.168.3.83/restofood20200229/public/api"; //bisa
 // static String _baseURL = "http://192.168.3.83:8000/restofood20200229/public/api";
 // static String _baseURL = "http://cs-jepri.berca.co.id:8000/api";
  static String baseFood = "${_baseURL}/foods";

  static String baseCity = "${_baseURL}/city";

  //Auth routes
  static String register = "${_baseURL}/auth/register";
   static String login = "${_baseURL}/auth/login";
}