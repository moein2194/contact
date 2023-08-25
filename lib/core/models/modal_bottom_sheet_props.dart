
import 'package:flutter/material.dart';

class ModalBottomSheetProps {
  final Widget? body;
  final IconData? preffixWidget;
  final VoidCallback? onPressedPreffix;
  final IconData? suffixWidget;
  final VoidCallback? onPressedSuffix;
  final String? title;

  /// 0.5 of height
  final double minChildSize;

  /// 0.95 of height
  final double maxChildSize;

  /// 0.7 of height
  final double initialChildSize;

  final Widget? footer;

  ModalBottomSheetProps({
    this.body,
    this.preffixWidget,
    this.onPressedPreffix,
    this.suffixWidget,
    this.onPressedSuffix,
    this.title,
    this.initialChildSize = 0.25,
    this.minChildSize = 0.25,
    this.maxChildSize = 0.95,
    this.footer,
  });
}
