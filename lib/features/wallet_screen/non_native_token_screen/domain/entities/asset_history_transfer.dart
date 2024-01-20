import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_history_ui.dart';

part 'asset_history_transfer.g.dart';

@CopyWith()
class AssetHistoryTransfer extends NonNativeTokenHistoryAtomBase {
  const AssetHistoryTransfer({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.value,
    required this.targetAddress,
    required this.isFrom,
    required this.symbols,
    required this.decimals,
    required super.extrisincStatus,
    required super.blockNumber,
  });

  final String value;
  final String targetAddress;
  final bool isFrom;
  final String symbols;
  final int decimals;

  TransferHistoryUI transferHistoryUI() {
    return TransferHistoryUI(
      amount: value,
      blockDateTime: blockDatetime,
      fromAddress: authorAddress,
      direction: isFrom ? TransferDirection.from : TransferDirection.to,
      symbols: symbols,
      toAddress: targetAddress,
      extrisincStatus: extrisincStatus,
      decimals: decimals,
    );
  }

  //     TransactionItem(
  //   object: MapperTransferNonNativeTokenAtom.fromNonNativeTransfer(
  //     item: item,
  //   ),
  // ),

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.transfer;
}
