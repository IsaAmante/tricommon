import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class BannerCarousel2 extends StatelessWidget {
  final String title;
  final String message;
  final bool isFirst;
  final bool isLast;

  const BannerCarousel2({
    super.key,
    required this.message,
    required this.title,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: isFirst ? Spacing.xSmall.wsp : Spacing.small.wsp, right: isLast ? Spacing.xSmall.wsp : 0),
      width: 201.wsp,
      child: Row(
        children: [_getBanner()],
      ),
    );
  }

  Widget _getBanner() => Container(
        width: 201.wsp,
        height: 155.hsp,
        decoration: BoxDecoration(
          color: ColorPalette.colorNeutral050,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 2,
              color: ColorPalette.colorPrimary800.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacing.small.wsp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Spacing.xSmall.hsp,
              ),
              Icon(
                TribancoIcons.image,
                color: ColorPalette.colorPrimary500,
                size: 20,
              ),
              SizedBox(
                height: Spacing.small.hsp,
              ),
              Text(title, maxLines: 2, overflow: TextOverflow.ellipsis).small(style: TextStyle(color: ColorPalette.colorPrimary500, fontWeight: FontWeight.w700)),
              SizedBox(
                height: Spacing.tiny.hsp,
              ),
              Text(message, maxLines: 4, overflow: TextOverflow.ellipsis).xXSmall(style: TextStyle(color: ColorPalette.colorNeutral700, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      );
}
