import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginFailed extends StatelessWidget {
  const LoginFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Center(
            child:
                Lottie.asset("assets/lottie/LoginFailed.json", repeat: false),
          ),
        ],
      ),
    );
  }
}
