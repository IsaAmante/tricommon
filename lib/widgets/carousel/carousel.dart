import 'package:flutter/material.dart';

import '../dot/dot_navigator.dart';

class TribancoCarousel extends StatefulWidget {
  final double height;
  final double itemWidth;
  final double edgeSpace;
  final double itemSpace;
  final int itemCount;
  final List<Widget> items;
  final double dotsHeightSpace;
  final double dotWidth;
  final double dotHeight;
  final Color? dotColor;
  final double dotSelectedWidth;
  final double dotSelectedHeight;
  final Color? dotSelectedColor;
  final double dotSpacing;
  final void Function(int)? onItemSelectedChange;
  final EdgeInsets? padding;
  final bool centerWhenHasOne;

  const TribancoCarousel({
    super.key,
    required this.edgeSpace,
    required this.height,
    required this.itemSpace,
    required this.itemWidth,
    required this.itemCount,
    required this.items,
    required this.dotsHeightSpace,
    this.dotColor,
    this.dotSelectedColor,
    this.dotHeight = 4.0,
    this.dotWidth = 16.0,
    this.dotSelectedHeight = 8.0,
    this.dotSelectedWidth = 24.0,
    this.dotSpacing = 8.0,
    this.onItemSelectedChange,
    this.padding,
    this.centerWhenHasOne = false,
  });

  @override
  State<StatefulWidget> createState() => _TribancoCarouselState();
}

class _TribancoCarouselState extends State<TribancoCarousel> {
  final ScrollController _scrollController = ScrollController();
  final List<double> _itemPositions = [];
  bool _checkingPosition = false;
  int _itemSelected = 0;

  @override
  void initState() {
    final firstPosition = widget.itemWidth / 2 + widget.edgeSpace + widget.itemSpace;
    for (int i = 1; i <= widget.itemCount; i++) {
      //_itemPositions.add((widget.itemWidth * i / 2) + widget.edgeSpace + (widget.itemSpace * (i - 1)));
      double position = firstPosition;
      if (i > 1) {
        position += (widget.itemWidth * (i - 1)) + (widget.itemSpace * (i - 1));
      }
      _itemPositions.add(position);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.centerWhenHasOne && widget.items.length == 1)
          SizedBox(
            height: widget.height,
            child: widget.items[0],
          )
        else
          SizedBox(
            height: widget.height,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification? notification) {
                return _scrollListener(notification: notification);
              },
              child: ListView(
                padding: widget.padding,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                children: widget.items,
              ),
            ),
          ),
        SizedBox(height: widget.dotsHeightSpace),
        TribancoDotNavigator(
          dotsCount: widget.itemCount,
          dotSelected: _itemSelected,
          dotColor: widget.dotColor,
          dotHeight: widget.dotHeight,
          dotSelectedColor: widget.dotSelectedColor,
          dotSelectedHeight: widget.dotSelectedHeight,
          dotSelectedWidth: widget.dotSelectedWidth,
          dotSpacing: widget.dotSpacing,
          dotWidth: widget.dotWidth,
        )
      ],
    );
  }

  bool _scrollListener({ScrollNotification? notification}) {
    if (notification == null) {
      return true;
    }
    if (notification is ScrollUpdateNotification) {
      _checkPosition(currentPosition: _scrollController.offset);
      return true;
    }
    return true;
  }

  void _checkPosition({required double currentPosition}) {
    if (_checkingPosition) {
      return;
    }
    _checkingPosition = true;
    for (int i = 0; i < widget.itemCount; i++) {
      if (currentPosition < _itemPositions[i]) {
        if (i != _itemSelected) {
          setState(() {
            _itemSelected = i;
            widget.onItemSelectedChange?.call(_itemSelected);
          });
        }
        _checkingPosition = false;
        return;
      }
    }
    if (widget.itemCount - 1 != _itemSelected) {
      setState(() {
        _itemSelected = widget.itemCount - 1;
        widget.onItemSelectedChange?.call(_itemSelected);
      });
    }
    _checkingPosition = false;
    return;
  }
}
