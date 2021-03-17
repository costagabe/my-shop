import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/layout_provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/service_locator.dart';
import 'package:shop/services/navigation_service.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import 'package:shop/views/product_detail_screen.dart';
import 'package:shop/views/products_overview_screen.dart';
import 'package:shop/widgets/app_drawer_widget.dart';
import 'package:shop/widgets/badge_widget.dart';

class StandardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = Provider.of<LayoutProvider>(context).pageTitle;
    final NavigationService _navigationService = locator<NavigationService>();

    final Products products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                  _navigationService.navigateTo(AppRoutes.CART);
                },
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: AppDrawer(),
              ),
            ],
          ),
          Expanded(
            child: MaterialApp(
              navigatorKey: locator<NavigationService>().navigatorKey ,
              debugShowCheckedModeBanner: false,
              title: 'Minha Loja',
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato',
              ),
              routes: {
                AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
                AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
                AppRoutes.CART: (ctx) => CartScreen(),
                AppRoutes.ORDERS: (ctx) => OrdersScreen(),
              },
            ),
          )
        ],
      ),
    );
  }
}
