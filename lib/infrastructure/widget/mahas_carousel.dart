import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MahasCarousel extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final double aspectRatio;
  final bool enlargeCenterPage;
  final bool autoPlay;
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  const MahasCarousel({
    super.key,
    required this.items,
    this.height = 200.0,
    this.aspectRatio = 16 / 9,
    this.enlargeCenterPage = false,
    this.autoPlay = false,
    this.onPageChanged,
  });

  @override
  MahasCarouselState createState() => MahasCarouselState();
}

class MahasCarouselState extends State<MahasCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.items.map((item) {
            return SizedBox(
              width: double.infinity,
              height: widget.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: item,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: widget.height,
            aspectRatio: widget.aspectRatio,
            enlargeCenterPage: widget.enlargeCenterPage,
            autoPlay: widget.autoPlay,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(index, reason);
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.items.map((item) {
            int index = widget.items.indexOf(item);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.black.withOpacity(0.9)
                    : Colors.black.withOpacity(0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
