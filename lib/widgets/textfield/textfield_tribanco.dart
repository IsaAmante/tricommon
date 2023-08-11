import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tricommon/common.dart';

enum TextfieldSize { samll, medium, large }

class TextFieldTribanco extends StatefulWidget {
  const TextFieldTribanco(
      {Key? key,
      required this.title,
      this.size = TextfieldSize.large,
      this.enable = true,
      this.readOnly = false,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixFunction,
      this.prefixIconLabel,
      this.textEditingController,
      this.keyboardType,
      this.mask,
      this.textError,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.passwordInput = false,
      this.hidePassword = true,
      this.initialValue,
      this.textCapitalization = TextCapitalization.none,
      this.onTap,
      this.isGrowable = false,
      this.maxLength,
      this.autofocus = false,
      this.minLines = 1,
      this.focusNode,
      this.textInputAction,
      this.validator,
      this.borderNone = false,
      this.textColor,
      this.label})
      : super(key: key);

  final String title;
  final TextfieldSize size;
  final bool enable;
  final bool readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixFunction;
  final IconData? prefixIconLabel;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? mask;
  final String? textError;
  final Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final bool passwordInput;
  final bool hidePassword;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final Function()? onTap;
  final bool isGrowable;
  final int? maxLength;
  final bool autofocus;
  final int minLines;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool borderNone;
  final Color? textColor;
  final String? label;

  @override
  State<TextFieldTribanco> createState() => _TextFieldTribancoState();
}

class _TextFieldTribancoState extends State<TextFieldTribanco> {
  late FocusNode _node;
  bool validatorController = true;
  late Color fillColor;
  late Color underlineColor;
  late Color textColor;

  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? FocusNode();

    controller = widget.textEditingController ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }

    _colors(update: false);

    _node.addListener(() {
      _colors();
    });
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  void _colors({bool update = true}) {
    if (update) {
      setState(() {
        fillColor = _checkFillColor();
        underlineColor = _checkUnderlineColor();
        textColor = _checkTextColor();
      });
    } else {
      fillColor = _checkFillColor();
      underlineColor = _checkUnderlineColor();
      textColor = _checkTextColor();
    }
  }

  @override
  Widget build(BuildContext context) {
    _colors(update: false);
    return MergeSemantics(
      child: Semantics(
        container: true,
        textField: true,
        child: TextFormField(
          textInputAction: widget.textInputAction,
          minLines: widget.minLines,
          maxLines: widget.isGrowable ? null : widget.minLines,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          textCapitalization: widget.textCapitalization,
          obscureText: widget.passwordInput && widget.hidePassword,
          enabled: widget.enable,
          readOnly: widget.readOnly,
          inputFormatters: widget.mask,
          controller: controller,
          keyboardType: widget.keyboardType,
          focusNode: _node,
          autofocus: widget.autofocus,
          validator: widget.validator,
          cursorColor: ColorPalette.colorPrimary500,
          onChanged: (String value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            _colors();
          },
          style: TextStyle(
            color: widget.textError != null
                ? ColorPalette.colorDanger500
                : widget.enable
                    ? ColorPalette.colorNeutral900
                    : ColorPalette.colorNeutral300,
            fontSize: widget.size == TextfieldSize.large
                ? 16.hsp
                : widget.size == TextfieldSize.medium
                    ? 14.hsp
                    : 12.hsp,
            height: 1.5,
          ),
          decoration: InputDecoration(
              // semanticCounterText: widget.label,
              suffixIcon: widget.suffixIcon != null
                  ? Container(
                      margin: EdgeInsets.only(right: 8.wsp),
                      child: GestureDetector(
                          onTap: widget.suffixFunction, child: Container(color: Colors.transparent, child: Icon(widget.suffixIcon, color: textColor, size: 20.hsp))))
                  : null,
              prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: textColor, size: 20.hsp) : null,
              label: Row(
                children: [
                  if (widget.prefixIconLabel != null)
                    Row(
                      children: [
                        Icon(
                          widget.prefixIconLabel,
                          color: textColor,
                          size: 20.hsp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.wsp),
                          child: Text(
                            widget.title,
                            semanticsLabel: widget.label,
                            style: TextStyle(
                              fontFamily: 'Red_Hat_Display',
                              fontWeight: FontWeight.w400,
                              color: widget.textColor ?? textColor,
                              fontSize: widget.size == TextfieldSize.large
                                  ? 16.hsp
                                  : widget.size == TextfieldSize.medium
                                      ? 14.hsp
                                      : 12.hsp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (widget.prefixIconLabel == null)
                    Expanded(
                      child: Text(
                        widget.title,
                        semanticsLabel: widget.label,
                        style: TextStyle(
                          fontFamily: 'Red_Hat_Display',
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          fontSize: widget.size == TextfieldSize.large
                              ? 16.hsp
                              : widget.size == TextfieldSize.medium
                                  ? 14.hsp
                                  : 12.hsp,
                        ),
                      ),
                    ),
                ],
              ),
              labelStyle: TextStyle(
                color: ColorPalette.colorPrimary400,
                fontSize: widget.size == TextfieldSize.large
                    ? 16.hsp
                    : widget.size == TextfieldSize.medium
                        ? 14.hsp
                        : 12.hsp,
              ),
              filled: true,
              fillColor: widget.enable == false ? ColorPalette.colorNeutral050 : fillColor,
              counterText: '',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.borderNone ? ColorPalette.colorNeutralWhite : underlineColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.borderNone ? ColorPalette.colorNeutralWhite : underlineColor),
              ),
              border: const UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.size == TextfieldSize.samll ? 12.wsp : 16.wsp,
                vertical: widget.size == TextfieldSize.samll ? 8.wsp : 12.hsp,
              ),
              errorText: widget.textError,
              errorMaxLines: 3,
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
              ),
              errorStyle: TextStyle(color: ColorPalette.colorDanger500)),
          onEditingComplete: () => widget.onEditingComplete ?? FocusManager.instance.primaryFocus?.unfocus(),
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ),
    );
  }

  Color _checkFillColor() {
    if (_node.hasFocus && widget.textError == null) {
      return ColorPalette.colorSecondary100;
    } else if (!_node.hasFocus && widget.textError == null) {
      return ColorPalette.colorSecondary050;
    } else {
      return ColorPalette.colorSecondary050;
    }
  }

  Color _checkUnderlineColor() {
    if (_node.hasFocus && widget.textError == null) {
      return ColorPalette.colorPrimary400;
    } else if (!_node.hasFocus && widget.textError == null) {
      return ColorPalette.colorSecondary300;
    } else {
      return ColorPalette.colorDanger300;
    }
  }

  Color _checkTextColor() {
    if (!widget.enable) {
      return ColorPalette.colorNeutral300;
    }
    if (_node.hasFocus && widget.textError == null) {
      return ColorPalette.colorPrimary400;
    } else if (!_node.hasFocus && widget.textError == null) {
      return ColorPalette.colorNeutral600;
    } else {
      return ColorPalette.colorDanger500;
    }
  }
}
