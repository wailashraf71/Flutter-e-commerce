import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const DotsIndicator({Key key, this.controller, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SmoothPageIndicator(
            controller: controller,
            count: count,
            effect: SwapEffect(
              dotColor: Colors.black12,
              activeDotColor: Theme.of(context).accentColor,
              dotWidth: 9,
              dotHeight: 9,
              paintStyle: PaintingStyle.fill,
            )));
  }
}
