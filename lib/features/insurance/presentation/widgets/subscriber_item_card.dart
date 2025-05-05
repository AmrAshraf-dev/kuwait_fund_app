import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/subscriber_entity.dart';
import '../../../shared/widgets/app_text.dart';

class SubscriberItemCard extends StatelessWidget {
  final List<SubscriberEntity> subscriberList;
  final Function(int) onSelect;

  const SubscriberItemCard({
    super.key,
    required this.subscriberList,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: subscriberList.length,
      itemBuilder: (context, index) {
        final SubscriberEntity subscriber = subscriberList[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: AppText(
                text: subscriber.name,
                style: AppTextStyle.medium_18,
              ),
              subtitle: AppText(
                text: subscriber.relation,
                style: AppTextStyle.regular_16,
              ),
            ),
          ),
        );
      },
    );
  }
}
