import 'package:salla/data/core/url.dart';

class ApiRoutes {
  //! Categories
  static String categories = "$baseUrl/categories";
  static String electronicsCategory = "$baseUrl/products?category_id=44";
  static String preventCoronaCategory = "$baseUrl/products?category_id=43";
  static String sportsCategory = "$baseUrl/products?category_id=42";
  static String lightingCategory = "$baseUrl/products?category_id=40";
  static String clothesCategory = "$baseUrl/products?category_id=46";

  //! User
  static String login = "$baseUrl/login";
  static String logout = "$baseUrl/logout";
}