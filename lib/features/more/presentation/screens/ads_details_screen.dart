import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/more/domain/entities/ads_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class AdsDetailsScreen extends StatefulWidget {
  const AdsDetailsScreen({super.key, required this.adItem});

  final AdsEntity adItem;

  @override
  State<AdsDetailsScreen> createState() => _AdsDetailsScreenState();
}

class _AdsDetailsScreenState extends State<AdsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("advertisement"),
      isBackEnabled: true,
      widget: Container(
        height: 655.h,
        width: 364.w,
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Palette.grey_7B7B7B.withOpacity(0.2),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
          color: Palette.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(12.w),
              child: Align(
                alignment: LanguageHelper.isAr(context)
                    ? Alignment.topLeft
                    : Alignment.topLeft,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(22.r)),
                        child: Image.asset(
                          widget.adItem.imageUrl,
                          width: 338.w,
                          height: 294.h,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(20.0),
                      child: Column(
                        children: [
                          if (widget.adItem.title != null)
                            SizedBox(
                              width: 205.w,
                              child: AppText(
                                text: context.tr(widget.adItem.title!),
                                style: AppTextStyle.bold_28,
                                textColor: widget.adItem.id == 1
                                    ? Palette.white
                                    : Palette.black,
                              ),
                            ),
                          if (widget.adItem.subTitle != null)
                            SizedBox(
                              width: 205.w,
                              child: AppText(
                                text: context.tr(widget.adItem.subTitle!),
                                style: AppTextStyle.regular_18,
                                textColor: widget.adItem.id == 1
                                    ? Palette.white
                                    : Palette.black,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: TextWithBoldHeadlines(
                  text: context.tr(widget.adItem.description)),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWithBoldHeadlines extends StatelessWidget {
  final String text;

  const TextWithBoldHeadlines({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final RegExp headlineRegex = RegExp(r"([^:]+):\s*(.*?)(?=\n|$)");

    // Create a list to store the Rows
    List<Widget> rows = [];

    // Find all matches in the text using the regex pattern
    Iterable<RegExpMatch> matches = headlineRegex.allMatches(text);

    int lastMatchEnd = 0;

    for (var match in matches) {
      // Add text between the previous match and the current match (if any)
      if (match.start > lastMatchEnd) {
        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(
                  text: text.substring(lastMatchEnd, match.start).trim(),
                  style: AppTextStyle.medium_16,
                  textColor: Palette.black,
                ),
              ),
            ],
          ),
        );
      }

      // Create a Row for text before and after the colon
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: AppText(
                text: match.group(1)!.trim(), // Text before the colon
                style: AppTextStyle.bold_16,
                textColor: Palette.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: AppText(
                text: match.group(2)!.trim(), // Text after the colon
                style: AppTextStyle.medium_16,
                textColor: Palette.black,
              ),
            ),
          ],
        ),
      );

      rows.add(20.verticalSpace);

      lastMatchEnd = match.end;
    }

    // Add any remaining text after the last match
    if (lastMatchEnd < text.length) {
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppText(
                text: text.substring(lastMatchEnd).trim(),
                style: AppTextStyle.medium_16,
                textColor: Palette.black,
              ),
            ),
          ],
        ),
      );
    }

    // Return a Column with all Rows
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );
  }
}
