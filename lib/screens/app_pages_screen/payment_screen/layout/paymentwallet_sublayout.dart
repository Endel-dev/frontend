import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/payment_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_filter/common_radio.dart';

class PaymentSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  const PaymentSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context1, payment, child) {
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            SizedBox(
                height: Sizes.s30,
                width: Sizes.s30,
                child: SvgPicture.asset(data['icon'].toString(),
                    fit: BoxFit.scaleDown)),
            Text(language(context, data['title'].toString()),
                    style: appCss.dmPoppinsRegular13
                        .textColor(isThemeColorReturn(context)))
                .paddingSymmetric(horizontal: Insets.i15)
          ]),
          // radio button
          CommonRadio(
            onTap: () => payment.onSelectPaymentMethod(data['id']),
            index: data['id'],
            selectedIndex: payment.selectIndex,
          )
        ]).paddingAll(Insets.i15),
        if (appArray.paymentMethod[index]['id'] != 4)
          //dotted line
          DottedLine(
              dashLength: Sizes.s5,
              dashGapLength: Sizes.s2,
              dashColor: appColor(context).appTheme.shadowColor)
      ]);
    });
  }
}
