import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tricommon/common.dart';

enum DropdownWidgetType { select, multiselect }

class DropdownItem {
  final String title;
  final String? text;
  final String Function()? toLabel;
  final String? formattedTitle;

  DropdownItem(
    this.title,
    this.text, {
    this.toLabel,
    this.formattedTitle,
  });

  String getTitle() => formattedTitle ?? title;

  @override
  String toString() {
    if (toLabel != null) {
      return toLabel!();
    }
    return title;
  }
}

class DropdownWidgetTribanco extends StatefulWidget {
  const DropdownWidgetTribanco({
    Key? key,
    required this.title,
    this.selectorTitle,
    this.enable,
    this.prefixIconLabel,
    this.textEditingController,
    this.keyboardType,
    this.mask,
    this.validatorKey,
    this.validatorTextError,
    this.autovalidateMode,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.passwordInput,
    this.initialValue,
    required this.listItem,
    this.titleSearch,
    required this.type,
  }) : super(key: key);

  final String title;
  final String? selectorTitle;
  final String? titleSearch;
  final List<DropdownItem> listItem;
  final DropdownWidgetType type;
  final bool? enable;
  final IconData? prefixIconLabel;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? mask;
  final GlobalKey<FormState>? validatorKey;
  final String? validatorTextError;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final bool? passwordInput;
  final String? initialValue;

  @override
  State<DropdownWidgetTribanco> createState() => _DropdownWidgetTribancoState();
}

class _DropdownWidgetTribancoState extends State<DropdownWidgetTribanco> {
  final _node = FocusNode();

  bool isSelect = false;
  bool validatorController = true;

  late Color fillColor;
  late Color underlineColor;
  late Color textColor;
  late Color itemColor;
  late Color itemTextColor;

  String valueSelect = '';
  List<String> valuesSelect = [];
  List<DropdownItem> filteredItems = [];
  late TextEditingController _singleController;

  @override
  void initState() {
    fillColor = _checkFillColor(validatorController, _node);
    underlineColor = _checkUnderlineColor(validatorController, _node);
    textColor = _checkTextColor(validatorController, _node);
    filteredItems = List.from(widget.listItem);

    valueSelect = widget.initialValue ?? '';
    _singleController = widget.textEditingController ?? TextEditingController(text: valueSelect);

    _node.addListener(() {
      setState(() {
        fillColor = _checkFillColor(validatorController, _node);
        underlineColor = _checkUnderlineColor(validatorController, _node);
        textColor = _checkTextColor(validatorController, _node);
      });

      if (!_node.hasFocus) {
        if (widget.validator != null) {
          if (widget.validatorKey!.currentState!.validate()) {
            setState(() {
              validatorController = true;
            });
          } else {
            setState(() {
              validatorController = false;
            });
          }
        }

        setState(() {
          fillColor = _checkFillColor(validatorController, _node);
          underlineColor = _checkUnderlineColor(validatorController, _node);
          textColor = _checkTextColor(validatorController, _node);
        });

        widget.onEditingComplete?.call();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).textScaleFactor > 1 ? 76.hsp : 56.hsp,
        child: Column(
          children: [if (widget.type == DropdownWidgetType.select) selectDrawer() else multiselectDrawer()],
        ));
  }

  Widget multiselectDrawer() {
    return Expanded(
        child: TextFormField(
            controller: TextEditingController(text: '${valuesSelect.length} itens selecionados'),
            readOnly: true,
            autovalidateMode: widget.autovalidateMode,
            validator: widget.validator,
            enabled: widget.enable ?? true,
            inputFormatters: widget.mask,
            focusNode: _node,
            style: TextStyle(
              color: ColorPalette.colorNeutral900,
              fontSize: 16.hsp,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                backgroundColor: ColorPalette.colorSecondary200,
                color: ColorPalette.colorSecondary900,
              ),
              suffixIcon: Icon(Icons.expand_more, color: textColor, size: 20.wsp),
              label: Row(
                children: [
                  if (widget.prefixIconLabel != null)
                    Row(
                      children: [
                        Icon(
                          widget.prefixIconLabel,
                          color: textColor,
                          size: 20.wsp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.wsp),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16.hsp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (widget.prefixIconLabel == null)
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.hsp,
                      ),
                    ),
                ],
              ),
              labelStyle: TextStyle(color: ColorPalette.colorPrimary400, fontSize: 16.hsp),
              filled: true,
              fillColor: widget.enable == false ? ColorPalette.colorNeutral050 : fillColor,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
              ),
              border: const UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.wsp,
                vertical: 12.hsp,
              ),
              errorText: widget.validatorTextError,
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
              ),
            ),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(builder: (BuildContext context, StateSetter mystate2) {
                    return Container(
                      height: calcHeight(filteredItems.length),
                      color: ColorPalette.colorNeutralWhite,
                      child: Padding(
                        padding: EdgeInsets.all(24.wsp),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: ColorPalette.colorNeutral800,
                                    size: 22.wsp,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                            if (widget.titleSearch != null)
                              Padding(
                                padding: EdgeInsets.only(bottom: 24.wsp),
                                child: TextFieldTribanco(
                                  suffixIcon: Icons.search,
                                  title: widget.titleSearch!,
                                  size: TextfieldSize.large,
                                  onChanged: (String value) {
                                    _applyFilter(value, mystate2);
                                  },
                                ),
                              )
                            else
                              Container(),
                            if (filteredItems.isNotEmpty)
                              for (var i = 0; i < filteredItems.length; i++)
                                GestureDetector(
                                  child: itemSelect(filteredItems[i]),
                                  onTap: () {
                                    mystate2(() {
                                      isSelect = !isSelect;

                                      if (valuesSelect.contains(filteredItems[i].title)) {
                                        valuesSelect.remove(filteredItems[i].title);
                                      } else {
                                        valuesSelect.add(filteredItems[i].title);
                                      }
                                    });
                                  },
                                )
                          ],
                        ),
                      ),
                    );
                  });
                },
              );
            }));
  }

  Widget selectDrawer() {
    return Expanded(
      child: TextFormField(
        controller: _singleController,
        readOnly: true,
        autovalidateMode: widget.autovalidateMode,
        validator: widget.validator,
        enabled: widget.enable ?? true,
        inputFormatters: widget.mask,
        focusNode: _node,
        style: TextStyle(
          color: ColorPalette.colorNeutral900,
          fontSize: 14.hsp,
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.expand_more, color: textColor, size: 20.wsp),
          label: Row(
            children: [
              if (widget.prefixIconLabel != null)
                Row(
                  children: [
                    Icon(
                      widget.prefixIconLabel,
                      color: textColor,
                      size: 20.wsp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.wsp),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14.hsp,
                        ),
                      ),
                    ),
                  ],
                ),
              if (widget.prefixIconLabel == null)
                Text(
                  widget.title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14.hsp,
                  ),
                ),
            ],
          ),
          labelStyle: TextStyle(color: ColorPalette.colorPrimary400, fontSize: 16.hsp),
          filled: true,
          fillColor: widget.enable == false ? ColorPalette.colorNeutral050 : fillColor,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
          border: const UnderlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.wsp,
            vertical: 12.hsp,
          ),
          errorText: widget.validatorTextError,
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
        ),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            enableDrag: true,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
                return Container(
                  color: ColorPalette.colorNeutralWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.xSmall),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: widget.selectorTitle != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                          children: [
                            if (widget.selectorTitle != null)
                              Text(widget.selectorTitle!).medium(
                                style: TextStyle(
                                  color: ColorPalette.colorNeutral600,
                                ),
                              ),
                            GestureDetector(
                              child: Icon(
                                TribancoIcons.x,
                                color: ColorPalette.colorNeutral800,
                                size: 12.wsp,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: Spacing.small),
                        if (widget.titleSearch != null)
                          Padding(
                              padding: EdgeInsets.only(bottom: 24.hsp),
                              child: TextFieldTribanco(
                                suffixIcon: Icons.search,
                                title: widget.titleSearch ?? 'Label text',
                                size: TextfieldSize.large,
                                onChanged: (String value) {
                                  _applyFilter(value, mystate);
                                },
                              ))
                        else
                          Container(),
                        Expanded(
                          child: ListView(
                            children: [
                              if (filteredItems.isNotEmpty)
                                for (var i = 0; i < filteredItems.length; i++)
                                  GestureDetector(
                                    child: itemSelect(filteredItems[i]),
                                    onTap: () {
                                      mystate(() {
                                        isSelect = !isSelect;
                                        valueSelect = '';
                                        valueSelect = filteredItems[i].title;
                                        _singleController.text = filteredItems[i].toString();
                                        if (widget.onChanged != null) {
                                          widget.onChanged!(valueSelect);
                                        }
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }

  Widget itemSelect(DropdownItem value) {
    return Column(
      children: [
        Container(
          color: _checkItemColor(value.title),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.wsp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spacing.small),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(value.getTitle()).small(
                          style: TextStyle(
                            color: ColorPalette.colorPrimary500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (value.text != null)
                          Text(value.text!).xSmall(
                            style: TextStyle(
                              color: _getTextColor(value.title),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (valueSelect == value.title || valuesSelect.contains(value.title))
                  Icon(
                    Icons.check,
                    color: _checkItemTextColor(value.title),
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
        Divider(
          color: ColorPalette.colorNeutral200,
          height: 1,
        )
      ],
    );
  }

  Color _checkFillColor(bool validatorController, FocusNode focus) {
    if (focus.hasFocus && validatorController) {
      return ColorPalette.colorSecondary100;
    } else if (validatorController && !focus.hasFocus) {
      return ColorPalette.colorSecondary050;
    } else {
      return ColorPalette.colorSecondary050;
    }
  }

  Color _checkUnderlineColor(bool validatorController, FocusNode focus) {
    if (focus.hasFocus && validatorController) {
      return ColorPalette.colorPrimary400;
    } else if (validatorController && !focus.hasFocus) {
      return ColorPalette.colorSecondary300;
    } else {
      return ColorPalette.colorDanger300;
    }
  }

  Color _checkTextColor(bool validatorController, FocusNode focus) {
    if (focus.hasFocus && validatorController) {
      return ColorPalette.colorPrimary400;
    } else if (validatorController && !focus.hasFocus) {
      return ColorPalette.colorNeutral600;
    } else {
      return ColorPalette.colorDanger500;
    }
  }

  double calcHeight(int value) {
    return (value * 56.hsp) + 140.hsp;
  }

  Color _checkItemColor(String value) {
    if (value == valueSelect || valuesSelect.contains(value)) {
      return ColorPalette.colorSecondary050;
    } else {
      return ColorPalette.colorNeutralWhite;
    }
  }

  Color _checkItemTextColor(String value) {
    if (value == valueSelect || valuesSelect.contains(value)) {
      return ColorPalette.colorPrimary500;
    } else {
      return ColorPalette.colorNeutral800;
    }
  }

  Color _getTextColor(String value) {
    if (value == valueSelect || valuesSelect.contains(value)) {
      return ColorPalette.colorPrimary300;
    } else {
      return ColorPalette.colorNeutral600;
    }
  }

  void _applyFilter(String value, StateSetter state) {
    state.call(() {
      if (value.isEmpty) {
        filteredItems.clear();
        filteredItems = List.from(widget.listItem);
      } else {
        filteredItems.clear();
        for (var element in widget.listItem) {
          if (element.title.toLowerCase().contains(value.toLowerCase())) {
            filteredItems.add(element);
          }
        }
      }
    });
  }
}
