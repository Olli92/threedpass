// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:threedp_graphql/features/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/encode_address.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/polkawallet/utils/find_token_symbol.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_create.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_mint.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_set_meta_data.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_transfer.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/asset_history_unknown.dart';

abstract class NonNativeTokenHistoryAtomBase {
  const NonNativeTokenHistoryAtomBase({
    required this.blockDatetime,
    required this.extrinsicIdx,
    required this.authorAddress,
    required this.extrisincStatus,
    required this.blockNumber,
  });

  final DateTime blockDatetime;
  final int extrinsicIdx;
  final String authorAddress;
  final int blockNumber;
  final ExtrinsicStatus extrisincStatus;

  NonNativeTokenExtrinsicType get extrinsicType;

  NonNativeTokenHistoryAtomBase ultimateCopyWith(final ExtrinsicStatus status) {
    switch (extrinsicType) {
      case NonNativeTokenExtrinsicType.create:
        final typed = this as AssetHistoryCreate;
        return typed.copyWith(extrisincStatus: status);

      case NonNativeTokenExtrinsicType.set_metadata:
        final typed = this as AssetHistorySetMetadata;
        return typed.copyWith(extrisincStatus: status);

      case NonNativeTokenExtrinsicType.mint:
        final typed = this as AssetHistoryMint;
        return typed.copyWith(extrisincStatus: status);

      case NonNativeTokenExtrinsicType.transfer:
        final typed = this as AssetHistoryTransfer;
        return typed.copyWith(extrisincStatus: status);

      case NonNativeTokenExtrinsicType.unknown:
        final typed = this as AssetHistoryUnkown;
        return typed.copyWith(extrisincStatus: status);
    }
  }

  // ignore: long-method
  static Future<NonNativeTokenHistoryAtomBase> fromAutoGeneratedObject(
    final GGetExtrinsicsData_getExtrinsics_objects autoGeneratedObject,
    final AppService appService,
  ) async {
    // final service = appService.plugin.sdk.api.account.service;
    // final ss58Format = appService.networkStateData.ss58Format;
    // autoGeneratedObject.callArguments
    // final fromAccountId = autoGeneratedObject.cal;
    // final toAccountId = autoGeneratedObject.toMultiAddressAccountId;

    final a1 = autoGeneratedObject.callArguments;
    final a2 = jsonDecode(a1!.value) as List;

    final date = DateTime.parse(autoGeneratedObject.blockDatetime?.value ?? '');
    final extrinsicIdx = autoGeneratedObject.extrinsicIdx ?? -1;
    final authorAddress = await appService.encodeAddress(
      autoGeneratedObject.multiAddressAccountId ?? '',
    );
    final blockNumber = autoGeneratedObject.blockNumber ?? -1;

    switch (autoGeneratedObject.callName) {
      case 'create':
        return AssetHistoryCreate(
          blockDatetime: date,
          blockNumber: blockNumber,
          extrinsicIdx: extrinsicIdx,
          authorAddress: authorAddress,
          extrisincStatus: ExtrinsicStatus.loading,
        );
      case 'set_metadata':
        return AssetHistorySetMetadata(
          blockDatetime: date,
          blockNumber: blockNumber,
          extrinsicIdx: extrinsicIdx,
          authorAddress: authorAddress,
          name: a2[1]['value'].toString(),
          symbol: a2[2]['value'].toString(),
          decimals: a2[3]['value'].toString(),
          extrisincStatus: ExtrinsicStatus.loading,
        );
      case 'mint':
        return AssetHistoryMint(
          blockDatetime: date,
          blockNumber: blockNumber,
          extrinsicIdx: extrinsicIdx,
          authorAddress: authorAddress,
          value: a2[2]['value'].toString(),
          extrisincStatus: ExtrinsicStatus.loading,
        );

      case 'transfer':
      case 'transfer_keep_alive':
        final assetId = a2.first['value'].toString();
        final tokenBalanceData = appService.findTokenBalanceData(assetId);
        final safeDecimals = appService.networkStateData.safeDecimals;
        final isFrom = authorAddress == appService.keyring.current.address;

        final value = a2[2]['value'].toString();
        final targetAccountId = a2[1]['value'] as String;
        final targetAddress2 = await appService.encodeAddress(targetAccountId);

        return AssetHistoryTransfer(
          blockDatetime: date,
          blockNumber: blockNumber,
          extrinsicIdx: extrinsicIdx,
          authorAddress: authorAddress,
          value: value,
          isFrom: isFrom,
          targetAddress: targetAddress2,
          symbols: tokenBalanceData.symbol ?? '',
          decimals: tokenBalanceData.decimals ?? safeDecimals,
          extrisincStatus: ExtrinsicStatus.loading,
        );

      // break;
      default:
        return AssetHistoryUnkown(
          blockDatetime: date,
          blockNumber: blockNumber,
          extrinsicIdx: extrinsicIdx,
          authorAddress: authorAddress,
          arguments: autoGeneratedObject.callArguments?.value ?? '',
          callModule: autoGeneratedObject.callModule ?? '',
          extrisincStatus: ExtrinsicStatus.loading,
        );
      // break;
    }
  }
}

enum NonNativeTokenExtrinsicType {
  create,
  set_metadata,
  mint,
  transfer,
  unknown,
}
