import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/products_grid.dart';
import 'package:line_icons/line_icons.dart';

class Products extends StatefulWidget {
  final String title;

  Products({this.title});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Products',
                style: TextStyle(fontWeight: FontWeight.w700))
            .tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ProductsGrid(),
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

  Row option({String title = "title",
    String description = "description",
    bool isChecked = false,
    bool divider = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: isChecked
                  ? Theme
                  .of(context)
                  .accentColor
                  .withOpacity(0.1)
                  : Theme
                  .of(context)
                  .textTheme
                  .headline1
                  .color
                  .withOpacity(0.05),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: isChecked
                ? Icon(LineIcons.check_circle,
                color: Theme
                    .of(context)
                    .accentColor)
                : Icon(LineIcons.clock_o,
                color: Theme
                    .of(context)
                    .textTheme
                    .headline1
                    .color
                    .withOpacity(0.5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(fontSize: 16)).tr(),
              SizedBox(height: 5),
              Text(description,
                  style: TextStyle(color: Colors.black26, fontSize: 13))
                  .tr(),
              if (divider)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 1,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                            BorderSide(color: Colors.black12, width: 0.4))),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
