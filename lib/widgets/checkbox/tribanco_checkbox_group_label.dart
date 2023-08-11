import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class TribancoCheckboxGroupLabel extends StatelessWidget {
  const TribancoCheckboxGroupLabel({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: Text(label, style: TextStyle(fontSize: 20.hsp, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
