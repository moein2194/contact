import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/models/modal_bottom_sheet_props.dart';
import 'package:contact/core/widgets/bottom_sheet/bottom_sheet_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppModalBottomSheet {
  static Future<T?> showSimple<T>(
      {required ModalBottomSheetProps props}) async {
    BuildContext context = AppGlobal.navKey.currentState!.context;
    ThemeData theme = Theme.of(context);
    return showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      builder: (modalContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            props.title != null
                ? BottomSheetHeader(
                    title: props.title,
                    onPressedPreffix: props.onPressedPreffix,
                    preffixWidget: props.preffixWidget,
                    onPressedSuffix: props.onPressedSuffix,
                    suffixWidget: props.suffixWidget,
                  )
                : const SizedBox(),
            props.body ?? const SizedBox(),
          ],
        );
      },
    );
  }

  static Future<T?> showCupertino<T>({required Widget child}) async {
    BuildContext context = AppGlobal.navKey.currentState!.context;
    ThemeData theme = Theme.of(context);
    return await showCupertinoModalPopup<T>(
      context: context,
      builder: (modalContext) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            color: theme.colorScheme.background,
          ),
          child: child,
        );
      },
    );
  }
}
