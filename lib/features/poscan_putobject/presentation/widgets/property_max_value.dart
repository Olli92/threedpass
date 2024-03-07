import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class PropertyMaxValueInputField extends StatelessWidget {
  static final numericInputFormatter = NumericInputFormatter();
  final TextEditingController controller;

  const PropertyMaxValueInputField({
    required this.controller,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(width: 100, child: D3pTextFormField(
      labelText: 'max_value'.tr(),
      hintText: 'max_value'.tr(),
      keyboardType:
      const TextInputType.numberWithOptions(decimal: true),
      controller: controller,
      validator: (final input) => NumericInput(input ?? '').isValid,
      inputFormatters: [numericInputFormatter],
    ));
  }
}

class NumericInputFormatter extends MaskTextInputFormatter {
  NumericInputFormatter()
      : super(
    mask: '',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}

class NumericInput {
  final String rawInput;

  static final numericInputFormatter = NumericInputFormatter();

  NumericInput(this.rawInput);

  /// Validates the input to ensure it's a number and a multiple of 10
  String? get isValid {
    if (rawInput.isEmpty) {
      return 'textfield_not_empty'.tr(args: ['max_value'.tr()]);
    }
    final number = int.tryParse(rawInput);
    if (number != null && number % 10 == 0) {
      return null;
    } else {
      return 'max_value_multiplier'.tr();
    }
  }
}
