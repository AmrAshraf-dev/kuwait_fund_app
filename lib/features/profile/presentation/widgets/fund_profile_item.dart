import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class FundProfileItem extends StatelessWidget {
  const FundProfileItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.role});

  final String imageUrl;
  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 400),
            imageUrl: imageUrl,
            width: 100.w,
            height: 100.h,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Image.asset(
              'assets/png/default_profile.png', // Path to your default image
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        10.verticalSpace,
        AppText(
          text: name,
          style: AppTextStyle.medium_18,
        ),
        AppText(
          text: role,
          maxLines: 2,
          style: AppTextStyle.regular_14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
