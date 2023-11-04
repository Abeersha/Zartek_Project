import 'package:flutter/material.dart';
import 'package:zartek_project/model%20/foodmenu.dart';
import 'package:zartek_project/view/widget/addtocart.dart';

// ignore: camel_case_types, must_be_immutable
class carttile extends StatelessWidget {
  carttile(
    this.cartdishes, {
    super.key,
  });
  CategoryDish cartdishes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage(
                              "images/nonvegicon.png",
                            ),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            // height: 150,
            width: 100,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  cartdishes.dishName,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Text(
                    'INR ${cartdishes.dishPrice.toInt()}.00',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    '${cartdishes.dishCalories} Calories',
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 110,
            color: Colors.white,
            child: AddCart(cartdishes),
          ),
          Container(
            width: 90,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Text(
                'INR ${cartdishes.dishPrice.toInt()}.00',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
