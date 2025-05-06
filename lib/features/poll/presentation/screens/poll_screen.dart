
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
 import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_entity.dart';
import 'package:kf_ess_mobile_app/features/poll/presentation/widgets/poll_card_item_widget.dart';
import '../../../di/dependency_init.dart';
import '../cubits/poll_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
  import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class PollScreen extends StatefulWidget {
  const PollScreen({super.key});

  @override
  State<PollScreen> createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  final PollCubit pollCubit = getIt<PollCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => pollCubit,

      child: MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("poll"),
                hasScroll: false,

        widget:
         BlocBuilder<PollCubit, PagingState<int, PollEntity>>(
    bloc: pollCubit,
    builder: (context, state) =>




     PagedListView<int, PollEntity>(
      state: state,
      fetchNextPage: pollCubit.fetchNextPollsPage,

      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => PollCardItemWidget(item: item),
      ),
    ),
  )));

  }
}
