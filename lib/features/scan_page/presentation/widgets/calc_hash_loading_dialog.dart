import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
import 'package:threedpass/setup.dart';

class CalcHashLoadingWidget extends StatelessWidget {
  const CalcHashLoadingWidget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return PlatformAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              PlatformCircularProgressIndicator(),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text('calc_hashes_loader_text'.tr()),
                ),
              ),
            ],
          ),
          const SizedBoxH16(),
          SizedBox(
            // height: 52,
            child: BlocBuilder<ScanIsolateCubit, ScanIsolateData?>(
              buildWhen: (final previous, final current) =>
                  !(previous != null && current == null),
              builder:
                  (final BuildContext context, final ScanIsolateData? value) =>
                      D3pTextButton(
                text: 'Отмена',
                onPressed: value != null
                    ? () {
                        // value.isolate.
                        // value.isolate
                        value.port.sendPort.send(ScanIsolateCubit.cancelMsg);
                        value.isolate.removeOnExitListener(value.port.sendPort);
                        value.isolate.kill();
                        // Isolate.exit(value.port.sendPort, 'cancel');

                        getIt<Logger>().i('Stop scan');
                        BlocProvider.of<ScanIsolateCubit>(context).setNull();
                        // context.router.pop();
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
