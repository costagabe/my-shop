import 'package:flutter/material.dart';
import 'package:shop/service_locator.dart';
import 'package:shop/services/navigation_service.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loja'),
            onTap: () {
              _navigationService.navigateTo(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pedidos'),
            onTap: () {
              _navigationService.navigateTo(AppRoutes.ORDERS);
            },
          ),
        ],
      ),
    );
  }
}
