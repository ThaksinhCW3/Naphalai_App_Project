import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class CustomCarouselWithController extends StatefulWidget {
  final List<Widget> items;

  const CustomCarouselWithController({super.key, required this.items});

  @override
  State<CustomCarouselWithController> createState() =>
      _CustomCarouselWithControllerState();
}

class _CustomCarouselWithControllerState
    extends State<CustomCarouselWithController> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: widget.items,
          controller: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 0,
          ),
        ),
      ],
    );
  }
}
