import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/orders/single_order.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Orders', style: TextStyle(fontWeight: FontWeight.w700))
                .tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              buildStatsCard(
                onTap: () => Get.to(SingleOrder(id: 423621)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order id - 423621',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ).tr(),
                    SizedBox(height: 5),
                    Text(
                      'We will start shipping your products soon',
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              .color
                              .withOpacity(0.36)),
                    ).tr(),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                width: 60,
                                child: CachedNetworkImage(
                                    width: double.infinity,
                                    height: double.infinity,
                                    imageUrl: products[index]['image'],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Container(color: Colors.black12)),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 10);
                          },
                          itemCount: 3),
                    ),
                    SizedBox(height: 15),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '2m',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .color
                                  .withOpacity(0.36)),
                        ).tr()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatsCard(
      {Color color,
      Widget child,
      EdgeInsets padding,
      GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: padding ?? EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  blurRadius: 7,
                  spreadRadius: -5,
                  offset: Offset(0, 3))
            ],
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }

  Row option(
      {String title = "title",
      String description = "description",
      bool isChecked = false,
      bool divider = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)).tr(),
            SizedBox(height: 5),
            Text(description,
                    style: TextStyle(color: Colors.black26, fontSize: 13))
                .tr(),
            if (divider)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.black12, width: 0.4))),
                ),
              )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: isChecked
                  ? Theme.of(context).accentColor.withOpacity(0.1)
                  : Theme.of(context)
                  .textTheme
                  .headline1
                  .color
                  .withOpacity(0.05),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: isChecked
                ? Icon(LineIcons.check_circle,
                color: Theme.of(context).accentColor)
                : Icon(LineIcons.clock_o,
                color: Theme.of(context)
                    .textTheme
                    .headline1
                    .color
                    .withOpacity(0.5)),
          ),
        ),
      ],
    );
  }
}
