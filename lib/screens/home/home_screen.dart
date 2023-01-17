import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:salla/core/enums.dart';
import 'package:salla/screens/home/provider/home_screen_provider.dart';
import 'package:salla/screens/home/widgets/home_widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Salla",
            style: TextStyle(color: Colors.black, fontSize: 25)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: ElevatedButton(
            onPressed: () => context.read<HomeProvider>().goLogin(context),
            child: const Text("Login")
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.orange),
                ),
                Lottie.asset("assets/lottie/homeOnlineShopping.json",
                    height: 220, width: double.infinity),
              ],
            ),
            const SizedBox(height: 20),
            context.watch<HomeProvider>().state.screenStatus == Status.loading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 150,
                    child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {},
                              child: showCategoriesBoxes(context, index));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 20);
                        },
                        itemCount: context
                            .watch<HomeProvider>()
                            .state
                            .categories!
                            .length)),
            const SizedBox(height: 20),
            const Text(
              "New Products",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (screenSize.width / 2) / 350),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {}, child: showProduct(context, index));
              },
              itemCount: context.read<HomeProvider>().state.allProducts!.length,
            )
          ],
        ),
      ),
    );
  }
}
