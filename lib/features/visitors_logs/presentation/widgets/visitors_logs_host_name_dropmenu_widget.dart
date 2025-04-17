import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';

import '../../../shared/widgets/app_text.dart';

class HostNameDropdown extends StatefulWidget {
  final VisitorsLogsCubit visitorsLogsCubit;
  final VisitorsLogsHostsEntity? initialValue;
  final ValueChanged<VisitorsLogsHostsEntity?> onHostSelected;

    HostNameDropdown({
    required this.visitorsLogsCubit,
    required this.onHostSelected,
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  State<HostNameDropdown> createState() => _HostNameDropdownState();
}

class _HostNameDropdownState extends State<HostNameDropdown> {
   List<VisitorsLogsHostsEntity>  hostNameResponse  = <VisitorsLogsHostsEntity>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
        listener: (context, state) {
         if (state is VisitorsLogsErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showMessageBottomsheet(
              context: context,
              status: ConfirmationPopupStatus.failure,
              message: tr("general-error"),
            );
          } else if (state is VisitorsLogsLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is VisitorsLogsHostsReadyState) {
            ViewsToolbox.dismissLoading();
              hostNameResponse = state.response.data ?? [];
          }
          
        },
        builder: (context, state) {
             return CustomDropDownField<VisitorsLogsHostsEntity>(
              keyName: "hostName",
              labelText: context.tr("host_name"),
              disableSearch: true,
              disableFiled: false,
              onChanged: widget.onHostSelected,
            initialValue:  widget.initialValue,
              items: hostNameResponse.map((item) {
                return DropdownMenuItem<VisitorsLogsHostsEntity>(
                  value: item,
                  child: AppText(
                    text: item.name,
                    style: AppTextStyle.regular_16,
                  ),
                );
              }).toList(),
              validator: (value) =>
                  AppValidator.validatorRequired(value, context),
            );
         },
      ),
    );
  }
}