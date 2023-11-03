import 'package:flutter/material.dart';
import 'package:zartek_project/view/widget/addtocart.dart';
import 'package:zartek_project/model%20/foodmenu.dart';

// ignore: must_be_immutable
class Menulist extends StatelessWidget {
  Menulist(this.dishes, this.index, {super.key});

  List<CategoryDish> dishes;
  int index;

  @override
  Widget build(BuildContext context) {
    final icon = dishes[index].dishType == 2
        ? "images/vegicon.png"
        : "images/nonvegicon.png";

    return Container(
      height: 300,
      // width: 3,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          // 1
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 5),
            child: Container(
              height: 300,
              width: 30,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 12),
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(icon), fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              height: 300,
              width: 250,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 140, top: 6),
                    child: Text(
                      dishes[index].dishName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "INR ${dishes[index].dishPrice}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${dishes[index].dishCalories.toInt()} Calories ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      dishes[index].dishDescription,
                    ),
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AddCart(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 80,
                    ),
                    child: Text(
                      dishes[index].addonCat!.isEmpty
                          ? ''
                          : 'Customizations Available',
                      style: const TextStyle(fontSize: 13, color: Colors.red),
                    ),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 150),
                  //   child: ElevatedButton(
                  //       onPressed: () {}, child: const Icon(Icons.abc)),
                  // ),
                ],
              ),
            ),
          ),
// 3
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              height: 300,
              width: 100,
              color: Colors.white,
              child: Column(
                children: [
                  FadeInImage.assetNetwork(
                    image: dishes[index].dishImage,
                    height: 90,
                    width: 80,
                    placeholder: "images/spinachsalad.png",
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("images/spinachsalad.png"),
                              fit: BoxFit.cover)),
                    ),
                    placeholderFit: BoxFit.fill,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
