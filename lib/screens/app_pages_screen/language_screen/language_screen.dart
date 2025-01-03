import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../languages/language_change.dart';
import '../../../plugin_list.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/direction_page.dart';
import 'layout/language_sublayout.dart';
class LanguageLayout extends StatelessWidget {
  const LanguageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context1, languageCtrl, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: Column(children: [
                // language page app bar
                CommonAppBar(
                        isIcon: true,
                        appName: language(context, appFonts.language),
                        onPressed: () => route.pop(context))
                    .paddingSymmetric(
                        horizontal: Insets.i20, vertical: Insets.i10),
                //language list layout
                Column(
                        children:
                            appArray.languageList.asMap().entries.map((e) {
                  return LanguageSubLayout(
                    index: e.key,
                    data: e.value,
                  ).inkWell(onTap: () {
                    languageCtrl.changeLocale(e.value['title'].toString());
                  });
                }).toList())
                    .paddingSymmetric(horizontal: Insets.i20)
              ]))));
    });
  }
}
