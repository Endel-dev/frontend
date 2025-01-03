import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/address_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import 'addresstype_sublayout.dart';
import 'shipping_widget.dart';

class AddressTypeLayout extends StatelessWidget {
  const AddressTypeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AddressProvider, ThemeService>(
        builder: (context, address, theme, child) {
      return Stack(children: [
        Column(children: [
          const VSpace(Sizes.s15),
          //text widget
          ShippingWidget().textCommon(
              language(context, appFonts.addressType), false, context),
          const VSpace(Sizes.s6),
          Container(
              height: Sizes.s50,
              width: MediaQuery.of(context).size.width,
              //decoration
              decoration: ShippingWidget().addressTypeDecor(context),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //address type list layout
                    ...appArray.addressType.asMap().entries.map((e) {
                      return AddressTypeSubLayout(index: e.key, data: e.value);
                    }).toList()
                  ]))
        ])
      ]);
    });
  }
}
