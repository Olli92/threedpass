import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

class PixelRatioSlider extends StatefulWidget {
  const PixelRatioSlider({final Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PixelRatioSlider> {
  static const maxValue = 1.0;
  static const minValue = 0.4;

  late double value;

  @override
  void initState() {
    super.initState();
    final previewSettings =
        BlocProvider.of<SettingsConfigCubit>(context).state.previewSettings;
    value = previewSettings.pixelRatio;
  }

  Future<void> _onFieldChanged(
    final BuildContext context,
    final ScanSettings settings,
    final double? newValue,
  ) async {
    setState(() {
      if (newValue != null) {
        value = newValue;
        final cubit = BlocProvider.of<SettingsConfigCubit>(context);
        final newPreviewConfig =
            cubit.state.previewSettings.copyWith(pixelRatio: newValue);
        final newState =
            cubit.state.copyWith(previewSettings: newPreviewConfig);
        cubit.updateSettings(newState);
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings;

    final textStyles = Theme.of(context).customTextStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'preview_settings_pixel_ratio_label'.tr(),
          style: textStyles.dp3BodySmall,
        ),
        Row(
          children: [
            Text(
              '$minValue',
              style: textStyles.dp3BodySmall,
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                child: PlatformSlider(
                  value: value,
                  min: minValue,
                  max: maxValue,
                  divisions: 5,
                  onChanged: (final double? newValue) =>
                      _onFieldChanged(context, settings, newValue),
                ),
              ),
            ),
            Text(
              '$maxValue',
              style: textStyles.dp3BodySmall,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
          child: Text(
            'pixel_ratio_help_text'.tr(),
            style: textStyles.dp3BodySmall,
          ),
        ),
      ],
    );
  }
}
