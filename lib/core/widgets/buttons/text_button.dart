import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

class D3pTextButton extends StatelessWidget {
  const D3pTextButton({
    required this.text,
    final Key? key,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.textColor,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  final void Function()? onPressed;
  final double? height;
  final EdgeInsets? padding;
  final String text;
  final Color? textColor;
  final double? width;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: PlatformTextButton(
          onPressed: onPressed,
          material: (final _, final __) => MaterialTextButtonData(
            style: TextButton.styleFrom(
              foregroundColor:
                  textColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
          cupertino: (final _, final __) => CupertinoTextButtonData(),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (icon != null)
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(icon),
                ),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? D3pThemeData.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
