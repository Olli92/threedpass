import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pIconButton extends StatelessWidget {
  const D3pIconButton({
    required this.iconData,
    this.onPressed,
    this.iconColor,
    this.size,
    super.key,
  });

  const D3pIconButton.fake({
    super.key,
  })  : iconData = Icons.abc,
        size = null,
        iconColor = Colors.transparent,
        onPressed = null;

  final IconData iconData;
  final Color? iconColor;
  final void Function()? onPressed;
  final double? size;

  @override
  Widget build(final BuildContext context) {
    return PlatformIconButton(
      icon: Icon(
        iconData,
        size: size,
        color: iconColor,
      ),
      onPressed: onPressed,
      material: (_, __) => MaterialIconButtonData(padding: EdgeInsets.zero),
    );
  }
}
