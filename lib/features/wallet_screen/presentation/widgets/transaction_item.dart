// part of '../transactions_history_page.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/block_datetime_w.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.object,
    // this.colorFromSecondary = false,
    // this.colorToSecondary = false,
    super.key,
  });

  final TransferHistoryUI object;
  // final bool colorFromSecondary;
  // final bool colorToSecondary;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        _TransactionAmount(
          object.amount,
          object.symbols,
          // object.autoGeneratedObject.value!.toInt().toString(),
        ),
        const SizedBoxH8(),
        _ShortAddress(
          prefix: 'From:',
          address: object.fromAddress,
          colorSecondary: object.isFrom,
        ),
        const SizedBoxH4(),
        _ShortAddress(
          prefix: 'To:',
          address: object.toAddress,
          colorSecondary: !object.isFrom,
        ),
        const SizedBoxH8(),
        BlockDateTimeW(
          object.blockDateTime,
          // object.autoGeneratedObject.blockDatetime!),
        ),
      ],
    );
  }
}

class _TransactionAmount extends StatelessWidget {
  const _TransactionAmount(this.amount, this.symbols);

  final String amount;
  final String symbols;
  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final moneyStr = BalanceUtils.balance(
      amount,
      appService.networkStateData.safeDecimals,
    );
    return D3pBodyLargeText(
      '$moneyStr $symbols',
    );
  }
}

class _ShortAddress extends StatelessWidget {
  const _ShortAddress({
    required this.prefix,
    required this.address,
    required this.colorSecondary,
  });

  final String? address;
  final String prefix;
  final bool colorSecondary;

  @override
  Widget build(final BuildContext context) {
    final addressStr = Fmt.shorterAddress(address, pad: 10);
    final styles = Theme.of(context).customTextStyles;
    return Row(
      children: [
        Flexible(
          child: Text(
            '$prefix $addressStr',
            style: colorSecondary ? styles.secondaryText : styles.d3pBodyMedium,
          ),
        ),
        colorSecondary ? const SizedBox() : _CopyButton(address),
      ],
    );
  }
}

class _CopyButton extends StatelessWidget {
  const _CopyButton(this.address);

  final String? address;

  void onPressed(final BuildContext context) {
    copyAndNotify(textToCopy: address ?? '');
  }

  @override
  Widget build(final BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: const BoxConstraints(),
      splashRadius: 25,
      onPressed: () => onPressed(context),
      icon: const Icon(
        Icons.copy,
        size: 20,
      ),
    );
  }
}

class NoTransferItemsFound extends StatelessWidget {
  const NoTransferItemsFound({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: D3pBodyMediumText('no_transfers'),
      ),
    );
  }
}
