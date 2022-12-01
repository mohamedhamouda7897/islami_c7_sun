import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_sun/my_theme.dart';
import 'package:islami_c7_sun/provider/sura_provider.dart';
import 'package:provider/provider.dart';

import 'aya.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura_Details';

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    return ChangeNotifierProvider(
      create: (context) => SuraProvider()..loadFile(args.index),
      builder: (context, child) {
        var provider = Provider.of<SuraProvider>(context);

        return Stack(
          children: [
            Image.asset(
              'assets/images/main_background.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(
                  args.suraName,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              body: provider.ayaat.length == 0
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          border: Border.all(
                              color: MyThemeData.colorGold, width: 2),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      child: ListView.separated(
                          separatorBuilder: (c, index) {
                            return Divider(
                              color: MyThemeData.colorGold,
                              indent: 30,
                              endIndent: 30,
                            );
                          },
                          itemCount: provider.ayaat.length,
                          itemBuilder: (c, index) {
                            return AyaItem(provider.ayaat[index]);
                          }),
                    ),
            )
          ],
        );
      },
    );
  }
}

class SuraDetailsArgs {
  // data class : Model
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
