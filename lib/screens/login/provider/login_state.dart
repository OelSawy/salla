import 'package:salla/core/enums.dart';
import 'package:salla/data/models/user%20models/login%20models/login_response_model.dart';
import 'package:flutter/material.dart';

class LoginState {
  String? email;
  String? password;
  LoginResponseModel? loginResponse;
  Data? userData;
  Status loginStatus = Status.init;
  Status logoutStatus = Status.init;
  String? emailErrorMessage;
  String? passwordErrorMessage;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  bool hidePass = true;
}