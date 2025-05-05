import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/utility/palette.dart';
import '../../domain/entities/ads_entity.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/master_widget.dart';

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
          crossAxisAlignment:   CrossAxisAlignment.start,
          children: [
                 Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AppText(
              text: widget.adItem.createdOn?.showDateWithFormat(),
              style: AppTextStyle.bold_18,
              textColor: Palette.backgroundColorDark,
            ),
          ),
             Container(
              margin: EdgeInsets.all(12.w),
              child: Align(
                alignment: LanguageHelper.isAr(context)
                    ? Alignment.topLeft
                    : Alignment.topLeft,
                child: Stack(
                  children: [
                 ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(22.0.r)),
                    child:
                    (widget.adItem.externalImage ==null || widget.adItem.externalImage!.isEmpty )
                    && (widget.adItem.templateImageUrl ==null || widget.adItem.templateImageUrl!.isEmpty)
                    ? Image.asset(
                      Assets.png.adsPlaceholder.path,
                      fit: BoxFit.cover,
                    ):
                    
                     CachedNetworkImage(
                    imageUrl:   widget.adItem.templateImageUrl!=null && widget.adItem.templateImageUrl!.isNotEmpty
                        ? widget.adItem.templateImageUrl!
                        : 
                             widget.adItem.externalImage!,
                          
                      fit: BoxFit.cover,
                    )
                    
                    
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(20.0),
                      child: Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children: [
                          if (widget.adItem.title != null)
                            SizedBox(
                               child: AppText(
                                maxLines: 2,
                                text: context.tr(widget.adItem.title!),
                                style: AppTextStyle.bold_28,
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
                  text: context.tr(widget.adItem.body ?? "")),
            ),
             //   5.verticalSpace,
                          if (widget.adItem.moreLink != null)
                            Padding(
                              padding:   EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                              child: CustomElevatedButton(onPressed: (){
                                ViewsToolbox.openUrl(
                                  widget.adItem.moreLink!,
                                );
                              },
                              customChild:  AppText(
                               maxLines: 2,
                               text: context.tr("more_link"),
                               style: AppTextStyle.regular_18,
                               
                                                              ),))
                              
                              
                             
                            
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
                  maxLines: 20,
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
                maxLines: 20,
                text: match.group(1)!.trim(), // Text before the colon
                style: AppTextStyle.bold_16,
                textColor: Palette.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: AppText(
                maxLines: 20,
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
                maxLines: 20,
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
