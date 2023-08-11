import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoCarouselModel {
  final double? aligment;
  final String? title;
  final String? text;
  final String image;
  final bool isLocal;

  const TribancoCarouselModel({required this.image, required this.isLocal, this.aligment, this.title, this.text});
}

class TribancoDot extends StatefulWidget {
  final List<TribancoCarouselModel> list;
  final EdgeInsetsGeometry _textPadding;
  final bool _showGradient;
  final bool _showText;
  final int interval;
  final bool isWeb;

  const TribancoDot({super.key, ScreenSize? size, bool? showGradient, bool? showText, EdgeInsetsGeometry? padding, required this.list, required this.interval, this.isWeb = false})
      : _showGradient = showGradient ?? false,
        _showText = showText ?? false,
        _textPadding = padding ?? const EdgeInsets.all(0);

  @override
  State<TribancoDot> createState() => _TribancoDotState();
}

class _TribancoDotState extends State<TribancoDot> {
  // dot navigation default size 16 pixels
  var currentPageValue = 0;
  final CarouselController _controller = CarouselController();
  late Offset? _startPosition;
  late Offset? _stopPosition;

  Widget _getGradient() {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(-1.0, 1.0),
            colors: [
              Color.fromRGBO(5, 43, 75, 0.2),
              Color.fromRGBO(5, 43, 75, 0.8),
              Color.fromRGBO(5, 43, 75, 0.8),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: widget.isWeb ? _isWeb() : _isApp(),
    );
  }

  Widget _isApp() {
    return Stack(
      children: [
        builderCarousel(),
        widget._showGradient ? _getGradient() : Container(),
        _getLine(),
        dotNavigation(),
        _getTribancoSymbol(),
      ],
    );
  }

  Widget _isWeb() {
    return Stack(
      children: [
        builderCarousel(),
        widget._showGradient ? _getGradient() : Container(),
        dotNavigation(),
      ],
    );
  }

  Widget builderCarousel() {
    return CarouselSlider.builder(
      itemCount: widget.list.length,
      carouselController: _controller,
      itemBuilder: (context, i, id) {
        return GestureDetector(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onHorizontalDragEnd: onHorizontalDragEnd,
          child: _getImage(i),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: widget.interval),
        reverse: false,
        viewportFraction: 1,
        onPageChanged: (index, reason) => getChangedPageAndMoveBar(index),
      ),
    );
  }

  Widget _getImage(int i) {
    return Container(
        decoration: BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
        image: _getFile(widget.list[i]),
        alignment: widget.isWeb ? Alignment.topCenter : Alignment.center,
        fit: widget.isWeb ? BoxFit.cover : BoxFit.fitHeight,
      ),
    ));
  }

  dynamic _getFile(TribancoCarouselModel file) {
    if (file.isLocal) {
      return AssetImage(file.image, package: 'common');
    } else {
      return FileImage(File(file.image));
    }
  }

  Widget dotNavigation() {
    return SafeArea(
      child: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        child: widget.isWeb ? _dotsAndTextWeb() : _dotsAndTextApp(),
      ),
    );
  }

  Widget _dotsAndTextApp() {
    return Padding(
      padding: widget._textPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 16.hsp),
              height: 8.hsp,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  for (int i = 0; i < widget.list.length; i++)
                    if (i == currentPageValue) ...[dotItem(true)] else dotItem(false),
                ],
              ),
            ),
          ),
          widget._showText
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.wsp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.list[currentPageValue].title ?? '',
                      ).xMedium(
                        style: TextStyle(
                          color: ColorPalette.colorTertiaryA500,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.list[currentPageValue].text ?? '',
                      ).small(
                        style: TextStyle(
                          color: ColorPalette.colorNeutralWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget _dotsAndTextWeb() {
    return Padding(
      padding: EdgeInsets.only(left: 53.wsp, bottom: 64.hsp, right: 53.wsp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          SizedBox(
            width: 400.wsp,
            child: Text(
              widget.list[currentPageValue].title ?? '',
            ).xLarge(
              style: TextStyle(
                color: ColorPalette.colorNeutralWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 16.hsp,
          ),
          Text(
            widget.list[currentPageValue].text ?? '',
          ).xXMedium(
            style: TextStyle(
              color: ColorPalette.colorNeutralWhite,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 32.hsp,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buttonIcon(TribancoIcons.chevronLeft, () {
                  _controller.previousPage();
                }, currentPageValue == 0),
                SizedBox(
                  width: 34.wsp,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                    top: 2.hsp,
                  ),
                  height: 8.hsp,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      for (int i = 0; i < widget.list.length; i++)
                        if (i == currentPageValue) ...[
                          dotItem(true, colorDisabled: ColorPalette.colorNeutralWhite.withOpacity(0.3), colorActive: ColorPalette.colorNeutralWhite, widthDots: 24.wsp)
                        ] else
                          dotItem(false, colorDisabled: ColorPalette.colorNeutralWhite.withOpacity(0.3), colorActive: ColorPalette.colorNeutralWhite, widthDots: 24.wsp),
                    ],
                  ),
                ),
                SizedBox(
                  width: 34.wsp,
                ),
                _buttonIcon(TribancoIcons.chevronRight, () {
                  _controller.nextPage();
                }, currentPageValue == (widget.list.length - 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonIcon(IconData icon, Function()? onTap, bool active) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: active ? ColorPalette.colorNeutralWhite.withOpacity(0.3) : ColorPalette.colorNeutralWhite,
        size: 22.wsp,
      ),
    );
  }

  Widget dotItem(bool isActive, {Color? colorActive, Color? colorDisabled, double? widthDots}) {
    final activeColor = colorActive ?? ColorPalette.colorSecondary500;
    final disabledColor = colorDisabled ?? ColorPalette.colorNeutralWhite;
    final width = widthDots ?? 16.wsp;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.wsp),
      height: isActive ? 8.hsp : 4.hsp,
      width: width,
      decoration: BoxDecoration(
        color: isActive ? activeColor : disabledColor,
      ),
    );
  }

  /*Widget _getLine() {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 340.hsp),
      child: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        child: Image(
          image: const AssetImage('assets/line.png', package: 'onboarding'),
          width: width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }*/

  Widget _getLine() {
    return GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        child: Container(
          color: Colors.transparent,
          child: SvgPicture.asset(
            'assets/line.svg',
            package: 'onboarding',
            fit: BoxFit.fitHeight,
          ),
        ));
  }

  Widget _getTribancoSymbol() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Spacing.xSmall.wsp),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            height: Spacing.medium.hsp,
            child: TribancoBranding.get(type: currentPageValue == 0 ? Branding.symbol : Branding.symbolWhite),
          )
        ]),
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  void onTapDown(TapDownDetails details) {
    _controller.stopAutoPlay();
  }

  void onTapUp(TapUpDetails details) {
    _controller.startAutoPlay();
  }

  void onHorizontalDragStart(DragStartDetails details) {
    _startPosition = details.localPosition;
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    _stopPosition = details.localPosition;
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    if (_startPosition == null || _stopPosition == null) {
      return;
    }
    if (_stopPosition!.dx > _startPosition!.dx) {
      _controller.previousPage();
      return;
    }
    _controller.nextPage();
  }
}
