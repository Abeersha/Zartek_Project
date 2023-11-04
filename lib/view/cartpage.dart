// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_project/controller/menucontroller.dart';
import 'package:zartek_project/view/widget/carttile.dart';
import 'package:zartek_project/view/widget/placeorder.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key});

  @override
  Widget build(BuildContext context) {
    final FoodMenuController menuController = Get.put(FoodMenuController());
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 100),
            child: Text(
              'Order Summary',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: menuController.totalamount.value == 0
          ? const Center(child: Text('No Cart Items'))
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 600,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      color: const Color.fromARGB(255, 4, 51, 7),
                      child: SizedBox(
                        height: 60,
                        width: 500,
                        child: Center(
                            child: Obx(() => Text(
                                  '${menuController.cartdishes.length} Dishes',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: GetBuilder<FoodMenuController>(
                        init: FoodMenuController(),
                        initState: (_) {},
                        builder: (controller) => controller.cartdishes.isEmpty
                            ? const Center(child: Text('No Cart Item'))
                            : ListView.separated(
                                separatorBuilder: (context, i) => Visibility(
                                    visible:
                                        menuController.totalamount.value == 0
                                            ? false
                                            : true,
                                    child: const Divider()),
                                itemBuilder: (context, index) =>
                                    carttile(controller.cartdishes[index]),
                                itemCount: controller.cartdishes.length,
                              ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Total Amount',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 47, 7),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        Text(
                          'INR ${menuController.totalamount.value}.00',
                          style: const TextStyle(
                              color: Colors.green, fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    PlaceOrderTile(() {
                      menuController.clearmethod();
                    })
                  ],
                ),
              ),
            ),
    );
  }
}
