// ignore_for_file: constant_identifier_names

import 'package:tricommon/core/utils/app_responsive/app_responsive.dart';
import 'package:flutter/widgets.dart';
import 'color_palette.dart';

const NORMAL_FONT_FAMILY = 'Red_Hat_Display';

extension TextExtension on Text {
  Text micro({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 8.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 2.0);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text tiny({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 10.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.6);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text xXSmall({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 12.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.33);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text xSmall({TextStyle? style, TextHeightBehavior? textHeightBehavior}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 14.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.71);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text small({TextStyle? style}) {
    final TextStyle defaultStyle = TextStyle(
      fontFamily: NORMAL_FONT_FAMILY,
      fontSize: 16.0 * AppResponsive.percentualFont,
      color: ColorPalette.colorNeutralBlack,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text medium({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 18.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.77);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text xMedium({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 20.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.6);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text xXMedium({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 24.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.66);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text large({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 32.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.5);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text xLarge({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 48.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.41);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text xXLarge({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 64.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.5);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text huge({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 80.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.5);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }

  Text giant({TextStyle? style}) {
    final TextStyle defaultStyle =
        TextStyle(fontFamily: NORMAL_FONT_FAMILY, fontSize: 96.0 * AppResponsive.percentualFont, color: ColorPalette.colorNeutralBlack, fontWeight: FontWeight.w500, height: 1.25);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style));
  }
}
