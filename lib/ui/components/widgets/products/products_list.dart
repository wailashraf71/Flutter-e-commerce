import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/product_widget.dart';

class ProductsList extends StatelessWidget {
  final List products;

  const ProductsList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 15);
        },
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return AspectRatio(
            aspectRatio: 9 / 13,
            child: ProductWidget(
              title: products[index]['title'],
              productId: products[index]['id'],
              price: 12,
              image: products[index]['image'],
            ),
          );
        },
      ),
    );
  }
}
