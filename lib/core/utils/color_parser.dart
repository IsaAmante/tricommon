import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/consts/light_palette.dart';
import 'package:tricommon/core/consts/dark_palette.dart';

class ColorParser {
  ColorParser._();

  static void setLightMode() {
    ColorPalette.isDarkMode = false;
    ColorPalette.colorMode = 'light';

    //Prymary
    ColorPalette.colorPrimary900 = LightPalette.colorLightPrimary900;
    ColorPalette.colorPrimary800 = LightPalette.colorLightPrimary800;
    ColorPalette.colorPrimary700 = LightPalette.colorLightPrimary700;
    ColorPalette.colorPrimary600 = LightPalette.colorLightPrimary600;
    ColorPalette.colorPrimary500 = LightPalette.colorLightPrimary500;
    ColorPalette.colorPrimary400 = LightPalette.colorLightPrimary400;
    ColorPalette.colorPrimary300 = LightPalette.colorLightPrimary300;
    ColorPalette.colorPrimary200 = LightPalette.colorLightPrimary200;
    ColorPalette.colorPrimary100 = LightPalette.colorLightPrimary100;
    ColorPalette.colorPrimary050 = LightPalette.colorLightPrimary050;

    //Secondary
    ColorPalette.colorSecondary900 = LightPalette.colorLightSecondary900;
    ColorPalette.colorSecondary800 = LightPalette.colorLightSecondary800;
    ColorPalette.colorSecondary700 = LightPalette.colorLightSecondary700;
    ColorPalette.colorSecondary600 = LightPalette.colorLightSecondary600;
    ColorPalette.colorSecondary500 = LightPalette.colorLightSecondary500;
    ColorPalette.colorSecondary400 = LightPalette.colorLightSecondary400;
    ColorPalette.colorSecondary300 = LightPalette.colorLightSecondary300;
    ColorPalette.colorSecondary200 = LightPalette.colorLightSecondary200;
    ColorPalette.colorSecondary100 = LightPalette.colorLightSecondary100;
    ColorPalette.colorSecondary050 = LightPalette.colorLightSecondary050;

    //Tertiary A
    ColorPalette.colorTertiaryA900 = LightPalette.colorLightTertiaryA900;
    ColorPalette.colorTertiaryA800 = LightPalette.colorLightTertiaryA800;
    ColorPalette.colorTertiaryA700 = LightPalette.colorLightTertiaryA700;
    ColorPalette.colorTertiaryA600 = LightPalette.colorLightTertiaryA600;
    ColorPalette.colorTertiaryA500 = LightPalette.colorLightTertiaryA500;
    ColorPalette.colorTertiaryA400 = LightPalette.colorLightTertiaryA400;
    ColorPalette.colorTertiaryA300 = LightPalette.colorLightTertiaryA300;
    ColorPalette.colorTertiaryA200 = LightPalette.colorLightTertiaryA200;
    ColorPalette.colorTertiaryA100 = LightPalette.colorLightTertiaryA100;
    ColorPalette.colorTertiaryA050 = LightPalette.colorLightTertiaryA050;

    //Tertiary B
    ColorPalette.colorTertiaryB900 = LightPalette.colorLightTertiaryB900;
    ColorPalette.colorTertiaryB800 = LightPalette.colorLightTertiaryB800;
    ColorPalette.colorTertiaryB700 = LightPalette.colorLightTertiaryB700;
    ColorPalette.colorTertiaryB600 = LightPalette.colorLightTertiaryB600;
    ColorPalette.colorTertiaryB500 = LightPalette.colorLightTertiaryB500;
    ColorPalette.colorTertiaryB400 = LightPalette.colorLightTertiaryB400;
    ColorPalette.colorTertiaryB300 = LightPalette.colorLightTertiaryB300;
    ColorPalette.colorTertiaryB200 = LightPalette.colorLightTertiaryB200;
    ColorPalette.colorTertiaryB100 = LightPalette.colorLightTertiaryB100;
    ColorPalette.colorTertiaryB050 = LightPalette.colorLightTertiaryB050;

    //Neutral
    ColorPalette.colorNeutralBlack = LightPalette.colorLightNeutralBlack;
    ColorPalette.colorNeutral900 = LightPalette.colorLightNeutral900;
    ColorPalette.colorNeutral800 = LightPalette.colorLightNeutral800;
    ColorPalette.colorNeutral700 = LightPalette.colorLightNeutral700;
    ColorPalette.colorNeutral600 = LightPalette.colorLightNeutral600;
    ColorPalette.colorNeutral500 = LightPalette.colorLightNeutral500;
    ColorPalette.colorNeutral400 = LightPalette.colorLightNeutral400;
    ColorPalette.colorNeutral300 = LightPalette.colorLightNeutral300;
    ColorPalette.colorNeutral200 = LightPalette.colorLightNeutral200;
    ColorPalette.colorNeutral100 = LightPalette.colorLightNeutral100;
    ColorPalette.colorNeutral050 = LightPalette.colorLightNeutral050;
    ColorPalette.colorNeutralWhite = LightPalette.colorLightNeutralWhite;

    //Success
    ColorPalette.colorSuccess900 = LightPalette.colorLightSuccess900;
    ColorPalette.colorSuccess800 = LightPalette.colorLightSuccess800;
    ColorPalette.colorSuccess700 = LightPalette.colorLightSuccess700;
    ColorPalette.colorSuccess600 = LightPalette.colorLightSuccess600;
    ColorPalette.colorSuccess500 = LightPalette.colorLightSuccess500;
    ColorPalette.colorSuccess400 = LightPalette.colorLightSuccess400;
    ColorPalette.colorSuccess300 = LightPalette.colorLightSuccess300;
    ColorPalette.colorSuccess200 = LightPalette.colorLightSuccess200;
    ColorPalette.colorSuccess100 = LightPalette.colorLightSuccess100;
    ColorPalette.colorSuccess050 = LightPalette.colorLightSuccess050;

    //Warning
    ColorPalette.colorWarning900 = LightPalette.colorLightWarning900;
    ColorPalette.colorWarning800 = LightPalette.colorLightWarning800;
    ColorPalette.colorWarning700 = LightPalette.colorLightWarning700;
    ColorPalette.colorWarning600 = LightPalette.colorLightWarning600;
    ColorPalette.colorWarning500 = LightPalette.colorLightWarning500;
    ColorPalette.colorWarning400 = LightPalette.colorLightWarning400;
    ColorPalette.colorWarning300 = LightPalette.colorLightWarning300;
    ColorPalette.colorWarning200 = LightPalette.colorLightWarning200;
    ColorPalette.colorWarning100 = LightPalette.colorLightWarning100;
    ColorPalette.colorWarning050 = LightPalette.colorLightWarning050;

    //Danger
    ColorPalette.colorDanger900 = LightPalette.colorLightDanger900;
    ColorPalette.colorDanger800 = LightPalette.colorLightDanger800;
    ColorPalette.colorDanger700 = LightPalette.colorLightDanger700;
    ColorPalette.colorDanger600 = LightPalette.colorLightDanger600;
    ColorPalette.colorDanger500 = LightPalette.colorLightDanger500;
    ColorPalette.colorDanger400 = LightPalette.colorLightDanger400;
    ColorPalette.colorDanger300 = LightPalette.colorLightDanger300;
    ColorPalette.colorDanger200 = LightPalette.colorLightDanger200;
    ColorPalette.colorDanger100 = LightPalette.colorLightDanger100;
    ColorPalette.colorDanger050 = LightPalette.colorLightDanger050;

    //Informational
    ColorPalette.colorInformational900 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational800 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational700 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational600 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational500 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational400 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational300 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational200 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational100 = LightPalette.colorLightInformational900;
    ColorPalette.colorInformational050 = LightPalette.colorLightInformational900;
  }

  static void setDarkMode() {
    ColorPalette.isDarkMode = true;
    ColorPalette.colorMode = 'dark';

    //Prymary
    ColorPalette.colorPrimary900 = DarkPalette.colorDarkPrimary900;
    ColorPalette.colorPrimary800 = DarkPalette.colorDarkPrimary800;
    ColorPalette.colorPrimary700 = DarkPalette.colorDarkPrimary700;
    ColorPalette.colorPrimary600 = DarkPalette.colorDarkPrimary600;
    ColorPalette.colorPrimary500 = DarkPalette.colorDarkPrimary500;
    ColorPalette.colorPrimary400 = DarkPalette.colorDarkPrimary400;
    ColorPalette.colorPrimary300 = DarkPalette.colorDarkPrimary300;
    ColorPalette.colorPrimary200 = DarkPalette.colorDarkPrimary200;
    ColorPalette.colorPrimary100 = DarkPalette.colorDarkPrimary100;
    ColorPalette.colorPrimary050 = DarkPalette.colorDarkPrimary050;

    //Secondary
    ColorPalette.colorSecondary900 = DarkPalette.colorDarkSecondary900;
    ColorPalette.colorSecondary800 = DarkPalette.colorDarkSecondary800;
    ColorPalette.colorSecondary700 = DarkPalette.colorDarkSecondary700;
    ColorPalette.colorSecondary600 = DarkPalette.colorDarkSecondary600;
    ColorPalette.colorSecondary500 = DarkPalette.colorDarkSecondary500;
    ColorPalette.colorSecondary400 = DarkPalette.colorDarkSecondary400;
    ColorPalette.colorSecondary300 = DarkPalette.colorDarkSecondary300;
    ColorPalette.colorSecondary200 = DarkPalette.colorDarkSecondary200;
    ColorPalette.colorSecondary100 = DarkPalette.colorDarkSecondary100;
    ColorPalette.colorSecondary050 = DarkPalette.colorDarkSecondary050;

    //Tertiary A
    ColorPalette.colorTertiaryA900 = DarkPalette.colorDarkTertiaryA900;
    ColorPalette.colorTertiaryA800 = DarkPalette.colorDarkTertiaryA800;
    ColorPalette.colorTertiaryA700 = DarkPalette.colorDarkTertiaryA700;
    ColorPalette.colorTertiaryA600 = DarkPalette.colorDarkTertiaryA600;
    ColorPalette.colorTertiaryA500 = DarkPalette.colorDarkTertiaryA500;
    ColorPalette.colorTertiaryA400 = DarkPalette.colorDarkTertiaryA400;
    ColorPalette.colorTertiaryA300 = DarkPalette.colorDarkTertiaryA300;
    ColorPalette.colorTertiaryA200 = DarkPalette.colorDarkTertiaryA200;
    ColorPalette.colorTertiaryA100 = DarkPalette.colorDarkTertiaryA100;
    ColorPalette.colorTertiaryA050 = DarkPalette.colorDarkTertiaryA050;

    //Tertiary B
    ColorPalette.colorTertiaryB900 = DarkPalette.colorDarkTertiaryB900;
    ColorPalette.colorTertiaryB800 = DarkPalette.colorDarkTertiaryB800;
    ColorPalette.colorTertiaryB700 = DarkPalette.colorDarkTertiaryB700;
    ColorPalette.colorTertiaryB600 = DarkPalette.colorDarkTertiaryB600;
    ColorPalette.colorTertiaryB500 = DarkPalette.colorDarkTertiaryB500;
    ColorPalette.colorTertiaryB400 = DarkPalette.colorDarkTertiaryB400;
    ColorPalette.colorTertiaryB300 = DarkPalette.colorDarkTertiaryB300;
    ColorPalette.colorTertiaryB200 = DarkPalette.colorDarkTertiaryB200;
    ColorPalette.colorTertiaryB100 = DarkPalette.colorDarkTertiaryB100;
    ColorPalette.colorTertiaryB050 = DarkPalette.colorDarkTertiaryB050;

    //Neutral
    ColorPalette.colorNeutralBlack = DarkPalette.colorDarkNeutralBlack;
    ColorPalette.colorNeutral900 = DarkPalette.colorDarkNeutral900;
    ColorPalette.colorNeutral800 = DarkPalette.colorDarkNeutral800;
    ColorPalette.colorNeutral700 = DarkPalette.colorDarkNeutral700;
    ColorPalette.colorNeutral600 = DarkPalette.colorDarkNeutral600;
    ColorPalette.colorNeutral500 = DarkPalette.colorDarkNeutral500;
    ColorPalette.colorNeutral400 = DarkPalette.colorDarkNeutral400;
    ColorPalette.colorNeutral300 = DarkPalette.colorDarkNeutral300;
    ColorPalette.colorNeutral200 = DarkPalette.colorDarkNeutral200;
    ColorPalette.colorNeutral100 = DarkPalette.colorDarkNeutral100;
    ColorPalette.colorNeutral050 = DarkPalette.colorDarkNeutral050;
    ColorPalette.colorNeutralWhite = DarkPalette.colorDarkNeutralWhite;

    //Success
    ColorPalette.colorSuccess900 = DarkPalette.colorDarkSuccess900;
    ColorPalette.colorSuccess800 = DarkPalette.colorDarkSuccess800;
    ColorPalette.colorSuccess700 = DarkPalette.colorDarkSuccess700;
    ColorPalette.colorSuccess600 = DarkPalette.colorDarkSuccess600;
    ColorPalette.colorSuccess500 = DarkPalette.colorDarkSuccess500;
    ColorPalette.colorSuccess400 = DarkPalette.colorDarkSuccess400;
    ColorPalette.colorSuccess300 = DarkPalette.colorDarkSuccess300;
    ColorPalette.colorSuccess200 = DarkPalette.colorDarkSuccess200;
    ColorPalette.colorSuccess100 = DarkPalette.colorDarkSuccess100;
    ColorPalette.colorSuccess050 = DarkPalette.colorDarkSuccess050;

    //Warning
    ColorPalette.colorWarning900 = DarkPalette.colorDarkWarning900;
    ColorPalette.colorWarning800 = DarkPalette.colorDarkWarning800;
    ColorPalette.colorWarning700 = DarkPalette.colorDarkWarning700;
    ColorPalette.colorWarning600 = DarkPalette.colorDarkWarning600;
    ColorPalette.colorWarning500 = DarkPalette.colorDarkWarning500;
    ColorPalette.colorWarning400 = DarkPalette.colorDarkWarning400;
    ColorPalette.colorWarning300 = DarkPalette.colorDarkWarning300;
    ColorPalette.colorWarning200 = DarkPalette.colorDarkWarning200;
    ColorPalette.colorWarning100 = DarkPalette.colorDarkWarning100;
    ColorPalette.colorWarning050 = DarkPalette.colorDarkWarning050;

    //Danger
    ColorPalette.colorDanger900 = DarkPalette.colorDarkDanger900;
    ColorPalette.colorDanger800 = DarkPalette.colorDarkDanger800;
    ColorPalette.colorDanger700 = DarkPalette.colorDarkDanger700;
    ColorPalette.colorDanger600 = DarkPalette.colorDarkDanger600;
    ColorPalette.colorDanger500 = DarkPalette.colorDarkDanger500;
    ColorPalette.colorDanger400 = DarkPalette.colorDarkDanger400;
    ColorPalette.colorDanger300 = DarkPalette.colorDarkDanger300;
    ColorPalette.colorDanger200 = DarkPalette.colorDarkDanger200;
    ColorPalette.colorDanger100 = DarkPalette.colorDarkDanger100;
    ColorPalette.colorDanger050 = DarkPalette.colorDarkDanger050;

    //Informational
    ColorPalette.colorInformational900 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational800 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational700 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational600 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational500 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational400 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational300 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational200 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational100 = DarkPalette.colorDarkInformational900;
    ColorPalette.colorInformational050 = DarkPalette.colorDarkInformational900;
  }
}
