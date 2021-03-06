import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/layouts/simple_page.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();
    return SimplePageLayout(
      SimplePageLayout(
        Column(
          children: [
            Card(
              margin: EdgeInsets.all(25),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text(
                        'R\$ ${cart.totalAmount}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cartItems,
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'COMPRAR',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemsCount,
                itemBuilder: (ctx, i) => CartItemWidget(cartItems[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
