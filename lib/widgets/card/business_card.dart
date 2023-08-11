import 'package:cached_network_image/cached_network_image.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/themes/themes.dart';
import 'package:tricommon/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../loading/circular/circular.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.cardType, required this.lastFour});
  final String cardType;
  final String lastFour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264.wsp,
      height: 160.hsp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: const Alignment(-1.0, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: [ColorPalette.colorNeutralBlack, ColorPalette.colorNeutral700],
        ),
      ),
      padding: EdgeInsets.fromLTRB(Spacing.small.wsp, Spacing.small.wsp, Spacing.small.wsp, Spacing.xTiny.wsp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cardType).xXSmall(style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.colorNeutralWhite)),
              CachedNetworkImage(
                height: 16.hsp,
                imageUrl: 'https://test-bucket-tribanco-archives.s3.amazonaws.com/public/businesscard/tribanco.png',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: Spacing.xSmall.wsp,
                  height: Spacing.xSmall.hsp,
                  color: ColorPalette.colorNeutralWhite,
                  child: const Center(child: CircularLoading()),
                ),
                errorWidget: (context, url, error) {
                  return Icon(
                    TribancoIcons.tribanco,
                    size: Spacing.xSmall.wsp,
                    color: ColorPalette.colorNeutralWhite,
                  );
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                height: 20.hsp,
                imageUrl: 'https://test-bucket-tribanco-archives.s3.amazonaws.com/public/businesscard/chip.png',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: Spacing.xSmall.wsp,
                  height: Spacing.xSmall.hsp,
                  color: ColorPalette.colorNeutralWhite,
                  child: const Center(child: CircularLoading()),
                ),
                errorWidget: (context, url, error) {
                  return Icon(
                    TribancoIcons.tribanco,
                    size: Spacing.xSmall.wsp,
                    color: ColorPalette.colorNeutralWhite,
                  );
                },
              ),
              Text('.... .... .... $lastFour').small(style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.colorNeutralWhite)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              CachedNetworkImage(
                height: 18.hsp,
                imageUrl: 'https://test-bucket-tribanco-archives.s3.amazonaws.com/public/businesscard/visa.png',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: Spacing.xSmall.wsp,
                  height: Spacing.xSmall.hsp,
                  color: ColorPalette.colorNeutralWhite,
                  child: const Center(child: CircularLoading()),
                ),
                errorWidget: (context, url, error) {
                  return Icon(
                    TribancoIcons.tribanco,
                    size: Spacing.xSmall.wsp,
                    color: ColorPalette.colorNeutralWhite,
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
