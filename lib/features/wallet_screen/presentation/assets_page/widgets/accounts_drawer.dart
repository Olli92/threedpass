import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';

class AccountsDrawer extends Drawer {
  AccountsDrawer({
    required final List<KeyPairData> accounts,
    required final KeyPairData current,
    required final AppServiceLoaderCubit appServiceCubit,
    required final BuildContext context,
    final Key? key,
  }) : super(
          key: key,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              PlatformAppBar(
                leading: const SizedBox(),
                title: Text(
                  'choose_account_assets_page_drawer'.tr(),
                ),
                material: (final _, final __) => MaterialAppBarData(
                  backgroundColor: Colors.black,
                  foregroundColor: Theme.of(context).canvasColor,
                ),
              ),
              const SizedBox(height: 4),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                text: 'create_account_button_label'.tr(),
                onPressed: () =>
                    CreateAccountWrapper.pushToGenerateRandom(context),
              ),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                text: 'import_account_button_label'.tr(),
                onPressed: () => CreateAccountWrapper.pushToImportType(context),
              ),
              const Divider(),
              ...List.generate(
                accounts.length,
                (final index) => ListTileButton.usual(
                  text: accounts[index].name ?? 'Anonymous',
                  onPressed: accounts[index].address == current.address
                      ? null
                      : () {
                          appServiceCubit.changeAccount(accounts[index]);
                          Navigator.of(context).pop();
                        },
                  backgroundColor: Theme.of(context).canvasColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ],
          ),
        );
}
