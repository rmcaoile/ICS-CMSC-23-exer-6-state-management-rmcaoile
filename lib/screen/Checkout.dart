import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import '../model/Item.dart';
import "../provider/shoppingcart_provider.dart";

class Checkout extends StatelessWidget {
  const Checkout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Checkout")),
        body: Center(
          child: getItems(context),
        ));
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Text('No Items to checkout!!')
        : Expanded(
            child: Column(
            children: [
              Text("Item Details"),
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                    trailing: Text("${products[index].price}",
                        style: TextStyle(fontSize: 15)),
                  );
                },
              )),
              // Total cost
              computeCost(),
              // Pay Now button
              Flexible(
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<ShoppingCart>().removeAll();
                          Navigator.pop(context);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Payment Successful!"),
                            duration: Duration(seconds: 1, milliseconds: 500),
                          ));
                        },
                        child: const Text("Pay Now!")),
                  ]))),
            ],
          ));
  }
}

Widget computeCost() {
  return Consumer<ShoppingCart>(builder: (context, cart, child) {
    return Text("Total Cost to Pay: ${cart.cartTotal}");
  });
}
