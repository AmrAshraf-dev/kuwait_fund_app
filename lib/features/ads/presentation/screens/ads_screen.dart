import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
 import 'package:kf_ess_mobile_app/features/ads/presentation/cubits/ads_cubit.dart';
import 'package:kf_ess_mobile_app/features/ads/presentation/widgets/ad_card_item_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';
 import '../../../../core/helper/language_helper.dart';

import '../../../../core/utility/palette.dart';
import '../../domain/entities/ads_entity.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  final AdsCubit adsCubit = getIt<AdsCubit>();




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => adsCubit,
      child: MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("advertisement"),
        hasScroll: false,
        widget:


         BlocBuilder<AdsCubit, PagingState<int, AdsEntity>>(
    bloc: adsCubit,
    builder: (context, state) =>




     PagedListView<int, AdsEntity>(
      state: state,
      fetchNextPage: adsCubit.fetchNextAdsPage,

      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => AdsCardItemWidget(item: item),
      ),
    ),
  )));




  }


}

