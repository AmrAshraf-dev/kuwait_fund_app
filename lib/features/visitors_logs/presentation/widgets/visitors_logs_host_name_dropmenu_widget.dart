import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/app_validator.dart';
import '../../../shared/widgets/forms/drop_down_field.dart';
import '../../domain/entities/visitor_logs_hosts_entity.dart';

import '../../../shared/widgets/app_text.dart';

class HostNameDropdown extends StatefulWidget {
  final VisitorsLogsHostsEntity? initialValue;
  final ValueChanged<VisitorsLogsHostsEntity?> onHostSelected;
  final List<VisitorsLogsHostsEntity> calendarPressedDateHostsListResponse  ;
    HostNameDropdown({
    required this.onHostSelected,
    required this.calendarPressedDateHostsListResponse,
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  State<HostNameDropdown> createState() => _HostNameDropdownState();
}

class _HostNameDropdownState extends State<HostNameDropdown> {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: CustomDropDownField<VisitorsLogsHostsEntity>(
              keyName: "hostName",
              labelText: context.tr("host_name"),
              disableSearch: true,
              disableFiled: false,
              onChanged: widget.onHostSelected,
            initialValue:  widget.initialValue,
              items: widget.calendarPressedDateHostsListResponse.map((item) {
                return DropdownMenuItem<VisitorsLogsHostsEntity>(
                  value: item,
                  child: AppText(
                    text: item.name,
                    style: AppTextStyle.regular_16,
                  ),
                );
              }).toList(),
              validator: (value) =>
                  AppValidator.validatorRequired(value, context)));
          
         }
      
    
  
}