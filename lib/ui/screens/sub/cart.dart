import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/order_widget.dart';
import 'package:flutter_ecommerce/ui/screens/sub/checkout.dart';
import 'package:get/get.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.w700)).tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: OrderWidget(
                            title: products[index]['title'],
                            image: products[index]['image']));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Divider(),
                    );
                  },
                )),
          ]),
      bottomNavigationBar: buildBottomBar(context),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                spreadRadius: 3)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Price',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17)).tr(),
                Text("\$76",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CupertinoButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.all(15),
                        // onPressed: () => checkoutDialog(context),
                        onPressed: () => Get.to(Checkout()),
                        child: new Text("Checkout",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w800)).tr()),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
