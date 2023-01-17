import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla/core/app_routes.dart';
import 'package:salla/core/enums.dart';
import 'package:salla/screens/login/provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Positioned(
                    top: 40,
                    left: 10,
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close))))
              ],
            ),
          ),
          const SizedBox(height: 140),
          Row(
            children: const [
              SizedBox(width: 10),
              Text("LOGIN",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              Text("Login now to browse our hot offers",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500)),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller:
                          context.read<LoginProvider>().state.emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(top: 10, bottom: 10),
                        errorStyle:
                            const TextStyle(fontWeight: FontWeight.w300),
                        errorText: context
                            .watch<LoginProvider>()
                            .state
                            .emailErrorMessage,
                        hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                        hintText: "example@something.com",
                        icon: const Icon(Icons.email_outlined),
                        labelText: "Email Address",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      onChanged: context.read<LoginProvider>().onMailChange,
                      onSubmitted: context.read<LoginProvider>().onMailChange,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 100,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400)),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: context
                          .read<LoginProvider>()
                          .state
                          .passwordController,
                      obscureText:
                          context.watch<LoginProvider>().state.hidePass,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(top: 10, bottom: 10),
                          errorStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          errorText: context
                              .watch<LoginProvider>()
                              .state
                              .passwordErrorMessage,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          hintText: "1234678",
                          icon: const Icon(Icons.lock_outline),
                          labelText: "Password",
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          suffix: IconButton(
                              onPressed: () =>
                                  context.read<LoginProvider>().showPassword(),
                              icon: context
                                          .watch<LoginProvider>()
                                          .state
                                          .hidePass ==
                                      false
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.remove_red_eye_outlined))),
                      onChanged: context.read<LoginProvider>().onPasswordChange,
                      onSubmitted:
                          context.read<LoginProvider>().onPasswordChange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              height: 50,
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.blueAccent,
              child: InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Dialog(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()),
                        );
                      },
                    );
                    await context.read<LoginProvider>().login();
                    Navigator.pop(context);
                    if (context.read<LoginProvider>().state.loginStatus ==
                        Status.success) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.loginVerified);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.loginFailed);
                    }
                  },
                  child: const Text("LOGIN",
                      style: TextStyle(color: Colors.white))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account ?"),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(1),
                child: InkWell(
                  onTap: () {},
                  child: const Text("REGISTER",
                      style: TextStyle(color: Colors.blueAccent)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
