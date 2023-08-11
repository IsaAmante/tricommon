import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

enum ButtonSize { small, medium, large }

enum ButtonType { primary, secondary, ghost }

enum ButtonPallet { blue, green, danger, transparentBlue, bluelight, seablue }

class TribancoButton extends StatefulWidget {
  const TribancoButton({
    this.text,
    this.icon,
    this.pallet = ButtonPallet.blue,
    this.type = ButtonType.primary,
    this.size = ButtonSize.large,
    this.enabled = true,
    this.onPressed,
    this.onHover,
    this.loading = false,
    this.expand = true,
    this.width,
    super.key,
    this.label,
  });

  final String? text;
  final IconData? icon;
  final ButtonPallet pallet;
  final ButtonType type;
  final ButtonSize size;
  final Function()? onPressed;
  final bool enabled;
  final Function()? onHover;
  final bool loading;
  final bool expand;
  final double? width;
  final String? label;

  @override
  State<TribancoButton> createState() => _TribancoButtonState();
}

class _TribancoButtonState extends State<TribancoButton> {
  bool pressed = false;

  //
  // Button Colors
  //
  Color? get _buttonColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary400;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorTertiaryA500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorDanger500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorTemporary050;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    return null;
  }

  Color? get _pressedButtonColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary700;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary700;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorTertiaryA700;
        case ButtonType.secondary:
          return ColorPalette.colorTertiaryA700;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary900;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary700;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary900;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorDanger500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary700;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    return null;
  }

  Color? get _disabledButtonColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary700;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorPrimary900;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary700;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorPrimary900;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    return null;
  }

  //
  // Border Colors
  //
  Color? get _borderColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorTertiaryA500;
        case ButtonType.secondary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.ghost:
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorDanger500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorTemporary050;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    return null;
  }

  Color? get _pressedBorderColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorTertiaryA500;
        case ButtonType.secondary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary900;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary900;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorDanger500;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    return null;
  }

  Color? get _disabledBorderColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary600;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorPrimary600;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary: //Oooooooooooooooomwmwmwmwmmmwmwmmwmwmwmwwmmw
        case ButtonType.ghost:
          return ColorPalette.colorPrimary600;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutral200;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutralWhite;
      }
    }

    return null;
  }

  //
  // Text Colors
  //
  Color? get _textColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary700;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary700;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorTertiaryA900;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return widget.enabled ? ColorPalette.colorNeutralWhite : ColorPalette.colorNeutralWhite;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary700;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return widget.enabled ? ColorPalette.colorNeutralWhite : ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorDanger500;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorPrimary500;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary700;
      }
    }
    return null;
  }

  Color? get _pressedTextColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary200;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary200;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorSecondary900;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
        case ButtonType.secondary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.ghost:
          return ColorPalette.colorSecondary900;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.ghost:
          return ColorPalette.colorPrimary200;
      }
    }
    return null;
  }

  Color? get _disabledTextColor {
    if (widget.pallet == ButtonPallet.blue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutral200;
      }
    }

    if (widget.pallet == ButtonPallet.seablue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutral200;
      }
    }

    if (widget.pallet == ButtonPallet.green) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary600;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorPrimary700;
      }
    }

    if (widget.pallet == ButtonPallet.transparentBlue) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorPrimary600;
        case ButtonType.secondary:
        case ButtonType.ghost:
          return ColorPalette.colorPrimary700;
      }
    }

    if (widget.pallet == ButtonPallet.danger) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
        case ButtonType.ghost:
          Exception('Button Danger doesn\'t have Secondary or Ghost Types');
          return Colors.transparent;
      }
    }

    if (widget.pallet == ButtonPallet.bluelight) {
      switch (widget.type) {
        case ButtonType.primary:
          return ColorPalette.colorNeutralWhite;
        case ButtonType.secondary:
          return ColorPalette.colorNeutral200;
        case ButtonType.ghost:
          return ColorPalette.colorNeutral200;
      }
    }

    return null;
  }

  //
  // Button Padding
  //
  EdgeInsetsGeometry? get _buttonPadding {
    switch (widget.size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 4.wsp);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 12.wsp);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 12.wsp);
    }
  }

  //
  // Button Width
  //
  double get _buttonWidth {
    switch (widget.size) {
      case ButtonSize.small:
        return 91.wsp;
      case ButtonSize.medium:
        return 107.wsp;
      case ButtonSize.large:
        return 131.wsp;
      default:
        return 131.wsp;
    }
  }

  //
  // Button Height
  //
  double get _buttonHeight {
    switch (widget.size) {
      case ButtonSize.small:
        return 32.hsp;
      case ButtonSize.medium:
        return 48.hsp;
      case ButtonSize.large:
        return 56.hsp;
      default:
        return 56.hsp;
    }
  }

  //
  // Icon Padding
  //
  EdgeInsetsGeometry? get _iconPadding {
    switch (widget.size) {
      case ButtonSize.small:
        return EdgeInsets.fromLTRB(4.0.wsp, 0.0, 4.0.wsp, 0.0);
      case ButtonSize.medium:
        return EdgeInsets.fromLTRB(4.0.wsp, 0.0, 4.0.wsp, 0.0);
      case ButtonSize.large:
        return EdgeInsets.fromLTRB(4.0.wsp, 0.0, 4.0.wsp, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: MergeSemantics(
        child: Semantics(
          button: true,
          label: widget.label ?? widget.text,
          excludeSemantics: true,
          child: SizedBox(
            height: _buttonHeight,
            width: widget.width,
            child: ButtonTheme(
              minWidth: _buttonWidth,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: _buttonPadding,
                  backgroundColor: pressed ? _pressedButtonColor : _buttonColor,
                  disabledBackgroundColor: _disabledButtonColor,
                  side: BorderSide(
                    color: widget.enabled
                        ? pressed
                            ? _pressedBorderColor!
                            : _borderColor!
                        : _disabledBorderColor!,
                    width: 1.wsp,
                  ),
                ),
                onPressed: widget.enabled == false
                    ? null
                    : () {
                        if (!widget.loading) {
                          setState(() {
                            pressed = true;

                            Future.delayed(const Duration(milliseconds: 200), () {
                              if (mounted) {
                                setState(() {
                                  pressed = false;
                                });
                              }
                            });
                          });
                          widget.onPressed?.call();
                        }
                      },

                onHover: (value) => widget.onHover,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    if (widget.icon != null && !widget.loading)
                      Padding(
                        padding: _iconPadding!,
                        child: Icon(
                          widget.icon,
                          color: widget.enabled
                              ? pressed
                                  ? _pressedTextColor
                                  : _textColor
                              : _disabledTextColor,
                          size: 16.hsp,
                        ),
                      ),
                    Flexible(
                      child: widget.loading
                          ? CircularLoading(
                              color: _textColor,
                              size: widget.size == ButtonSize.large
                                  ? 24.hsp
                                  : widget.size == ButtonSize.medium
                                      ? 18.hsp
                                      : 12.hsp,
                            )
                          : Semantics(
                              button: true,
                              child: Text(
                                (widget.text ?? '').toUpperCase(),
                              ).xSmall(
                                style: TextStyle(
                                  height: 1.2,
                                  overflow: TextOverflow.ellipsis,
                                  color: widget.enabled
                                      ? pressed
                                          ? _pressedTextColor
                                          : _textColor
                                      : _disabledTextColor,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                // onPressed: null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
