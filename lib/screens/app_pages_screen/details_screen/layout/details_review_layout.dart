import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'common_container.dart';
import 'common_list_header.dart';
import 'details_check_delivery_sublayout.dart';
import 'details_review_sublayout.dart';
import 'details_second_layout/details_widget.dart';

class DetailsReviewLayout extends StatelessWidget {
  const DetailsReviewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Column(
        children: [
          //review text layout
          CommonListHeader(
              text: language(context, appFonts.reviews),
              isClick: details.isReviews,
              onTap: () => details.isClickDown(appFonts.reviews)),
          details.isReviews == true
              ? Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //review count text
                        Text(language(context, appFonts.reviewCount),
                            style: appCss.dmPoppinsRegular14.textColor(
                                appColor(context).appTheme.lightText)),
                        //click event for view all review list open
                        Text(language(context, appFonts.viewAll),
                            style: appCss.dmPoppinsRegular14.textColor(
                                appColor(context).appTheme.lightText)).inkWell(onTap: ()=>route.pushNamed(context, routeName.reviews))
                      ]),
                  const VSpace(Sizes.s12),
                  //review list layout
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: appArray.reviewList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CommonContainer(
                                widget: DetailsReviewSubLayout(
                                    index: index,
                                    data: appArray.reviewList[index])).paddingOnly(bottom: Insets.i10);
                      })
                ])
              : Container(),
          const VSpace(Sizes.s5),
        ],
      );
    });
  }
}
