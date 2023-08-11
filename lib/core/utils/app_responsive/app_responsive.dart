// ignore_for_file: use_setters_to_change_properties, parameter_assignments, unused_field

class AppResponsive {
  factory AppResponsive() {
    _instance ??= AppResponsive._internalConstructor();
    return _instance!;
  }
  AppResponsive._internalConstructor();
  static AppResponsive? _instance;
  static const double _width = 368;
  static const double _height = 800;
  static double _percentualWidth = 1.0;
  static double _percentualHeight = 1.0;
  static double? _statusBarSize;
  static double? _actionBarSize;
  static double? _textScaleFactor;
  static double _lastWidth = 0.0;
  static double _lastHeight = 0.0;
  static double _percentualFont = 1.0;
  static bool _isFold = false;
  static double? _initTextScaleFactor;
  static double? _initHeight;
  static double? _initWidth;
  static bool _isAppWeb = false;
  void setInitTextScaleFactor(double textScaleFactor) {
    _initTextScaleFactor = textScaleFactor;
  }

  void setInitHeightAndWidth(double height, double width) {
    _initHeight = height;
    _initWidth = width;
  }

  void setWidth(double width) {
    if (_lastWidth != width) {
      _lastWidth = width;
      _percentualWidth = width / _width;
      if (_percentualWidth == 0 || _isAppWeb) {
        _percentualWidth = 1;
      }
      _setAdaptiveHeight();
    }
  }

  void setHeight(double height) {
    if (_lastHeight != height) {
      //desconsidera o tamanho da statusBar e da actionBar
      _lastHeight = height;
      height -= _statusBarSize ?? 0;
      height -= _actionBarSize ?? 0;
      _percentualHeight = height / _height;
      if (_percentualHeight == 0 || _isAppWeb) {
        _percentualHeight = 1;
      }
      _setAdaptiveHeight();
    }
  }

  void _setAdaptiveHeight() {
    if (_lastHeight != 0.0 && _lastWidth != 0.0) {
      if (_percentualWidth >= _percentualHeight) {
        _percentualFont = (_percentualHeight + _percentualWidth) / 2;
      } else {
        _percentualFont = _percentualHeight;
      }
      if (_percentualWidth - _percentualHeight > 0.4) {
        _percentualHeight = (_percentualHeight + _percentualWidth) / 2;
      }
    }
  }

  void setTextScaleFactor(double textScaleFactor) {
    if (_textScaleFactor == null) {
      _textScaleFactor = textScaleFactor;
      if (_textScaleFactor! < 1.0) {
        _textScaleFactor = 1.0;
      } else if (_textScaleFactor! > 1.125) {
        _textScaleFactor = 1.125;
      }
    }
  }

  void setIsFold(bool isFold) {
    _isFold = isFold;
  }

  @Deprecated('Use extension .wsp')
  double getWidth(num width) => _percentualWidth * width;
  @Deprecated('Use extension .hsp')
  double getHeight(num height) => _percentualHeight * height * (_textScaleFactor ?? 1);
  void setStatusBarSize(double size) => _statusBarSize = size;
  void setActionBarSize(double size) => _actionBarSize = size;
  static double get statusBarSize => _statusBarSize ?? 0;
  static double get actionBarSize => _actionBarSize ?? 0;
  static double get percentualHeight => _percentualHeight;
  static double get percentualWidth => _percentualWidth;
  static double get textScaleFactor => _textScaleFactor ?? 1;
  static double get percentualFont => _percentualFont;
  static double get lastWidth => _lastWidth;
  bool checkChangeResponsive(double textScaleFactor, double height, double width) {
    if (_initTextScaleFactor == null || _initHeight == null || _initWidth == null) {
      return false;
    }
    return textScaleFactor != _initTextScaleFactor || height != _initHeight || width != _initWidth;
  }

  void setIsAppWeb(bool isAppWeb) {
    _isAppWeb = isAppWeb;
  }
}
