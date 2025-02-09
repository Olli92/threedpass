import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_account.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_approvals.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_category.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_file.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_hashes.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_properties.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/putobject_submit_button.dart';

@RoutePage()
class D3PRPCPage extends StatelessWidget {
  const D3PRPCPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'upload_to_3d_rpc_title',
      body: SingleChildScrollView(
        child: Padding16(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChooseFile(),
              const ChooseAccount(),
              const ChooseCategory(),
              const ChooseApprovals(),
              const ChooseHashes(),
              ChooseProperties(),
              const PutObjectSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
