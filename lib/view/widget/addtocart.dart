import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_project/controller/menucontroller.dart';
import 'package:zartek_project/model%20/foodmenu.dart';

// ignore: must_be_immutable
class AddCart extends StatelessWidget {
  AddCart(this.item, {super.key});
  CategoryDish item;
  @override
  Widget build(BuildContext context) {
    final FoodMenuController menuController = Get.put(FoodMenuController());
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        height: 30,
        width: 140,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 10, 68, 12),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () => menuController.cartCount(
                    menuController.cartCounter.value, '-', item),
                child: const Text(
                  '_',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(() => Text(
                  '${menuController.cartCounter.value}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () => menuController.cartCount(
                    menuController.cartCounter.value, '+', item),
                child: const Text(
                  '+',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
