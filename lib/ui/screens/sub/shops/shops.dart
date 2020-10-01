import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/shops_list.dart';
import 'package:flutter_ecommerce/ui/components/widgets/widget_header.dart';

class Shops extends StatefulWidget {
  final int navId;

  const Shops({Key key, this.navId}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shops', style: TextStyle(fontWeight: FontWeight.w700)),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black12,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              WidgetHeader(
                  title: 'Electronics',
                  onTap: () {},
                  nextText: 'See all',
                  child: ShopsList(
                    shops: shops,
                  )),
              WidgetHeader(
                  title: 'Restaurants',
                  onTap: () {},
                  nextText: 'See all',
                  child: ShopsList(
                    shops: shops2,
                  )),
              WidgetHeader(
                  title: 'Libraries',
                  onTap: () {},
                  nextText: 'See all',
                  child: ShopsList(
                    shops: shops,
                  )),
              WidgetHeader(
                  title: 'Perfumes',
                  onTap: () {},
                  nextText: 'See all',
                  child: ShopsList(
                    shops: shops2,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
