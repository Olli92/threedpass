import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot_create_from_file/file_copy.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot_create_from_file/file_picker.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot_create_from_file/snapshot_create_from_file.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class GetObjectFromFileFloatingButton extends StatelessWidget {
  const GetObjectFromFileFloatingButton({final Key? key}) : super(key: key);

  void showToast(final String text, final BuildContext context) {
    Fluttertoast.showToast(msg: text);
  }

  // void showLoader(final BuildContext context) {
  //   final homeContext = BlocProvider.of<HomeContextCubit>(context);

  //   // homeContext.router.push(
  //   //   const CalcHashLoadingDialogRoute(),
  //   // );
  //   unawaited(
  //     homeContext.showDialogC(
  //       (final __) => const CalcHashLoadingDialog(),
  //     ),
  //   );
  // }

  // void hideLoader(final BuildContext context) {
  //   final homeContext = BlocProvider.of<HomeContextCubit>(context);
  //   // homeContext.state.context.router.pop();
  //   homeContext.hideDialogC();
  // }

  /// Calc object
  Future<void> createHashFromFile(
    final BuildContext context,
  ) async {
    final isolateCubit = BlocProvider.of<ScanIsolateCubit>(context);
    final hashesListBloc = BlocProvider.of<HashesListBloc>(context);
    final snapFactory = SnapshotFileFactory(
      // showLoader: () => showLoader(context),
      hashesListBloc: BlocProvider.of<HashesListBloc>(context),
      scanSettings:
          BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings,
      // objectsDirectory: getIt<ObjectsDirectory>(),
      scanIsolateCubit: BlocProvider.of<ScanIsolateCubit>(context),
      // recievePort: recievePort,
    );
    // TODO Do return with enum of possible situations instead of random try-catches
    try {
      final objectsDirectory = getIt<ObjectsDirectory>();
      final pickedFilePath = await FilePickerShortCut().pickFile();

      // showLoader(context);

      final relativePath =
          await FileCopy(objectsDirectory).write(pickedFilePath);

      final pair = await snapFactory.createSnapshotFromFile(
        relativePath: relativePath,
        pickedFilePath: pickedFilePath,
      );

      // hideLoader(context);
      isolateCubit.setNull();

      if (pair.left == null) {
        // Create new object
        final newObj = HashObject(
          name: 'Object ${pair.right.fileHash}',
          snapshots: [
            pair.right,
          ],
        );
        hashesListBloc.add(AddObject(object: newObj));
      } else {
        // Add snapshot
        hashesListBloc.add(SaveSnapshot(hash: pair.right, object: pair.left!));
      }

      // BlocProvider.of<HashesListBloc>(context).add(
      //   AddObject(HashObject.fromSnapshot(pair.right)),
      //   // SaveSnapshot(
      //   //   object: pair.left,
      //   //   hash: pair.right,
      //   // ),
      // );

      // unawaited(
      //   context.router.push(
      //     PreviewRouteWrapper(
      //       hashObject: pair.left,
      //       snapshot: pair.right,
      //       createNewAnyway: true,
      //     ),
      //   ),
      // );
    } on FilePickerException catch (e) {
      showToast(e.message, context);
      getIt<Logger>().e('Caught FilePickerException: $e');
    } on Exception catch (e) {
      getIt<Logger>().e('Caught Exception during file scan: $e');

      if (e.toString().contains(ScanIsolateCubit.cancelMsg)) {
        showToast('Scanning canceled by user.', context);
        // hideLoader(context);
      } else {
        showToast('Error during file pick. $e', context);
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      heroTag: 'get_object_from_file',
      child: const Icon(Icons.folder_open_rounded),
      onPressed: () => createHashFromFile(
        context,
      ),
    );
  }
}
