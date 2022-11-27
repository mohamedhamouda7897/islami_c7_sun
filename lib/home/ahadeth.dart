import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_sun/hadeth_details/hadeth_details.dart';
import 'package:islami_c7_sun/my_theme.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethData> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) loadHadethFile();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/ahadeth_main_bg.png'),
        Divider(
          color: MyThemeData.colorGold,
          thickness: 3,
        ),
        Text(
          'Ahadeth',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        Divider(
          color: MyThemeData.colorGold,
          thickness: 3,
        ),
        Ahadeth.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: MyThemeData.colorGold,
                        ),
                    itemCount: Ahadeth.length,
                    itemBuilder: (c, iindex) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HadethDetails.routeName,
                              arguments: Ahadeth[iindex]);
                        },
                        child: Text(
                          Ahadeth[iindex].title,
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
              )
      ],
    );
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#\r\n');
    // for loop
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      print(hadeth);
      print('----------------------------');
      List<String> hadethLines = hadeth.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
