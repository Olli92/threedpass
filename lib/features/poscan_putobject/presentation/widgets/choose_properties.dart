import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/open_bottom_sheet.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_max_value.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_tile_text.dart';

class ChooseProperties extends StatelessWidget {
  ChooseProperties({super.key});

  final TextEditingController _maxValueController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    final colors = Theme.of(context).customColors;
    final textStyles = Theme.of(context).customTextStyles;

    // Non-fungible - 0, Share - 1
    final List<PoscanProperty> properties = [
      PoscanProperty(
        name: 'Non-fungible',
        propValue: PropValue(maxValue: BigInt.one, propIdx: 0),
      ),
      PoscanProperty(
        name: 'Share',
        propValue: PropValue(maxValue: BigInt.from(100000000), propIdx: 1),
      ),
    ];
    return BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
      builder: (final context, final state) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBoxH16(),
          const D3pBodyMediumText("Properties"),
          const SizedBoxH4(),
          properties.isEmpty
              ? const SizedBoxH16()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: properties.length,
                  itemBuilder: (final context, final index) {
                    final prop = properties.elementAt(index);
                    return D3pElevatedButton(
                      padding: const EdgeInsets.only(top: 2),
                      onPressed: () =>
                          BlocProvider.of<PoscanPutObjectCubit>(context)
                              .toggleProp(prop),
                      backgroundColor: colors.cardBackground,
                      elevation: 1,
                      childAlignment: MainAxisAlignment.start,
                      text: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            prop.name,
                            style: textStyles.d3pBodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            'Id: ' + prop.propValue.propIdx.toString(),
                            style: textStyles.d3pBodyMedium,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Max value: ' + prop.propValue.maxValue.toString(),
                            style: textStyles.d3pBodyMedium,
                          ),
                          /*
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: PropertyMaxValueInputField(
                              controller: _maxValueController,
                            ),
                          ),*/
                          const SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.check_box_outline_blank_outlined,
                            color: colors.themeOpposite,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );

    OpenBottomSheet(
      unlocalizedSubtitle: 'poscan_putobject_choose_properties',
      bottomSheetPlatform: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        builder: (final context, final state) => ListView.builder(
          shrinkWrap: true,
          itemCount: properties.length,
          itemBuilder: (final context, final index) {
            final prop = properties.elementAt(index);
            return;
          },
        ),
      ),
      buttonIconData: Icons.add,
      buttonTextChild: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
        buildWhen: (final previous, final current) =>
            previous.properties != current.properties,
        builder: (final context, final state) => Text(
          'PROPERTIES_number_plural'.plural(
            state.properties.length,
          ),
          style: textStyles.d3pBodyMedium,
        ),
      ),
    );
  }
}
/*
EnumButton(
text: null,
isChosen: state.properties.contains(prop),
onPressed: () => BlocProvider.of<PoscanPutObjectCubit>(context)
.toggleProp(prop),
child: PropertyTileText(
prop: prop,
isChosen: state.properties.contains(prop),
),
);*/
