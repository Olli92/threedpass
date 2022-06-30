import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  void updateSettings(BuildContext context, SettingsConfig config) {
    BlocProvider.of<SettingsConfigCubit>(context).updateSettings(config);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings'),
      ),
      body: BlocBuilder<SettingsConfigCubit, SettingsConfigState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              DropdownButtonFormField<Algorithm>(
                decoration: InputDecoration(
                  label: Text('Choose Algorithm'),
                ),
                value: state.settings.algorithm,
                onChanged: (Algorithm? newValue) {
                  if (newValue != null) {
                    updateSettings(
                      context,
                      state.settings.copyWith(algorithm: newValue),
                    );
                  }
                },
                items: Algorithm.values
                    .map(
                      (e) => DropdownMenuItem<Algorithm>(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
              ),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  label: Text('Grid Size'),
                ),
                value: state.settings.gridSize,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    updateSettings(
                      context,
                      state.settings.copyWith(gridSize: newValue),
                    );
                  }
                },
                items: [6, 7, 8]
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text('${e}x$e'),
                      ),
                    )
                    .toList(),
              ),
              TextField(
                controller: TextEditingController(
                  text: BlocProvider.of<SettingsConfigCubit>(context)
                      .state
                      .settings
                      .nSections
                      .toString(),
                ),
                onChanged: (String? newValue) {
                  if (newValue != null && int.tryParse(newValue) != null) {
                    updateSettings(
                      context,
                      state.settings.copyWith(
                        nSections: int.tryParse(newValue),
                      ),
                    );
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('N Sections'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
