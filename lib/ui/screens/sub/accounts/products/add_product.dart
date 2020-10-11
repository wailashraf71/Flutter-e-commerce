import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Add Product', style: TextStyle(fontWeight: FontWeight.w700))
                .tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: buildBottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Name
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Product name',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
                    style: TextStyle(fontSize: 15),
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Enter product name'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                //Descriptions
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Descriptions',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
                    style: TextStyle(fontSize: 15),
                    maxLines: 7,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Enter product details'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                //Images
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Photos',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: -7)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(Icons.add_a_photo_outlined,
                          color: Theme
                              .of(context)
                              .accentColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Attributes
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Add attributes',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  onPressed: () => buildAddAttributes(context),
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
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
                    child: Center(
                      child: Icon(LineIcons.plus_circle,
                          color: Theme
                              .of(context)
                              .accentColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Price
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.w700,
                                  fontSize: 18),
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
                              style: TextStyle(
                                  fontSize: 15
                              ),
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                  hintText: tr('Enter price'),
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12)),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Quantity
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'Quantity',
                              style: TextStyle(fontWeight: FontWeight.w700,
                                  fontSize: 18),
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
                              style: TextStyle(
                                  fontSize: 15
                              ),

                              onFieldSubmitted: (v) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                  hintText: '0',
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12)),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  Future buildAddAttributes(BuildContext context) {
    return showDialog(
        context: context, builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 0.0,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'Attribute name',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
                style: TextStyle(fontSize: 15),
                onFieldSubmitted: (v) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                    hintText: tr('Like: Size'),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'Attribute values',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
                style: TextStyle(fontSize: 15),
                onFieldSubmitted: (v) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        spreadRadius: 3)
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CupertinoButton(
                              color: Theme
                                  .of(context)
                                  .accentColor,
                              padding: EdgeInsets.all(15),
                              onPressed: () {},
                              child: Text("Add",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800))
                                  .tr()),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                spreadRadius: 3)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CupertinoButton(
                        color: Theme
                            .of(context)
                            .accentColor,
                        padding: EdgeInsets.all(15),
                        onPressed: () {},
                        child: Text("Save",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w800))
                            .tr()),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
