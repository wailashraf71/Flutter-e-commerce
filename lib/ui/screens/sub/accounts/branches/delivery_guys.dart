import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/user_account.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class DeliveryGuys extends StatefulWidget {
  @override
  _DeliveryGuysState createState() => _DeliveryGuysState();
}

class _DeliveryGuysState extends State<DeliveryGuys> {
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Delivery Guys', style: TextStyle(fontWeight: FontWeight.w700))
                .tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              LineIcons.user_plus,
              size: 25,
            ),
            onPressed: () => Get.to(UserAccount(
              newUser: true,
            )),
          ),
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (BuildContext context, int index) {
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.to(UserAccount()),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: -7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black.withOpacity(0.07),
                              width: 2.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '0770 123 4567',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.4)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 15);
          },
          itemCount: 3),
    );
  }
}
