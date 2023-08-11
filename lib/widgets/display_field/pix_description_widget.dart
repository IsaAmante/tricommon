import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class PixDescriptionWidget extends StatelessWidget {
  final String title;
  final String? description;
  const PixDescriptionWidget({required this.title, this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return description != null && description!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: Spacing.tiny),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title).small(
                  style: TextStyle(
                    color: ColorPalette.colorNeutral500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: Spacing.tiny),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Spacing.tiny, horizontal: Spacing.xTiny),
                  decoration: BoxDecoration(
                    color: ColorPalette.colorNeutral001,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: Text(description ?? '').small(
                      style: TextStyle(
                        color: ColorPalette.colorNeutral700,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
