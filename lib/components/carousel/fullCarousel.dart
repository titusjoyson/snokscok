import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://picsum.photos/1000/1000/',
  'https://picsum.photos/1000/1000/',
  'https://picsum.photos/1000/1000/',
];

class CarouselLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          autoPlay: false,
          viewportFraction: 0.70,
        ),
        items: imgList
            .map(
              (item) => Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item),
                    fit: BoxFit.fill,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    print("Container clicked");
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
