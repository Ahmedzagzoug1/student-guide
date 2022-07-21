import 'package:flutter/material.dart';
import 'package:student_guide/control/settings_providers.dart';
import 'package:student_guide/views/widgets/dropdown_option.dart';
import 'package:student_guide/views/widgets/settings_label.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingsLabel(
              /*AppLocalizations.of(context)!.language_label*/ 'Language'),
          DropdownStyle(
            opt1: 'English',
            opt2: 'عربي',
            value1: 'en',
            value2: 'ar',
            selectedValue: Provider.of<SettingsProvider>(context).local,
            onChanged: (locale) {
              Provider.of<SettingsProvider>(context, listen: false)
                  .changeLocal(locale);
            },
          ),
          SettingsLabel(/*AppLocalizations.of(context)!.mode_label*/ 'Mode'),
          DropdownStyle(
            opt1: /*AppLocalizations.of(context)!.light_mode,*/ 'light ',
            opt2: /*AppLocalizations.of(context)!.dark_mode,*/ 'dark ',
            value1: ThemeMode.light,
            value2: ThemeMode.dark,
            selectedValue: Provider.of<SettingsProvider>(context).mode,
            onChanged: (mode) {
              Provider.of<SettingsProvider>(context, listen: false)
                  .changeMode(mode);
            },
          ),
        ],
      ),
    );
  }
}
