import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:zartek_project/Sevices/apiservice.dart';

import '../model /foodmenu.dart';

class FoodMenuController extends GetxController {
  ApiService obj = ApiService();

  List<CategoryDish> dishes = [];
  List<CategoryDish> cartdishes = [];

  RxInt cartCounter = 0.obs;

  final ApiService object = ApiService();
  @override
  void onInit() {
    fetchCartDishes();

    super.onInit();
  }

  void cartCount(int value, String operation) {
    if (operation == '+') {
      cartCounter.value = value + 1;
    } else if (operation == '-' && value > 0) {
      cartCounter.value = value - 1;
    }
  }

  Future<void> fetchCartDishes() async {
    try {
      object.fetchHomeDatas().then((List<Foodmenu> data) {
        dishes = data[0].tableMenuList[0].categoryDishes;

        update();
      });
    } catch (e) {
      Get.snackbar("hi", e.toString());
    }
    update();
  }
}
