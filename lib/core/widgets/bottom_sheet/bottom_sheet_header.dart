
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  final IconData? preffixWidget;
  final VoidCallback? onPressedPreffix;
  final IconData? suffixWidget;
  final VoidCallback? onPressedSuffix;
  final String? title;
  const BottomSheetHeader({
    super.key,
    this.preffixWidget,
    this.onPressedPreffix,
    this.suffixWidget,
    this.onPressedSuffix,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            height: 48,
            child: Stack(
              children: [
                preffixWidget != null
                    ? Align(
                        alignment:Alignment.centerLeft,
                        child: IconButton(
                          onPressed: onPressedPreffix,
                          padding: const EdgeInsets.all(0),
                          icon: Icon(
                            preffixWidget!,
                          ),
                        ),
                      )
                    : const SizedBox(),
                title != null
                    ? Align(
                        alignment:preffixWidget != null? Alignment.center:Alignment.centerLeft,
                        child: Text(
                          title ?? "",
                          style: theme.textTheme.headlineSmall!.apply(
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                      )
                    : const SizedBox(),
                suffixWidget != null
                    ? Align(
                        alignment:Alignment.centerRight,
                        child: IconButton(
                          onPressed: onPressedSuffix,
                          padding: const EdgeInsets.all(0),
                          icon: Icon(
                            suffixWidget!,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}