import 'package:flutter/material.dart';

class TribancoInkWell extends StatelessWidget {
  const TribancoInkWell({
    super.key,
    this.semanticsLabel,
    this.excludeSemantics = false,
    this.tooltip,
    this.onTap,
    this.child,
    this.enabled = true,
  });

  final String? semanticsLabel;
  final bool excludeSemantics;
  final String? tooltip;
  final VoidCallback? onTap;
  final Widget? child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: Semantics(
        button: true,
        tooltip: tooltip,
        label: semanticsLabel,
        excludeSemantics: excludeSemantics,
        enabled: enabled,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
