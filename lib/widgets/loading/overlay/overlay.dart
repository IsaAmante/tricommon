import 'package:flutter/material.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/widgets/loading/circular/circular.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(width: size.width, height: size.height, color: ColorPalette.colorNeutralWhite.withOpacity(0.5), child: const Center(child: CircularLoading()));
  }
}
