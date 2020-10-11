import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/products_grid.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/products/add_product.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(fontWeight: FontWeight.w700))
            .tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(LineIcons.plus_circle),
              onPressed: () => Get.to(AddProduct()))
        ],
      ),
      body: ProductsGrid(
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
