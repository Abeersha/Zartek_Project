import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_project/Sevices/fire_functions.dart';
import 'package:zartek_project/view/cartpage.dart';
import 'package:zartek_project/controller/menucontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zartek_project/view/widget/menucard.dart';

class Homescreen extends StatelessWidget {
  Homescreen(this.userCredential, {Key? key}) : super(key: key);
  final FoodMenuController menuController = Get.put(FoodMenuController());
  final UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'Salads and Soup',
      'From The Barnyard',
      'From The Barnyard',
    ];

    String? username;
    String? id;
    String? photoURL;

    username =
        userCredential.user?.displayName ?? userCredential.user?.phoneNumber;
    id = userCredential.user?.uid;
    photoURL = userCredential.user?.photoURL;

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Builder(
        builder: (context) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: photoURL != null
                                ? Image.network(photoURL).image
                                : const AssetImage(''),
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person,
                                size: 30,
                                color: photoURL != null
                                    ? Colors.transparent
                                    : Colors.black),
                          ),
                        ),
                        Text(
                          username ?? 'Phone User',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          id != null ? 'ID : $id' : 'Phone ID : $id',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseService().signOutFromGoogle();
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          Get.to(() => const Cartpage());
                        },
                      ),
                      Positioned(
                        right: 5,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Obx(() => Text(
                                '${menuController.cartCounter.value}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'Salads and Soup',
                  ),
                  Tab(
                    text: 'From The Barnyard',
                  ),
                  Tab(
                    text: 'From The Barnyard',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                GetBuilder<FoodMenuController>(
                  init: FoodMenuController(),
                  initState: (_) {},
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.dishes.length,
                      itemBuilder: (context, index) =>
                          Menulist(controller.dishes, index),
                    );
                  },
                ),
                const Center(child: Text("Salads")),
                const Center(child: Text("Biriyani")),
              ],
            ),
          );
        },
      ),
    );
  }
}
