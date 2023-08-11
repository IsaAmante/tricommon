import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoGroupLabel extends StatelessWidget {
  const TribancoGroupLabel({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 12.0),
          child: Text(label, style: TextStyle(fontSize: 20.hsp, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
