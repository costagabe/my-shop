import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/layouts/simple_page.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/app_drawer_widget.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return SimplePageLayout(
      ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
      ),
    );
  }
}
