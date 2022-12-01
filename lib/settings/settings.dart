import 'package:flutter/material.dart';
import 'package:islami_c7_sun/my_theme.dart';
import 'package:islami_c7_sun/provider/my_provider.dart';
import 'package:islami_c7_sun/settings/theme_mode_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: MyThemeData.colorGold),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.colorGold),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                pro.languageCode == 'en' ? 'English' : "Arabic",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Theme',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: MyThemeData.colorGold),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeModeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.colorGold),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                'Light',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeModeBottomSheet();
        });
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }
}
