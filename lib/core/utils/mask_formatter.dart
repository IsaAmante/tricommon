import 'package:tricommon/common.dart';
import 'package:flutter/services.dart';

class MaskFormatter {
  final maskCPF = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  final maskCNPJ = MaskTextInputFormatter(mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  final maskCelphone = MaskTextInputFormatter(mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

  final maskDocCountry = MaskTextInputFormatter(
    mask: "AAAAAAA-A",
  );

  final maskPhone = MaskTextInputFormatter(mask: "(##) ####-####", filter: {"#": RegExp(r'[0-9]')});

  MaskTextInputFormatter setInitialMaskPhone(String phone) {
    var initialMaskPhone = MaskTextInputFormatter(initialText: phone, mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

    return initialMaskPhone;
  }

  final maskCEP = MaskTextInputFormatter(mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

  final maskAccount = MaskTextInputFormatter(mask: "######-#", filter: {"#": RegExp(r'[0-9]')});

  final maskAgency = MaskTextInputFormatter(mask: "####", filter: {"#": RegExp(r'[0-9]')});

  final maskRG = MaskTextInputFormatter(mask: "##.###.###-#", filter: {"#": RegExp(r'[0-9]')});

  final maskRNE = MaskTextInputFormatter(mask: "#####.######/####-##", filter: {"#": RegExp(r'[0-9]')});

  final maskMonthYear = MaskTextInputFormatter(mask: "##/##", filter: {"#": RegExp(r'[0-9]')});
  final maskCardLast4Digits = MaskTextInputFormatter(mask: "####", filter: {"#": RegExp(r'[0-9]')});

  final maskLine = MaskTextInputFormatter(mask: "#####.##### #####.###### #####.###### # ###############", filter: {"#": RegExp(r'[0-9]')});
  final maskConsumptionLine = MaskTextInputFormatter(mask: "########### # ########### # ########### # ########### #", filter: {"#": RegExp(r'[0-9]')});

  static currency({void Function(num)? onChange}) {
    return TribancoCurrencyFormatter();
  }

  static percentage({String symbol = '%'}) {
    return TribancoPercentageFormatter(symbol: symbol);
  }

  static String tribancoMaskEmail({required String email}) {
    final index = email.indexOf('@');
    if (index < 4) {
      return '****${email.substring(index)}';
    }
    String masked = email.substring(0, 2);
    for (int i = 2; i < (index - 2); i++) {
      masked += '*';
    }
    masked += email.substring(index - 2);
    return masked;
  }

  static String tribancoMaskPhone({required String phone}) {
    final length = phone.length;

    if (length == 10) {
      String masked = '(';
      masked += phone.substring(0, 2);
      masked += ') ';
      for (int i = 0; i < 4; i++) {
        masked += '*';
      }
      masked += '-${phone.substring(6)}';
      return masked;
    }
    if (length == 11) {
      String masked = '(';
      masked += phone.substring(0, 2);
      masked += ') * ';
      for (int i = 0; i < 4; i++) {
        masked += '*';
      }
      masked += '-${phone.substring(7)}';
      return masked;
    }
    String masked = '';
    for (int i = 0; i < length; i++) {
      masked += '*';
    }
    return masked;
  }

  static String tribancoMaskLine({required String line}) {
    final cleanLine = line.replaceAll('.', '').replaceAll(' ', '').replaceAll('-', '');
    if (cleanLine.length == 47 && RegExp(r'^[0-9]+$').hasMatch(cleanLine)) {
      return '${cleanLine.substring(0, 5)}.${cleanLine.substring(5, 10)} ${cleanLine.substring(10, 15)}.${cleanLine.substring(15, 21)} ${cleanLine.substring(21, 26)}.${cleanLine.substring(26, 31)} ${cleanLine.substring(31, 32)} ${cleanLine.substring(32)}';
    }
    return line;
  }

  static String tribancoMaskDocument({required String document}) {
    if (document.length == 11) {
      return MaskFormatter().maskCPF.maskText(document);
    } else if (document.length == 14) {
      return MaskFormatter().maskCNPJ.maskText(document);
    }
    return document;
  }

  static String tribancoTextDivider({required String text}) {
    int halfwayIndex = text.length ~/ 2;
    int spaceIndex = text.lastIndexOf(' ', halfwayIndex);

    return '${text.substring(0, spaceIndex)}\n${text.substring(spaceIndex + 1)}';
  }

  static String tribancoMaskAccount({required String account}) {
    if (account.length >= 7) {
      return MaskFormatter().maskAccount.maskText(account);
    }
    return account;
  }

  static void updateTribancoDocumentMask({required MaskTextInputFormatter mask, required String document}) {
    if (mask.getUnmaskedText().length > 11) {
      mask.updateMask(mask: MaskFormatter().maskCNPJ.getMask());
    } else {
      mask.updateMask(mask: '${MaskFormatter().maskCPF.getMask()}###');
    }
  }

  static String tribancoMaskTypeableLine(String typeableLine) {
    if (typeableLine.startsWith('8')) {
      return MaskFormatter().maskConsumptionLine.maskText(typeableLine);
    } else {
      return MaskFormatter().maskLine.maskText(typeableLine);
    }
  }

  static String unmaskDocument(String document) => document.replaceAll(RegExp('[.\\-/]'), '');

  static String hideCPForCNPJ(String document) {
    final RegExp regExpCPF = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');
    final RegExp regExpCNPJ = RegExp(r'^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$');

    if (document.contains('*')) {
      return document;
    } else if (regExpCPF.hasMatch(document)) {
      return document.replaceRange(0, 3, '***').replaceRange(document.length - 2, document.length, '**');
    } else {
      if (regExpCNPJ.hasMatch(document)) {
        return document.replaceRange(0, 2, '**').replaceRange(document.length - 2, document.length, '**');
      }
      return document;
    }
  }

  static String branchFormat({required String? branch}) {
    if (branch == null || branch.isEmpty) {
      return '';
    }
    return branch.padLeft(4, '0');
  }

  static String accountFormat({required String? account}) {
    if (account == null || account.isEmpty) {
      return '';
    }
    if (account.length == 1) {
      return account;
    }
    return '${account.substring(0, account.length - 1)}-${account.substring(account.length - 1)}';
  }

  static String cardFinalDigits({required String? cardNumber}) {
    if (cardNumber == null || cardNumber.length < 4) {
      return cardNumber ?? '';
    }

    return cardNumber.substring(cardNumber.length - 4);
  }

  static String maskCardNumber({required String? cardNumber}) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return '**** **** **** ****';
    }

    while (cardNumber!.length < 4) {
      cardNumber = '*$cardNumber';
    }

    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  static String toBankCodeFormat(String bankCode) {
    return bankCode.padLeft(3, '0');
  }

  static void updateTypeableLineMask({required MaskTextInputFormatter mask}) {
    if (mask.getUnmaskedText().startsWith('8')) {
      mask.updateMask(mask: MaskFormatter().maskConsumptionLine.getMask());
    } else {
      mask.updateMask(mask: MaskFormatter().maskLine.getMask());
    }
  }
}

class TribancoCurrencyFormatter extends TextInputFormatter {
  final String symbol;
  final int decimalDigits;

  TribancoCurrencyFormatter({this.symbol = 'R\$ ', this.decimalDigits = 2});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var value = MoneyFormatter.toDouble(newValue.text, symbol: symbol, method: ToDoubleMethod.multiplication);
    final text = MoneyFormatter.format(value, symbol: symbol, digits: decimalDigits);
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}

class TribancoPercentageFormatter extends TextInputFormatter {
  final String symbol;
  late int symbolLength;

  TribancoPercentageFormatter({this.symbol = '%'}) {
    symbolLength = symbol.length;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (!newValue.text.contains(symbol) && oldValue.text.isNotEmpty) {
      final maxPosition = oldValue.text.length - symbolLength;
      final oldValueText = oldValue.text.substring(0, maxPosition);
      final newValueText = newValue.text.length >= maxPosition ? newValue.text.substring(0, maxPosition) : newValue.text;
      if (oldValueText != newValueText) {
        return oldValue;
      } else {
        newText = newValueText.substring(0, newValueText.length - 1);
      }
    }

    var value = PercentageFormatter.toDouble(newText, symbol: symbol);
    if (value == null) {
      return oldValue;
    }

    final text = PercentageFormatter.format(
      value,
      symbol: symbol,
      digits: 2,
    );
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length - symbolLength));
  }
}

class TribancoDocumentTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final int newValueLength = newValue.text.length;
    String newText = newValue.text;
    if (newValueLength >= 14) {
      newText = newValue.text.replaceRange(2, 2, '.').replaceRange(6, 6, '.').replaceRange(10, 10, '/').replaceRange(15, 15, '-').replaceRange(18, null, '');
    }
    if (newValueLength == 11) {
      newText = newValue.text.replaceRange(3, 3, '.').replaceRange(7, 7, '.').replaceRange(11, 11, '-');
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
