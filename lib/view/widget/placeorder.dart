
import 'package:flutter/material.dart';

class PlaceOrderTile extends StatelessWidget {
  const PlaceOrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 2, 44, 4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
                child: Text(
              'Place Order',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
