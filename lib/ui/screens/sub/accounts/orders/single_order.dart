import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:line_icons/line_icons.dart';

class SingleOrder extends StatefulWidget {
  final int id;

  const SingleOrder({Key key, this.id}) : super(key: key);

  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  TextEditingController messageController = TextEditingController(
      text: tr('We will start shipping your products soon'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id.toString(),
            style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.library_add_check_outlined),
            onPressed: () => buildDeliveryGuySelect(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                option(
                    title: 'Order confirmed',
                    description: 'Your order has been received',
                    isChecked: true),
                option(
                    title: 'Preparing order',
                    description: 'Your order has been Prepared',
                    isChecked: true),
                option(
                    title: 'Delivery in progress',
                    description: 'Your order is being delivered',
                    isChecked: true),
                option(
                    title: 'Order Delivered',
                    description: 'Your order has been shipped',
                    isChecked: false,
                    divider: false),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Send message',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
                    controller: messageController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLines: 2,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Message text'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Products',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ).tr(),
                ),
                SizedBox(height: 5),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: products
                      .map((item) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: orderItem(title: item['title'], image: item['image'])))
                      .toList()
                      .cast<Widget>(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomBar(context),
    );
  }

  Future buildDeliveryGuySelect(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Assign to delivery guy',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ).tr(),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        itemBuilder: (BuildContext context, int index) {
                          return CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
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
                                            color:
                                                Colors.black.withOpacity(0.07),
                                            width: 2.0)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                  ),
                ],
              ),
              bottomNavigationBar: Container(
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
                                  child: Text("Select",
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
              ),
            ),
          );
        });
  }

  Container orderItem({String title = '', String image = ''}) {
    return Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) =>
                        Container(color: Colors.black.withOpacity(0.08))),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              fontSize: 13)),
                    ),
                    Text(tr('Size') + ': ' + '40',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 12)),
                    Text(tr('Color') + ': ' + 'Red',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 12)),
                    Text(tr('Quantity') + ': ' + '5',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 12)),
                  ],
                )),
          ),
        ]));
  }

  Widget option(
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
            Text(title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                .tr(),
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
