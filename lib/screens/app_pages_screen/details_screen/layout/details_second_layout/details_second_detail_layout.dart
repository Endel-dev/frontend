import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../../common/extension/spacing.dart';
import '../../../../../common/theme/scale.dart';
import '../../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../../provider/theme_provider/theme_service.dart';
import '../../../../../routes/index.dart';
import '../../../../../utils/common_function.dart';
import '../../../../../widgets/common_widgets.dart';
import '../../../../bottom_screens/home_screen/layout/home_widget.dart';
import '../../../../bottom_screens/home_screen/layout/newarrivals_layout.dart';
import 'details_second_detail_sublayout.dart';

class DetailsSecondDetailLayout extends StatelessWidget {
  const DetailsSecondDetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DetailsProvider>(
        builder: (context1, theme, details, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: appColor(context).appTheme.backGroundColorMain,
        padding: const EdgeInsets.symmetric(horizontal: Insets.i20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(Sizes.s20),
          //details page in details name
          Text(language(context, appFonts.detailsOne),
              style: appCss.dmPoppinsSemiBold14
                  .textColor(isThemeColorReturn(context))),
          const VSpace(Sizes.s4),
          //details page in details description
          Text(
              language(context, appFonts.detailsDescriptionData) +
                  language(context, appFonts.readMore),
              textAlign: TextAlign.start,
              style: appCss.dmPoppinsRegular13.textColor(isTheme(context)
                  ? appColor(context).appTheme.lightText
                  : appColor(context).appTheme.primaryColor)),
          const VSpace(Sizes.s20),
          //divider
          CommonWidget().commonDivider(context),
          const VSpace(Sizes.s15),
          //layout for rating
          const DetailsSecondDetailSubLayout(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const VSpace(Sizes.s10),
            //divider
            CommonWidget().commonDivider(context),
            const VSpace(Sizes.s10),
            //write review text and click event to open write review layout
            Text(
              language(context, appFonts.writeReview),
              style: appCss.dmPoppinsMedium14.textColor(
                isThemeColorReturn(context),
              ),
            ).inkWell(onTap: () => details.onShowBottomLayout(context)),
            const VSpace(Sizes.s20),
            //similar product text layout
            HomeWidget().listNameCommon(
                context, language(context, appFonts.similarProduct)),
            const VSpace(Sizes.s10),
            //similar product layout
            const NewArrivalLayout(),
            const VSpace(Sizes.s5)
          ])
        ]),
      );
    });
  }
}
