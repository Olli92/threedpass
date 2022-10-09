// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;

import '../core/widgets/default_loading_dialog.dart' as _i7;
import '../core/widgets/error_page.dart' as _i4;
import '../features/accounts/presentation/pages/create_account/create_account_credentials.dart'
    as _i27;
import '../features/accounts/presentation/pages/create_account/create_account_from_object/create_account_from_object.dart'
    as _i29;
import '../features/accounts/presentation/pages/create_account/create_account_info_page.dart'
    as _i24;
import '../features/accounts/presentation/pages/create_account/create_account_loader.dart'
    as _i28;
import '../features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart'
    as _i25;
import '../features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart'
    as _i26;
import '../features/accounts/presentation/pages/create_account/create_account_type.dart'
    as _i23;
import '../features/accounts/presentation/pages/create_account/create_account_wrapper.dart'
    as _i5;
import '../features/accounts/presentation/pages/create_account/import_account_create_page.dart'
    as _i31;
import '../features/accounts/presentation/pages/create_account/import_mnemonic_form.dart'
    as _i30;
import '../features/compare_page/presentation/pages/compare_page_wrapper.dart'
    as _i18;
import '../features/hashes_list/domain/entities/hash_object.dart' as _i35;
import '../features/hashes_list/domain/entities/snapshot.dart' as _i36;
import '../features/home_page/presentation/home_page.dart' as _i1;
import '../features/preview_page/bloc/preview_page_cubit.dart' as _i37;
import '../features/preview_page/presentation/pages/preview_page.dart' as _i17;
import '../features/preview_page/presentation/pages/preview_page_wrapper.dart'
    as _i2;
import '../features/preview_page/presentation/widgets/rename_snapshot_dialog.dart'
    as _i22;
import '../features/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i21;
import '../features/preview_page/presentation/widgets/save_object_dialog/save_object_dialog.dart'
    as _i20;
import '../features/preview_page/presentation/widgets/save_top_hashes_dialog/save_top_hashes_dialog.dart'
    as _i19;
import '../features/scan_page/presentation/pages/scan_page.dart' as _i11;
import '../features/scan_page/presentation/pages/scan_page_wrapper.dart' as _i8;
import '../features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart'
    as _i6;
import '../features/settings_page/presentation/pages/settings_page.dart'
    as _i10;
import '../features/wallet_screen/presentation/assets_page/remove_account_dialog.dart'
    as _i15;
import '../features/wallet_screen/presentation/recieve_page/recieve_page.dart'
    as _i14;
import '../features/wallet_screen/presentation/transfer_page/transfer_page.dart'
    as _i16;
import '../features/wallet_screen/presentation/transfer_page/transfer_page_wrapper.dart'
    as _i13;
import '../features/wallet_screen/presentation/wallet_page/wallet_page.dart'
    as _i12;
import '../features/wallet_screen/presentation/wallet_page/wallet_page_wrapper.dart'
    as _i9;
import '../features/web_wallet/presentation/pages/web_wallet_page.dart' as _i3;
import 'router.dart' as _i34;

class AppRouter extends _i32.RootStackRouter {
  AppRouter([_i33.GlobalKey<_i33.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PreviewWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewWrapperRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.PreviewPageWrapper(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot,
              createNewAnyway: args.createNewAnyway));
    },
    WebWalletRoute.name: (routeData) {
      final args = routeData.argsAs<WebWalletRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.WebWalletPage(key: args.key, initialUrl: args.initialUrl));
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ErrorPage(key: args.key, error: args.error));
    },
    CreateAccountWrapperRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CreateAccountWrapper());
    },
    CalcHashLoadingDialogRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.CalcHashLoadingWidget(),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    DefaultLoadingDialogRoute.name: (routeData) {
      final args = routeData.argsAs<DefaultLoadingDialogRouteArgs>(
          orElse: () => const DefaultLoadingDialogRouteArgs());
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.DefaultLoadingDialog(key: args.key, text: args.text),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ScanWrapperRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ScanPageWrapper());
    },
    WalletWrapperRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.WalletPageWrapper());
    },
    SettingsRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SettingsPage());
    },
    ScanRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ScanPage());
    },
    WalletRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.WalletPage());
    },
    TransferWrapperRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.TransferPageWrapper());
    },
    RecieveRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.RecievePage());
    },
    RemoveAccountDialogRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i15.RemoveAccountDialog(),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    TransferRoute.name: (routeData) {
      final args = routeData.argsAs<TransferRouteArgs>(
          orElse: () => const TransferRouteArgs());
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.TransferPage(key: args.key));
    },
    PreviewRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.PreviewPage());
    },
    CompareWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CompareWrapperRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.ComparePageWrapper(
              key: args.key,
              origObj: args.origObj,
              hashObject: args.hashObject));
    },
    SaveTopHashesDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveTopHashesDialogRouteArgs>();
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: _i19.SaveTopHashesDialog(
              key: args.key, pageCubitState: args.pageCubitState),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveObjectDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectDialogRouteArgs>();
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: _i20.SaveObjectDialog(key: args.key, snapshot: args.snapshot),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveHashDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveHashDialogRouteArgs>();
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: _i21.SaveHashDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    RenameSnapshotDialogRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotDialogRouteArgs>();
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: _i22.RenameSnapshotDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    CreateAccountTypeRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.CreateAccountType());
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.CreateAccountInfoPage());
    },
    MnemonicBackupRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i25.CreateAccountMnemonicBackup());
    },
    MnemonicConfirmRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i26.CreateAccountMnemonicConfirm());
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.CreateAccountCredentials());
    },
    CreateAccountLoaderRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i28.CreateAccountLoader(),
          customRouteBuilder: _i34.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    CreateAccountFromObjectRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i29.CreateAccountFromObject());
    },
    ImportMnemonicFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportMnemonicFormRouteArgs>(
          orElse: () => const ImportMnemonicFormRouteArgs());
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: _i30.ImportMnemonicForm(key: args.key));
    },
    ImportAccountCreateRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.ImportAccountCreatePage());
    }
  };

  @override
  List<_i32.RouteConfig> get routes => [
        _i32.RouteConfig(HomeRoute.name, path: '/', children: [
          _i32.RouteConfig(ScanWrapperRoute.name,
              path: 'scan-page-wrapper',
              parent: HomeRoute.name,
              children: [
                _i32.RouteConfig(ScanRoute.name,
                    path: '', parent: ScanWrapperRoute.name)
              ]),
          _i32.RouteConfig(WalletWrapperRoute.name,
              path: 'wallet-page-wrapper',
              parent: HomeRoute.name,
              children: [
                _i32.RouteConfig(WalletRoute.name,
                    path: '', parent: WalletWrapperRoute.name),
                _i32.RouteConfig(TransferWrapperRoute.name,
                    path: 'transfer-page-wrapper',
                    parent: WalletWrapperRoute.name,
                    children: [
                      _i32.RouteConfig(TransferRoute.name,
                          path: '', parent: TransferWrapperRoute.name)
                    ]),
                _i32.RouteConfig(RecieveRoute.name,
                    path: 'recieve-page', parent: WalletWrapperRoute.name),
                _i32.RouteConfig(RemoveAccountDialogRoute.name,
                    path: 'remove-account-dialog',
                    parent: WalletWrapperRoute.name)
              ]),
          _i32.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: HomeRoute.name)
        ]),
        _i32.RouteConfig(PreviewWrapperRoute.name,
            path: '/preview-page-wrapper',
            children: [
              _i32.RouteConfig(PreviewRoute.name,
                  path: '', parent: PreviewWrapperRoute.name),
              _i32.RouteConfig(CompareWrapperRoute.name,
                  path: 'compare-page-wrapper',
                  parent: PreviewWrapperRoute.name),
              _i32.RouteConfig(SaveTopHashesDialogRoute.name,
                  path: 'save-top-hashes-dialog',
                  parent: PreviewWrapperRoute.name),
              _i32.RouteConfig(SaveObjectDialogRoute.name,
                  path: 'save-object-dialog', parent: PreviewWrapperRoute.name),
              _i32.RouteConfig(SaveHashDialogRoute.name,
                  path: 'save-hash-dialog', parent: PreviewWrapperRoute.name),
              _i32.RouteConfig(RenameSnapshotDialogRoute.name,
                  path: 'rename-snapshot-dialog',
                  parent: PreviewWrapperRoute.name)
            ]),
        _i32.RouteConfig(WebWalletRoute.name, path: '/web-wallet-page'),
        _i32.RouteConfig(ErrorRoute.name, path: '/error-page'),
        _i32.RouteConfig(CreateAccountWrapperRoute.name,
            path: '/create-account/',
            children: [
              _i32.RouteConfig(CreateAccountTypeRoute.name,
                  path: 'choose-type', parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(CreateAccountInfoRoute.name,
                  path: 'generate-random',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(MnemonicBackupRoute.name,
                  path: 'create-account-mnemonic-backup',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(MnemonicConfirmRoute.name,
                  path: 'create-account-mnemonic-confirm',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(CreateAccountCredentialsRoute.name,
                  path: 'create-account-credentials',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(CreateAccountLoaderRoute.name,
                  path: 'create-account-loader',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(CreateAccountFromObjectRoute.name,
                  path: 'create-account-from-object',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(ImportMnemonicFormRoute.name,
                  path: 'import-mnemonic-form',
                  parent: CreateAccountWrapperRoute.name),
              _i32.RouteConfig(ImportAccountCreateRoute.name,
                  path: 'import-account-create-page',
                  parent: CreateAccountWrapperRoute.name)
            ]),
        _i32.RouteConfig(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget'),
        _i32.RouteConfig(DefaultLoadingDialogRoute.name,
            path: '/default-loading-dialog')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute({List<_i32.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.PreviewPageWrapper]
class PreviewWrapperRoute extends _i32.PageRouteInfo<PreviewWrapperRouteArgs> {
  PreviewWrapperRoute(
      {_i33.Key? key,
      required _i35.HashObject? hashObject,
      required _i36.Snapshot snapshot,
      bool createNewAnyway = false,
      List<_i32.PageRouteInfo>? children})
      : super(PreviewWrapperRoute.name,
            path: '/preview-page-wrapper',
            args: PreviewWrapperRouteArgs(
                key: key,
                hashObject: hashObject,
                snapshot: snapshot,
                createNewAnyway: createNewAnyway),
            initialChildren: children);

  static const String name = 'PreviewWrapperRoute';
}

class PreviewWrapperRouteArgs {
  const PreviewWrapperRouteArgs(
      {this.key,
      required this.hashObject,
      required this.snapshot,
      this.createNewAnyway = false});

  final _i33.Key? key;

  final _i35.HashObject? hashObject;

  final _i36.Snapshot snapshot;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewWrapperRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot, createNewAnyway: $createNewAnyway}';
  }
}

/// generated route for
/// [_i3.WebWalletPage]
class WebWalletRoute extends _i32.PageRouteInfo<WebWalletRouteArgs> {
  WebWalletRoute({_i33.Key? key, required String initialUrl})
      : super(WebWalletRoute.name,
            path: '/web-wallet-page',
            args: WebWalletRouteArgs(key: key, initialUrl: initialUrl));

  static const String name = 'WebWalletRoute';
}

class WebWalletRouteArgs {
  const WebWalletRouteArgs({this.key, required this.initialUrl});

  final _i33.Key? key;

  final String initialUrl;

  @override
  String toString() {
    return 'WebWalletRouteArgs{key: $key, initialUrl: $initialUrl}';
  }
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i32.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i33.Key? key, required Object error})
      : super(ErrorRoute.name,
            path: '/error-page', args: ErrorRouteArgs(key: key, error: error));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.error});

  final _i33.Key? key;

  final Object error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [_i5.CreateAccountWrapper]
class CreateAccountWrapperRoute extends _i32.PageRouteInfo<void> {
  const CreateAccountWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(CreateAccountWrapperRoute.name,
            path: '/create-account/', initialChildren: children);

  static const String name = 'CreateAccountWrapperRoute';
}

/// generated route for
/// [_i6.CalcHashLoadingWidget]
class CalcHashLoadingDialogRoute extends _i32.PageRouteInfo<void> {
  const CalcHashLoadingDialogRoute()
      : super(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget');

  static const String name = 'CalcHashLoadingDialogRoute';
}

/// generated route for
/// [_i7.DefaultLoadingDialog]
class DefaultLoadingDialogRoute
    extends _i32.PageRouteInfo<DefaultLoadingDialogRouteArgs> {
  DefaultLoadingDialogRoute({_i33.Key? key, String? text})
      : super(DefaultLoadingDialogRoute.name,
            path: '/default-loading-dialog',
            args: DefaultLoadingDialogRouteArgs(key: key, text: text));

  static const String name = 'DefaultLoadingDialogRoute';
}

class DefaultLoadingDialogRouteArgs {
  const DefaultLoadingDialogRouteArgs({this.key, this.text});

  final _i33.Key? key;

  final String? text;

  @override
  String toString() {
    return 'DefaultLoadingDialogRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i8.ScanPageWrapper]
class ScanWrapperRoute extends _i32.PageRouteInfo<void> {
  const ScanWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(ScanWrapperRoute.name,
            path: 'scan-page-wrapper', initialChildren: children);

  static const String name = 'ScanWrapperRoute';
}

/// generated route for
/// [_i9.WalletPageWrapper]
class WalletWrapperRoute extends _i32.PageRouteInfo<void> {
  const WalletWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(WalletWrapperRoute.name,
            path: 'wallet-page-wrapper', initialChildren: children);

  static const String name = 'WalletWrapperRoute';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i32.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i11.ScanPage]
class ScanRoute extends _i32.PageRouteInfo<void> {
  const ScanRoute() : super(ScanRoute.name, path: '');

  static const String name = 'ScanRoute';
}

/// generated route for
/// [_i12.WalletPage]
class WalletRoute extends _i32.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: '');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i13.TransferPageWrapper]
class TransferWrapperRoute extends _i32.PageRouteInfo<void> {
  const TransferWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(TransferWrapperRoute.name,
            path: 'transfer-page-wrapper', initialChildren: children);

  static const String name = 'TransferWrapperRoute';
}

/// generated route for
/// [_i14.RecievePage]
class RecieveRoute extends _i32.PageRouteInfo<void> {
  const RecieveRoute() : super(RecieveRoute.name, path: 'recieve-page');

  static const String name = 'RecieveRoute';
}

/// generated route for
/// [_i15.RemoveAccountDialog]
class RemoveAccountDialogRoute extends _i32.PageRouteInfo<void> {
  const RemoveAccountDialogRoute()
      : super(RemoveAccountDialogRoute.name, path: 'remove-account-dialog');

  static const String name = 'RemoveAccountDialogRoute';
}

/// generated route for
/// [_i16.TransferPage]
class TransferRoute extends _i32.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({_i33.Key? key})
      : super(TransferRoute.name, path: '', args: TransferRouteArgs(key: key));

  static const String name = 'TransferRoute';
}

class TransferRouteArgs {
  const TransferRouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.PreviewPage]
class PreviewRoute extends _i32.PageRouteInfo<void> {
  const PreviewRoute() : super(PreviewRoute.name, path: '');

  static const String name = 'PreviewRoute';
}

/// generated route for
/// [_i18.ComparePageWrapper]
class CompareWrapperRoute extends _i32.PageRouteInfo<CompareWrapperRouteArgs> {
  CompareWrapperRoute(
      {_i33.Key? key,
      required _i36.Snapshot origObj,
      required _i35.HashObject hashObject})
      : super(CompareWrapperRoute.name,
            path: 'compare-page-wrapper',
            args: CompareWrapperRouteArgs(
                key: key, origObj: origObj, hashObject: hashObject));

  static const String name = 'CompareWrapperRoute';
}

class CompareWrapperRouteArgs {
  const CompareWrapperRouteArgs(
      {this.key, required this.origObj, required this.hashObject});

  final _i33.Key? key;

  final _i36.Snapshot origObj;

  final _i35.HashObject hashObject;

  @override
  String toString() {
    return 'CompareWrapperRouteArgs{key: $key, origObj: $origObj, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i19.SaveTopHashesDialog]
class SaveTopHashesDialogRoute
    extends _i32.PageRouteInfo<SaveTopHashesDialogRouteArgs> {
  SaveTopHashesDialogRoute(
      {_i33.Key? key, required _i37.PreviewPageCubitState pageCubitState})
      : super(SaveTopHashesDialogRoute.name,
            path: 'save-top-hashes-dialog',
            args: SaveTopHashesDialogRouteArgs(
                key: key, pageCubitState: pageCubitState));

  static const String name = 'SaveTopHashesDialogRoute';
}

class SaveTopHashesDialogRouteArgs {
  const SaveTopHashesDialogRouteArgs({this.key, required this.pageCubitState});

  final _i33.Key? key;

  final _i37.PreviewPageCubitState pageCubitState;

  @override
  String toString() {
    return 'SaveTopHashesDialogRouteArgs{key: $key, pageCubitState: $pageCubitState}';
  }
}

/// generated route for
/// [_i20.SaveObjectDialog]
class SaveObjectDialogRoute
    extends _i32.PageRouteInfo<SaveObjectDialogRouteArgs> {
  SaveObjectDialogRoute({_i33.Key? key, required _i36.Snapshot snapshot})
      : super(SaveObjectDialogRoute.name,
            path: 'save-object-dialog',
            args: SaveObjectDialogRouteArgs(key: key, snapshot: snapshot));

  static const String name = 'SaveObjectDialogRoute';
}

class SaveObjectDialogRouteArgs {
  const SaveObjectDialogRouteArgs({this.key, required this.snapshot});

  final _i33.Key? key;

  final _i36.Snapshot snapshot;

  @override
  String toString() {
    return 'SaveObjectDialogRouteArgs{key: $key, snapshot: $snapshot}';
  }
}

/// generated route for
/// [_i21.SaveHashDialog]
class SaveHashDialogRoute extends _i32.PageRouteInfo<SaveHashDialogRouteArgs> {
  SaveHashDialogRoute(
      {_i33.Key? key,
      required _i36.Snapshot snapshot,
      required _i35.HashObject hashObject})
      : super(SaveHashDialogRoute.name,
            path: 'save-hash-dialog',
            args: SaveHashDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'SaveHashDialogRoute';
}

class SaveHashDialogRouteArgs {
  const SaveHashDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final _i33.Key? key;

  final _i36.Snapshot snapshot;

  final _i35.HashObject hashObject;

  @override
  String toString() {
    return 'SaveHashDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i22.RenameSnapshotDialog]
class RenameSnapshotDialogRoute
    extends _i32.PageRouteInfo<RenameSnapshotDialogRouteArgs> {
  RenameSnapshotDialogRoute(
      {_i33.Key? key,
      required _i36.Snapshot snapshot,
      required _i35.HashObject hashObject})
      : super(RenameSnapshotDialogRoute.name,
            path: 'rename-snapshot-dialog',
            args: RenameSnapshotDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'RenameSnapshotDialogRoute';
}

class RenameSnapshotDialogRouteArgs {
  const RenameSnapshotDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final _i33.Key? key;

  final _i36.Snapshot snapshot;

  final _i35.HashObject hashObject;

  @override
  String toString() {
    return 'RenameSnapshotDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i23.CreateAccountType]
class CreateAccountTypeRoute extends _i32.PageRouteInfo<void> {
  const CreateAccountTypeRoute()
      : super(CreateAccountTypeRoute.name, path: 'choose-type');

  static const String name = 'CreateAccountTypeRoute';
}

/// generated route for
/// [_i24.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i32.PageRouteInfo<void> {
  const CreateAccountInfoRoute()
      : super(CreateAccountInfoRoute.name, path: 'generate-random');

  static const String name = 'CreateAccountInfoRoute';
}

/// generated route for
/// [_i25.CreateAccountMnemonicBackup]
class MnemonicBackupRoute extends _i32.PageRouteInfo<void> {
  const MnemonicBackupRoute()
      : super(MnemonicBackupRoute.name, path: 'create-account-mnemonic-backup');

  static const String name = 'MnemonicBackupRoute';
}

/// generated route for
/// [_i26.CreateAccountMnemonicConfirm]
class MnemonicConfirmRoute extends _i32.PageRouteInfo<void> {
  const MnemonicConfirmRoute()
      : super(MnemonicConfirmRoute.name,
            path: 'create-account-mnemonic-confirm');

  static const String name = 'MnemonicConfirmRoute';
}

/// generated route for
/// [_i27.CreateAccountCredentials]
class CreateAccountCredentialsRoute extends _i32.PageRouteInfo<void> {
  const CreateAccountCredentialsRoute()
      : super(CreateAccountCredentialsRoute.name,
            path: 'create-account-credentials');

  static const String name = 'CreateAccountCredentialsRoute';
}

/// generated route for
/// [_i28.CreateAccountLoader]
class CreateAccountLoaderRoute extends _i32.PageRouteInfo<void> {
  const CreateAccountLoaderRoute()
      : super(CreateAccountLoaderRoute.name, path: 'create-account-loader');

  static const String name = 'CreateAccountLoaderRoute';
}

/// generated route for
/// [_i29.CreateAccountFromObject]
class CreateAccountFromObjectRoute extends _i32.PageRouteInfo<void> {
  const CreateAccountFromObjectRoute()
      : super(CreateAccountFromObjectRoute.name,
            path: 'create-account-from-object');

  static const String name = 'CreateAccountFromObjectRoute';
}

/// generated route for
/// [_i30.ImportMnemonicForm]
class ImportMnemonicFormRoute
    extends _i32.PageRouteInfo<ImportMnemonicFormRouteArgs> {
  ImportMnemonicFormRoute({_i33.Key? key})
      : super(ImportMnemonicFormRoute.name,
            path: 'import-mnemonic-form',
            args: ImportMnemonicFormRouteArgs(key: key));

  static const String name = 'ImportMnemonicFormRoute';
}

class ImportMnemonicFormRouteArgs {
  const ImportMnemonicFormRouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'ImportMnemonicFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.ImportAccountCreatePage]
class ImportAccountCreateRoute extends _i32.PageRouteInfo<void> {
  const ImportAccountCreateRoute()
      : super(ImportAccountCreateRoute.name,
            path: 'import-account-create-page');

  static const String name = 'ImportAccountCreateRoute';
}
