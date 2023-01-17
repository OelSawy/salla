import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla/screens/home/provider/home_screen_provider.dart';

Widget showCategoriesBoxes(BuildContext context, int index) {
  return SizedBox(
    width: 200,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(alignment: Alignment.center, children: [
        Image.network(
          context.read<HomeProvider>().state.categories![index]!.image!,
          height: 150,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: Text(
              context.read<HomeProvider>().state.categories![index]!.name!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    ),
  );
}

Widget showProduct(BuildContext context, int index) {
  final screenSize = MediaQuery.of(context).size;
  return SizedBox(
      width: screenSize.width / 2,
      height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              context.read<HomeProvider>().state.allProducts![index]!.image!,
              height: 200,
              width: 200,),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                color: Colors.deepOrange.shade700,
                child: const Text("DISCOUNT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: Text(
              context.read<HomeProvider>().state.allProducts![index]!.name!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 15),
                Text(
                    context
                        .read<HomeProvider>()
                        .state
                        .allProducts![index]!
                        .price!
                        .toString(),
                    style: TextStyle(color: Colors.lightBlue.shade400)),
                const SizedBox(width: 10),
                Text(
                    context
                        .read<HomeProvider>()
                        .state
                        .allProducts![index]!
                        .oldPrice!
                        .toString(),
                    style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough)),
                const SizedBox(width: 5),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(context
                          .read<HomeProvider>()
                          .state
                          .allProducts![index]!
                          .inFavorites!
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(context
                          .read<HomeProvider>()
                          .state
                          .allProducts![index]!
                          .inCart!
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined))
            ],
          )
        ],
      ));
}

