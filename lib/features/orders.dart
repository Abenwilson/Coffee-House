import 'package:flutter/material.dart';
import 'package:hotel_manage/features/home.dart';

class Orders extends StatefulWidget {
  final List<food> selecteditems;
  const Orders({super.key, required this.selecteditems});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int calculateTotal() {
    int total = 0;
    for (var item in widget.selecteditems) {
      final price = int.tryParse(item.price) ?? 0;
      final qty = int.tryParse(item.value) ?? 1;
      total += price * qty;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = calculateTotal();
    return Scaffold(
      appBar: AppBar(title: Text("Your Orders")),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.selecteditems.length,

            itemBuilder: (context, index) {
              final item = widget.selecteditems[index];
              return Column(
                children: [
                  item.foodname.isNotEmpty
                      ? ListTile(
                        leading: Image.asset(
                          item.img,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.foodname),
                        trailing: Text("${item.price}/-"),
                        subtitle: Text("qty:${item.value}"),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text("Thankyou for your oders"),
                      ),
                ],
              );
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text("Grand Total: $totalPrice₹"),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (widget.selecteditems.isNotEmpty) {
                widget.selecteditems.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("order has been succesfull ")),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Please add your meal")));
              }
            });
          },
          child: Text("order", style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 27, 40),
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}
