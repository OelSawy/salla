import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:salla/core/enums.dart';
import 'package:salla/data/services/user%20services/login/login_services.dart';
import 'package:salla/screens/login/provider/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salla/data/models/user%20models/login%20models/login_response_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginState state = LoginState();

  Future<bool> validate() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
    state.loginResponse =
        await LoginServices().validate(state.email.toString(), state.password.toString());
    if (state.loginResponse!.message == "Login done successfully") {
      state.userData = Data.fromJson(state.loginResponse!.data);
      shared.setString("token", state.userData!.token!);
      return true;
    } else {
      return false;
    }
  }

  Future<void> login() async {
    state.loginStatus = Status.loading;
    notifyListeners();
    if (state.emailErrorMessage == null && state.passwordErrorMessage == null) {
      if (await validate()) {
        state.loginStatus = Status.success;
        notifyListeners();
      } else {
        state.loginStatus = Status.error;
        notifyListeners();
      }
    }
  }

  void logout() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    state.logoutStatus = Status.loading;
    notifyListeners();
    await LoginServices().logout();
    state.logoutStatus = Status.success;
    shared.remove("token");
    notifyListeners();
  }

  void onMailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid mail";
    state.email = value;
    notifyListeners();
  }

  void onPasswordChange(String value) {
    value.isEmpty
        ? state.passwordErrorMessage = "You must enter a Username"
        : state.passwordErrorMessage = null;
    state.password = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }
}
