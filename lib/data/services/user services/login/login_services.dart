import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:salla/data/core/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user models/login models/login_response_model.dart';

class LoginServices {
  Future<LoginResponseModel?> validate(String email, String password) async {
    Response response = await http.post(Uri.parse(ApiRoutes.login), headers: {"lang" : "en"}, body: {"email" : email, "password" : password});
    LoginResponseModel? loginResponseModel = loginResponseModelFromJson(response.body);
    return loginResponseModel;
  }

  Future<void> logout() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    http.get(Uri.parse(ApiRoutes.logout), headers: {"lang" : "en", "Authorization" : shared.getString("token").toString()});
  }
}