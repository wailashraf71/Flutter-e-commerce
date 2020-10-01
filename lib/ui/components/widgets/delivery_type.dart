import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DeliveryType extends StatelessWidget {
  final dynamic value;
  final dynamic valueHolder;
  final VoidCallback onPressed;
  final double width;

  const DeliveryType(
      {Key key, this.value, this.onPressed, this.valueHolder, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: -7)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$value',
                        style: TextStyle(
                            fontSize: 15,
                            color: valueHolder == value
                                ? Theme.of(context).accentColor
                                : Colors.black.withOpacity(0.4))),
                    SizedBox(width: 5),
                    valueHolder == value
                        ? Icon(LineIcons.dot_circle_o,
                            color:
                                Theme.of(context).accentColor.withOpacity(0.9),
                            size: 18)
                        : Icon(LineIcons.circle, color: Colors.grey, size: 18),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
