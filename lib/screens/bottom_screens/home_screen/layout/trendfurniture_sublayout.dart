import 'package:piggypaisa/Global_values.dart';

import '../../../../Backend/APIs.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';

import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';


import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/home_provider.dart';

import '../../../../utils/common_function.dart';
class TrendFurnitureSubLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const TrendFurnitureSubLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, home, child) {
      return FutureBuilder(
          future: Fetch_famalies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Families.length,
                  itemBuilder: (context, index) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              //text layout
                              Text(language(context, Families[index]['familyName'].toString()),
                                  style: appCss.dmPoppinsMedium14
                                      .textColor(isThemeColorReturn(context))),
                              //text layout
                              Text(language(context, Families[index]['role'].toString()),
                                  style: appCss.dmPoppinsRegular12
                                      .textColor(appColor(context).appTheme.lightText))
                            ])
                          ]),
                          const VSpace(Sizes.s15),
                          // Row(children: [
                          //   //text layout
                          //   Text(
                          //       language(context,
                          //           '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}'),
                          //       overflow: TextOverflow.ellipsis,
                          //       style: appCss.dmPoppinsSemiBold15
                          //           .textColor(isThemeColorReturn(context))),
                          //   const HSpace(Sizes.s5),
                          //   data['amount'] != null //text layout
                          //       ? Text(
                          //       language(
                          //           context,
                          //           "Save"
                          //               '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['amount'].toString()))).toStringAsFixed(1)}'),
                          //       overflow: TextOverflow.ellipsis,
                          //       style: appCss.dmPoppinsMedium12
                          //           .textColor(appColor(context).appTheme.linkErrorColor))
                          //       : const Text("")
                          // ])
                        ]).paddingSymmetric(vertical: Insets.i10);
                  }
              );
            }
            else
            {
              return Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }

          }
      );
    });
  }
}
