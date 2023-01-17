import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:salla/core/app_routes.dart';
import 'package:salla/data/services/category%20services/categories_service.dart';
import 'package:salla/data/services/category%20services/category_service.dart';
import 'package:salla/screens/home/provider/home_screen_state.dart';

import '../../../core/enums.dart';

class HomeProvider extends ChangeNotifier {
  HomeState state = HomeState();

  void init() async {
    state.categories = await CategoriesService().getCategories();
    state.clothesProducts = await CategoryService().getClothes();
    state.electronicsProducts = await CategoryService().getElectronics();
    state.lightingProducts = await CategoryService().getLighting();
    state.sportsProducts = await CategoryService().getSports();
    state.preventCoronaProducts = await CategoryService().getPreventCorona();
    state.allProducts = [
      state.clothesProducts!,
      state.electronicsProducts!,
      state.lightingProducts!,
      state.sportsProducts!,
      state.preventCoronaProducts!,
    ].expand((element) => element).toList();
    state.screenStatus = Status.success;
    notifyListeners();
  }

  void goLogin(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.login);
  }
}