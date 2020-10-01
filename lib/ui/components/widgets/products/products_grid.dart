import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/product_widget.dart';

class ProductsGrid extends StatelessWidget {
  final EdgeInsets padding;

  const ProductsGrid({Key key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 13,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductWidget(
            productId: products[index]['id'],
            image: products[index]['image'],
            title: products[index]['title'],
            price: 14,
          );
        });
  }
}
