import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RenameSnapshotButton extends StatelessWidget {
  const RenameSnapshotButton({required this.state, super.key});

  final PreviewPageCubitState state;

  @override
  Widget build(final BuildContext context) {
    if (state.psType == PreviewSnapshotType.existingSnapshot) {
      return DefaultSettingsButton.openButton(
        iconData: Icons.abc_rounded,
        iconColor: Colors.white,
        textValue: '',
        onPressed: () => context.router.push(
          RenameSnapshotRoute(
            snapshot: state.snapshot,
            hashObject: state.hashObject!,
          ),
        ),
        text: 'rename_this_snapshot_button_label',
        cardShape: CardShape.top,
      );
    } else {
      return const SizedBox();
    }
  }
}
