import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tricommon/common.dart';

class PinInputWeb extends StatefulWidget {
  const PinInputWeb({
    required this.onChanged,
    this.errorInput = false,
    super.key,
    this.enabled = true,
    this.fieldWidth,
  });

  final Function(String) onChanged;
  final bool errorInput;
  final bool enabled;
  final double? fieldWidth;

  @override
  State<PinInputWeb> createState() => _PinInputWebState();
}

class _PinInputWebState extends State<PinInputWeb> {
  final List<FocusNode> _pinFieldFocusNodes = List.generate(6, (_) => FocusNode());

  final List<TextEditingController> _pinFieldControllers = List.generate(6, (_) => TextEditingController());

  String _pin = '';

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _pinFieldFocusNodes[i].addListener(_onFocusChange);
      _pinFieldControllers[i].addListener(_onPinChanged);
    }
  }

  @override
  void dispose() {
    for (var controller in _pinFieldControllers) {
      controller.dispose();
    }
    for (var focusNode in _pinFieldFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    for (int i = 0; i < 5; i++) {
      if (_pinFieldControllers[i].text.isNotEmpty && _pinFieldFocusNodes[i].hasFocus) {
        FocusScope.of(context).requestFocus(_pinFieldFocusNodes[i + 1]);
      }
    }
  }

  void _onPinChanged() {
    setState(() {
      _pin = _pinFieldControllers.map((controller) => controller.text).join();
    });
  }

  void _deleteDigit(int index) {
    if (index >= 0 && index < 6) {
      if (index == 5 && _pinFieldControllers[index].text.isNotEmpty) {
        _pinFieldControllers[index].clear();
      } else {
        _pinFieldControllers[index - 1].clear();
      }
    }
    if (index > 0) {
      FocusScope.of(context).requestFocus(_pinFieldFocusNodes[index - 1]);
    }

    _onPinChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          RawKeyboardListener(
            autofocus: true,
            focusNode: FocusNode(),
            onKey: (event) {
              if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
                if (_pinFieldFocusNodes[i].hasFocus) {
                  _deleteDigit(i);
                }
              }
            },
            child: Semantics(
              label: "Digito ${i + 1} do token de validação",
              child: Container(
                width: widget.fieldWidth ?? 58.wsp,
                height: 88.hsp,
                margin: EdgeInsets.symmetric(horizontal: 6.wsp),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        color: widget.errorInput
                            ? ColorPalette.colorDanger500
                            : _pinFieldControllers[i].text.isNotEmpty
                                ? ColorPalette.colorPrimary500
                                : ColorPalette.colorSecondary400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    enabled: true,
                    controller: _pinFieldControllers[i],
                    focusNode: _pinFieldFocusNodes[i],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: NORMAL_FONT_FAMILY,
                        fontSize: 32.0.hsp,
                        color: !widget.enabled
                            ? ColorPalette.colorNeutral400
                            : widget.errorInput
                                ? ColorPalette.colorDanger500
                                : ColorPalette.colorPrimary500,
                        fontWeight: FontWeight.w700,
                        height: 1.5),
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty && i < 5) {
                        FocusScope.of(context).requestFocus(_pinFieldFocusNodes[i + 1]);
                      }
                      _onPinChanged();
                      widget.onChanged(_pin);
                    },
                    cursorColor: ColorPalette.colorSecondary400,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    autofocus: i == 0,
                    autocorrect: false,
                    enableSuggestions: false,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
