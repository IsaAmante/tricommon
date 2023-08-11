import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  final List<String> titles;
  final List<String> messages;
  final List<Widget> _banners = [];

  BannerCarousel({super.key, required this.messages, required this.titles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Spacing.tiny.hsp),
        TribancoCarousel(
          edgeSpace: 24.wsp,
          height: 176.hsp,
          itemSpace: 16.wsp,
          itemWidth: 201.wsp,
          itemCount: messages.length,
          items: _getItems(),
          dotsHeightSpace: Spacing.small.hsp,
          dotHeight: 4.hsp,
          dotSelectedHeight: 8.hsp,
          dotWidth: 16.wsp,
          dotSelectedWidth: 24.wsp,
        )
      ],
    );
  }

  List<Widget> _getItems() {
    for (int i = 0; i < messages.length; i++) {
      _banners.add(BannerCarousel2(
        message: messages[i],
        title: titles[i],
        isFirst: i == 0,
        isLast: i == messages.length - 1,
      ));
    }
    return _banners;
  }
}
