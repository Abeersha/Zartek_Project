// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:zartek_project/view/widget/carttile.dart';
import 'package:zartek_project/view/widget/placeorder.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
                child: const SizedBox(
                  height: 60,
                  width: 500,
                  child: Center(
                      child: Text(
                    '2 Dishes - 2  items',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  separatorBuilder: (context, i) => const Divider(),
                  itemBuilder: (context, index) => const carttile(),
                  itemCount: 2,
                ),
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
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
                    'INR 65.00',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const PlaceOrderTile()
            ],
          ),
        ),
      ),
    );
  }
}
