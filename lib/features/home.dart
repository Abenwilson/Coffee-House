import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_manage/features/orders.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController itemcount = TextEditingController();
  final List<food> items = [
    food(
      foodname: 'Cappuccino',
      price: '130',
      img: 'assets/coffe1.jpg',
      value: '0',
    ),
    food(
      foodname: 'Cappuccino with Milk ',
      price: '70',
      img: 'assets/coffe2.jpg',
      value: '0',
    ),
    food(
      foodname: 'Cappuccino heart',
      price: '20',
      img: 'assets/coffe3.jpg',
      value: '0',
    ),
    food(
      foodname: 'Coffee bean overloaded ',
      price: '110',
      img: 'assets/coffe4.jpg',
      value: '0',
    ),
    food(foodname: 'Coffee', price: '20', img: 'assets/coffe5.jpg', value: '0'),
    food(
      foodname: 'broasted  Chicken 5pc ',
      price: '399',
      img: 'assets/coffe6.jpg',
      value: '0',
    ),
    food(
      foodname: 'Brownie 3 Layers',
      price: '449',
      img: 'assets/brownie.jpg',
      value: '0',
    ),
    food(
      foodname: 'Indian Rose Falooda',
      price: '259',
      img: 'assets/coffe7.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/coffebiscoff.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/coffemaple.jpg',
      value: '0',
    ),
    food(
      foodname: 'Healthy smoothie',
      price: '99',
      img: 'assets/coffe8.jpg',
      value: '0',
    ),
    food(
      foodname: 'Dragon Fruit smoothie',
      price: '129',
      img: 'assets/coffe9.jpg',
      value: '0',
    ),
    food(
      foodname: "Custurd Fruit",
      price: '99',
      img: 'assets/coffe10.jpg',
      value: '0',
    ),
    food(
      foodname: 'Black Berries shake',
      price: '150',
      img: 'assets/coffe11.jpg',
      value: '0',
    ),

    food(
      foodname: 'Black Berries shake',
      price: '150',
      img: 'assets/coffe14.jpg',
      value: '0',
    ),
    food(
      foodname: 'Brownie with ice cream',
      price: '150',
      img: 'assets/browniewithice.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/2layerchoco.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/cake1.jpg',
      value: '0',
    ),

    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/cheese2.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/strwberry.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/cherycake.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/chococake.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/caramelcake.jpg',
      value: '0',
    ),
    food(
      foodname: 'choco layer 2pcs',
      price: '150',
      img: 'assets/choco1.jpg',
      value: '0',
    ),
  ];
  List<food> orders = [];
  int get selectedgridcount => orders.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: Icon(Icons.help),
        title: Text("Home"),
        backgroundColor: Colors.white,
        elevation: 0, //
      ),

      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: ListView(
            children: [
              SizedBox(height: 10),
              SizedBox(
                child: Row(
                  children: [Image.asset('assets/logo.png', height: 150)],
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 👈 3 items per row
                  crossAxisSpacing: 5.0, // horizontal space between items
                  mainAxisSpacing: 5.0, // vertical space between items
                  childAspectRatio: 0.75, // width : height ratio
                ),
                itemBuilder: (context, foodindex) {
                  final foods = items[foodindex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 8,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              height: 140,
                              width: double.infinity,
                              foods.img,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            foods.foodname,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${foods.price}/-",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 12),
                              Icon(Icons.alarm, color: Colors.green, size: 20),
                              Text(
                                "20 min",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: const Color.fromARGB(255, 12, 146, 255),
                              ),
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(18),
                                        child: TextField(
                                          controller: itemcount,
                                          decoration: InputDecoration(
                                            hintText: "Quantity",
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            if (itemcount.text.isNotEmpty) {
                                              setState(() {
                                                orders.add(
                                                  food(
                                                    foodname: foods.foodname,
                                                    price: foods.price,
                                                    img: foods.img,
                                                    value: itemcount.text,
                                                  ),
                                                );
                                                itemcount.clear();
                                              });
                                            }
                                            Navigator.pop(context);
                                          },

                                          child: Text("okay"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: Material(
          borderRadius: BorderRadius.circular(18),
          elevation: 2,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            height: 50,
            width: double.infinity,
            child: ListTile(
              title: Text(
                "$selectedgridcount food",
                style: TextStyle(fontSize: 14),
              ),
              trailing: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Orders(selecteditems: orders);
                      },
                    ),
                  );
                },
                child: Text("ORDERS"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class food {
  final String foodname;
  final String price;
  final String img;
  final String value;

  food({
    required this.foodname,
    required this.price,
    required this.img,
    required this.value,
  });
}
