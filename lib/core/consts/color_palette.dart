import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette();

  static bool isDarkMode = false;
  static String colorMode = 'light';

  //Prymary
  static Color colorPrimary900 = const Color(0xFF011727);
  static Color colorPrimary800 = const Color(0xFF02223B);
  static Color colorPrimary700 = const Color(0xFF032D4E);
  static Color colorPrimary600 = const Color(0xFF043862);
  static Color colorPrimary500 = const Color(0xFF054375);
  static Color colorPrimary400 = const Color(0xFF055A9E);
  static Color colorPrimary300 = const Color(0xFF0864B0);
  static Color colorPrimary200 = const Color(0xFF0972C8);
  static Color colorPrimary100 = const Color(0xFF0883E7);
  static Color colorPrimary050 = const Color(0xFF1090F9);

  //Secondary
  static Color colorSecondary900 = const Color(0xFF024C64);
  static Color colorSecondary800 = const Color(0xFF026A8D);
  static Color colorSecondary700 = const Color(0xFF0388B5);
  static Color colorSecondary600 = const Color(0xFF03A7DD);
  static Color colorSecondary500 = const Color(0xFF05BDFB);
  static Color colorSecondary400 = const Color(0xFF40CDFC);
  static Color colorSecondary300 = const Color(0xFF7CDDFD);
  static Color colorSecondary200 = const Color(0xFFBDEEFE);
  static Color colorSecondary100 = const Color(0xFFE1F7FF);
  static Color colorSecondary050 = const Color(0xFFF0FBFF);

  //Tertiary A
  static Color colorTertiaryA900 = const Color(0xFF375313);
  static Color colorTertiaryA800 = const Color(0xFF4D741A);
  static Color colorTertiaryA700 = const Color(0xFF649622);
  static Color colorTertiaryA600 = const Color(0xFF7AB72A);
  static Color colorTertiaryA500 = const Color(0xFF8CD133);
  static Color colorTertiaryA400 = const Color(0xFFA2D959);
  static Color colorTertiaryA300 = const Color(0xFFB4E17A);
  static Color colorTertiaryA200 = const Color(0xFFC7E89B);
  static Color colorTertiaryA100 = const Color(0xFFDAF0BC);
  static Color colorTertiaryA050 = const Color(0xFFEDF7DE);

  //Tertiary B
  static Color colorTertiaryB900 = const Color(0xFF752901);
  static Color colorTertiaryB800 = const Color(0xFFA95F04);
  static Color colorTertiaryB700 = const Color(0xFFF29E18);
  static Color colorTertiaryB600 = const Color(0xFFF4B42A);
  static Color colorTertiaryB500 = const Color(0xFFF3CB3F);
  static Color colorTertiaryB400 = const Color(0xFFF4DA57);
  static Color colorTertiaryB300 = const Color(0xFFF7E06E);
  static Color colorTertiaryB200 = const Color(0xFFF9EC76);
  static Color colorTertiaryB100 = const Color(0xFFFBF3A7);
  static Color colorTertiaryB050 = const Color(0xFFFEF8C3);

  //Neutral
  static Color colorNeutralBlack = const Color(0xFF000000);
  static Color colorNeutral900 = const Color(0xFF091015);
  static Color colorNeutral800 = const Color(0xFF111A22);
  static Color colorNeutral700 = const Color(0xFF212D36);
  static Color colorNeutral600 = const Color(0xFF4B5A68);
  static Color colorNeutral500 = const Color(0xFF5A6872);
  static Color colorNeutral400 = const Color(0xFF9CAFBF);
  static Color colorNeutral300 = const Color(0xFFB9C5CF);
  static Color colorNeutral200 = const Color(0xFFD7DEE5);
  static Color colorNeutral100 = const Color(0xFFEFF2F6);
  static Color colorNeutral050 = const Color(0xFFF5F7F9);
  static Color colorNeutral001 = const Color(0xFFF5F7F8);
  static Color colorNeutralWhite = const Color(0xFFFFFFFF);

  //Success
  static Color colorSuccess900 = const Color(0xFF002C0D);
  static Color colorSuccess800 = const Color(0xFF015219);
  static Color colorSuccess700 = const Color(0xFF097329);
  static Color colorSuccess600 = const Color(0xFF16903B);
  static Color colorSuccess500 = const Color(0xFF26A94D);
  static Color colorSuccess400 = const Color(0xFF49C36E);
  static Color colorSuccess300 = const Color(0xFF6FD98F);
  static Color colorSuccess200 = const Color(0xFF9AEBB2);
  static Color colorSuccess100 = const Color(0xFFCCF8D9);
  static Color colorSuccess050 = const Color(0xFFD8FDE3);

  //Warning
  static Color colorWarning900 = const Color(0xFF3D2A00);
  static Color colorWarning800 = const Color(0xFF705300);
  static Color colorWarning700 = const Color(0xFF9E6C00);
  static Color colorWarning600 = const Color(0xFFD19200);
  static Color colorWarning500 = const Color(0xFFEEB412);
  static Color colorWarning400 = const Color(0xFFFFC933);
  static Color colorWarning300 = const Color(0xFFFFD666);
  static Color colorWarning200 = const Color(0xFFFFE499);
  static Color colorWarning100 = const Color(0xFFFFF5C2);
  static Color colorWarning050 = const Color(0xFFFFF7DB);

  //Danger
  static Color colorDanger900 = const Color(0xFF330003);
  static Color colorDanger800 = const Color(0xFF660209);
  static Color colorDanger700 = const Color(0xFF900C15);
  static Color colorDanger600 = const Color(0xFFB31C26);
  static Color colorDanger500 = const Color(0xFFD0333D);
  static Color colorDanger400 = const Color(0xFFE64F59);
  static Color colorDanger300 = const Color(0xFFF6727E);
  static Color colorDanger200 = const Color(0xFFFF9BA2);
  static Color colorDanger100 = const Color(0xFFFFC7CA);
  static Color colorDanger050 = const Color(0xFFFFDBDD);

  //Informational
  static Color colorInformational900 = const Color(0xFF000E33);
  static Color colorInformational800 = const Color(0xFF001B66);
  static Color colorInformational700 = const Color(0xFF002999);
  static Color colorInformational600 = const Color(0xFF0238CC);
  static Color colorInformational500 = const Color(0xFF1954F5);
  static Color colorInformational400 = const Color(0xFF356BFF);
  static Color colorInformational300 = const Color(0xFF668FFF);
  static Color colorInformational200 = const Color(0xFF99B4FF);
  static Color colorInformational100 = const Color(0xFFC2D2FF);
  static Color colorInformational050 = const Color(0xFFDBE5FF);

  //Temporary colors
  static Color colorTemporary050 = const Color(0xFF0FA8BD);

  //Light Theme
}
