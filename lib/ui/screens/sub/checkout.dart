import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/delivery_type.dart';
import 'package:line_icons/line_icons.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool termsAccept = false;
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Full Name *',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: -7)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Your name'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'City *',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: -7)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                    items: <String>['Erbil', 'Baghdad', 'Mosul', 'Basra']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          '$value',
                          style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline1.color),
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    value: 'Mosul',
                    isExpanded: true,
                    underline: Container(),
                    elevation: 0,
                    style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.headline1.fontFamily,
                        fontSize: 20),
                    dropdownColor: Theme.of(context).primaryColor,
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Address *',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: InputDecoration(
                              hintText: tr('Street name ...'),
                              border: InputBorder.none,
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CupertinoButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(LineIcons.location_arrow,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Phone Number *',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: -7)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: '+964 770 123 4567',
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Delivery Type *',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: delivery
                      .map((item) => DeliveryType(
                          value: item,
                          valueHolder: selectedDelivery,
                          onPressed: () => setState(() {
                                selectedDelivery = item;
                              })))
                      .toList()
                      .cast<Widget>(),
                ),
              ]),
        ),
      ),
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "I agree to the Terms and Conditions",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .textTheme
                        .headline1
                        .color
                        .withOpacity(0.8)),
              ).tr(),
              value: termsAccept,
              onChanged: (check) => onTermsAcceptChanged(check),
              controlAffinity: ListTileControlAffinity.leading,
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
                        onPressed: () => () {},
                        child: Text("Place Order!",
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

  onTermsAcceptChanged(bool check) {
    setState(() {
      termsAccept = check;
    });
  }
}
