import 'package:flutter/material.dart';
import 'package:zartek_project/view/widget/addtocart.dart';

// ignore: camel_case_types
class carttile extends StatelessWidget {
  const carttile({
    super.key,
  });

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
            child: const Column(
              children: [
                Text(
                  'Gobi Manchurian Dry',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 26),
                  child: Text(
                    'INR 20.00',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    '112 Calories',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 110,
            color: Colors.white,
            child: const AddCart(),
          ),
          Container(
            width: 90,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: Text(
                'INR 20.00',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
