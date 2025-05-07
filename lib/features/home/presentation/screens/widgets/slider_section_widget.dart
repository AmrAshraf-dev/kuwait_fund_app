// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';

import 'package:kf_ess_mobile_app/features/ads/domain/entities/ads_entity.dart';
import 'package:kf_ess_mobile_app/features/ads/presentation/cubits/ads_cubit.dart';
import 'package:kf_ess_mobile_app/features/ads/presentation/screens/ads_screen.dart';
import 'package:kf_ess_mobile_app/features/ads/presentation/widgets/ad_card_item_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';

class SliderSection extends StatefulWidget {
  final AdsEntity? itemEntity;

  const SliderSection({
    Key? key,
    this.itemEntity,
  }) : super(key: key);

  @override
  _SliderSectionState createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  final AdsCubit adsCubit = getIt<AdsCubit>();
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  final int totalDots = 3;

  @override
  void initState() {
    super.initState();
    adsCubit.fetchNextAdsPage();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double position = _scrollController.position.pixels;
    double itemWidth = 200;
    int index = (position / itemWidth).round().clamp(0, totalDots - 1);
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final isActive = _currentIndex == index;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 12 : 8,
          height: isActive ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                isActive ? Palette.primaryColor : Palette.greyBackgroundTheme,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => adsCubit,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200.h,
            child: BlocBuilder<AdsCubit, PagingState<int, AdsEntity>>(
              bloc: adsCubit,
              builder: (context, state) {
                return PagedListView<int, AdsEntity>(
                  scrollDirection: Axis.horizontal,
                  state: state,
                  // pagingController: adsCubit.pagingController,
                  scrollController: _scrollController,
                  builderDelegate: PagedChildBuilderDelegate<AdsEntity>(
                    itemBuilder: (context, itemEntity, indexList) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: 300.w,
                        child: AdsCardItemWidget(item: itemEntity),
                      ),
                    ),
                  ),
                  fetchNextPage: () {
                    adsCubit.fetchNextAdsPage();
                  },
                );
              },
            ),
          ),
          10.verticalSpace,
          _buildDots(),
        ],
      ),
    );
  }
}
