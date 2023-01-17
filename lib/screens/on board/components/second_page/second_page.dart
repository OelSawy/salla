import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/on_board_provider.dart';

class OnBoardSecond extends StatelessWidget {
  const OnBoardSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 330,
          left: 0,
          right: 0,
          child: Lottie.asset(
            'assets/lottie/onBoardSupermarket.json',
            width: 300,
            height: 300,
          ),
        ),
        Positioned(
          bottom: 280,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Welcome to Salla",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 210,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "We help people connect with stores \naround Egypt",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 30,
            right: 16,
            child: SizedBox(
              child: InkWell(
                child: const Text("Skip",
                    style: TextStyle(color: Colors.orange, fontSize: 17)),
                onTap: () {
                  context.read<OnBoardProvider>().onBoardDone(context);
                },
              ),
            )),
        Positioned(
            bottom: 30,
            right: 16,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.orange,
              child: IconButton(
                onPressed: context.read<OnBoardProvider>().nextPressed,
                icon: const Icon(Icons.chevron_right_rounded,
                    color: Colors.white, size: 35),
                alignment: Alignment.center,
              ),
            )),
            Positioned(
              bottom: 50,
              left: 16,
              child: Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                    ),
                  ),
                ],
              )
            )
      ],
    );
  }
}