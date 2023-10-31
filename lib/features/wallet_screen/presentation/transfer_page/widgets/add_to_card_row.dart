import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/add_card_basic.dart';

class AddToCardRow extends StatelessWidget {
  const AddToCardRow({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return const SizedBox();
    // TODO Turn on when utility palett will be added
    // final transferInfoBloc = BlocProvider.of<TransferInfoBloc>(context);
    // return AddCardRowBasic(
    //   onPressed: () => transferInfoBloc.add(const AddToAddressEvent()),
    //   unlocalizedText: 'add_account_to_label',
    //   condition: (final state) =>
    //       state.screenType == TransferScreenType.one_to_many ||
    //       state.fromAddresses.length == 1,
    // );
  }
}
