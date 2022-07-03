import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/router/router.dart';

class OpenExplorerButton extends StatelessWidget {
  const OpenExplorerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: AppButtonStyles.primaryButton,
      icon: const Icon(Icons.explore),
      label: const Text('Open explorer'),
      onPressed: () => context.router.push(
        ExplorerRoute(initialUrl: 'https://explorer.3dpass.org/'),
      ),
    );
  }
}
