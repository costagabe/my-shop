import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/app_drawer_widget.dart';
import 'package:shop/widgets/badge_widget.dart';
import 'package:shop/widgets/product_grid_widget.dart';

class ProducutOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (int selectedValue) {
              if (selectedValue == 0) {
                products.showFavoriteOnly();
              } else {
                products.showAll();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: 1,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (ctx, cart, _) => BadgeWidget(
              value: cart.itemsCount.toString(),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
              ),
            ),
          )
        ],
      ),
      body: ProductGridWidget(),
      drawer: AppDrawer(),
    );
  }
}
