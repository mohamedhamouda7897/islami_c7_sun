import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_sun/my_theme.dart';

import 'aya.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayaat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (ayaat.isEmpty) {
      loadFile(args.index);
    }

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
          body: ayaat.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (c, index) {
                    return Divider(
                      color: MyThemeData.colorGold,
                      indent: 30,
                      endIndent: 30,
                    );
                  },
                  itemCount: ayaat.length,
                  itemBuilder: (c, index) {
                    return AyaItem(ayaat[index]);
                  }),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    print(lines);
    ayaat = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  // data class : Model
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
