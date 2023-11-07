import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:zartek_project/Sevices/apiservice.dart';
import 'package:zartek_project/Sevices/fire_functions.dart';
import 'package:zartek_project/view/homescreen.dart';
import '../model /foodmenu.dart';

class FoodMenuController extends GetxController {
  ApiService obj = ApiService();

  RxList<String> tabs = <String>[].obs;

  List<CategoryDish> dishes = [];
  RxList<CategoryDish> cartdishes = <CategoryDish>[].obs;
  RxList<CategoryDish> filteredCartdishes = <CategoryDish>[].obs;

  RxInt cartCounter = 0.obs;
  RxInt totalamount = 0.obs;

  final ApiService object = ApiService();
  @override
  void onInit() {
    fetchCartDishes();

    super.onInit();
  }

  void cartCount(int value, String operation, CategoryDish item) {
    if (operation == '+') {
      totalamount.value = item.dishPrice.toInt() + totalamount.value  ;

      cartdishes.add(item);

      cartCounter.value = value + 1;
    } else if (operation == '-' && value > 0) {
      totalamount.value = item.dishPrice.toInt() - totalamount.value;
      cartdishes.remove(item);

      cartCounter.value = value - 1;
    }
    update();
  }

  Future<void> fetchCartDishes() async {
    try {
      object.fetchHomeDatas().then((List<Foodmenu> data) {
        for (var i in data[0].tableMenuList) {
          tabs.add(i.menuCategory.toString());

          dishes.addAll(i.categoryDishes);
        }

        // dishes = data[0].tableMenuList[0].categoryDishes;

        update();
      });
    } catch (e) {
      Get.snackbar("", e.toString());
    }
    update();
  }

  void clearmethod() {
    Get.snackbar('Status', 'Order Placed Successfully');
    cartdishes.clear();
    totalamount.value = 0;
    cartCounter.value = 0;
    Get.off(Homescreen(userCredential!));
    update();
  }

  String itemCartCount(String id) {
    List<CategoryDish> filteredList =
        // ignore: invalid_use_of_protected_member
        cartdishes.value.where((item) => item.dishId.contains(id)).toList();
    final RxString count =
        filteredList.isEmpty ? '0'.obs : '${filteredList.length}'.obs;

    return count.value;
  }
}
