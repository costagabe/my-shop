import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_grid_item_widget.dart';

class ProductGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product> loadedProducts = Provider.of<Products>(context).items;

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
      value: loadedProducts[i],
        child: ProductGridItemWidget(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
