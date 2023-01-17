import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla/screens/on%20board/components/first_page/first_page.dart';
import 'package:salla/screens/on%20board/provider/on_board_provider.dart';

import 'components/second_page/second_page.dart';
import 'components/third_page/third_page.dart';

class OnBoard extends StatelessWidget {
  List<Widget> pages = [
    const OnBoardFirst(),
    const OnBoardSecond(),
    const OnBoardThird(),
  ];

  OnBoard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardProvider>(
        builder: (context, provider, child) {
          return PageView(
            controller: provider.state.controller,
            children: pages,
          );
        },
      ),
    );
  }
}