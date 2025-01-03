import 'package:piggypaisa/common/common_path_list.dart';

import '../../common/theme/scale.dart';
import '../../config.dart';
import '../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../provider/app_pages_provider/direction_provider.dart';
import '../../provider/theme_provider/theme_service.dart';
import '../../routes/index.dart';
import '../../utils/common_function.dart';


class CommonCartButton extends StatelessWidget {
  final String imagePath;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final GestureTapCallback? onTap;
  const CommonCartButton(
      {super.key,
      required this.imagePath,
      this.margin,
      this.padding,
      this.alignment,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context1, theme, direction, child) {
      return GestureDetector(
          onTap: onTap,
          child: Align(
              alignment: alignment ??
                  (direction.isDirection == true || isAr(context)
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight),
              child: Container(
                  padding: padding ?? const EdgeInsets.all(Insets.i4),
                  decoration: BoxDecoration(
                      color: isTheme(context)
                          ? appColor(context).appTheme.colorContainer
                          : appColor(context).appTheme.whiteColor,
                      shape: BoxShape.circle),
                  child: Container(
                      padding: const EdgeInsets.all(Insets.i6),
                      decoration: BoxDecoration(
                          color: isThemeColorReturn(context),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        imagePath,
                        colorFilter: ColorFilter.mode(
                            isThemeColorReturnDark(context),
                            BlendMode.srcIn),
                      )))).paddingOnly(left: Insets.i10));
    });
  }
}
