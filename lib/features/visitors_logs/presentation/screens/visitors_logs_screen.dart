import 'package:auto_route/auto_route.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/data_sources/remote/api_service.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitors_logs_request_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/dropdown_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_logs_response_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitors_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_bottomsheet.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class VisitorsLogsScreen extends StatefulWidget {
  const VisitorsLogsScreen({super.key});

  @override
  State<VisitorsLogsScreen> createState() => _VisitorsLogsScreenState();
}

class _VisitorsLogsScreenState extends State<VisitorsLogsScreen> {
  Item? selectedItem;
  final VisitorsLogsCubit visitorsLogsCubit = getIt<VisitorsLogsCubit>();
  List<DateTime> _availableDates = [];
  List<DateTime> _selectedDates = [];

  @override
  void initState() {
    visitorsLogsCubit.getVisitorsLogs(
        visitorsLogsModel: VisitorsLogsRequestModel(month: '04', year: '2025'));
    super.initState();
  }

  void _processApiData(List<dynamic> apiData) {
    final List<DateTime> dates = [];

    for (var item in apiData) {
      try {
        // Adjust based on your API date format
        final date = DateTime.parse(item['date']);
        dates.add(date);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    setState(() => _availableDates = dates);
  }

  bool _isDateAvailable(DateTime date) {
    // Check if date exists in available dates (compare dates without time)
    return _availableDates.any((availableDate) =>
        availableDate.year == date.year &&
        availableDate.month == date.month &&
        availableDate.day == date.day);
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is List<DateTime>) {
      // For multi-selection
      final selectedDates = args.value as List<DateTime>;
      final validDates = selectedDates.where(_isDateAvailable).toList();

      setState(() {
        _selectedDates = validDates;
      });
    } else if (args.value is PickerDateRange) {
      // For range selection
      final range = args.value as PickerDateRange;
      if (range.startDate != null && range.endDate != null) {
        final allDatesInRange =
            _getAllDatesInRange(range.startDate!, range.endDate!);
        final allValid = allDatesInRange.every(_isDateAvailable);

        if (allValid) {
          setState(() {
            _selectedDates = allDatesInRange;
          });
        } else {
          // Show error if any date in range is invalid
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Some dates in range are not available')),
          );
        }
      }
    }
  }

  List<DateTime> _getAllDatesInRange(DateTime start, DateTime end) {
    final days = end.difference(start).inDays + 1;
    return List.generate(
        days,
        (i) => DateTime(
              start.year,
              start.month,
              start.day + i,
            ));
  }
// List<String> getFullCalendarDaysAsStrings(DateTime focusedDate) {
//   final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
//   final lastDayOfMonth = DateTime(focusedDate.year, focusedDate.month + 1, 0);

//   // Calculate leading days from previous month
//   final firstWeekday = firstDayOfMonth.weekday;
//   final leadingDays = (firstWeekday - DateTime.monday) % 7;
//   final firstVisibleDate = firstDayOfMonth.subtract(Duration(days: leadingDays));

//   // Generate all 42 days (6 weeks) in the calendar view
//   return List.generate(42, (index) {
//     final date = firstVisibleDate.add(Duration(days: index));
//     return DateFormat('yyyy-MM-dd').format(date);
//   });
// }

// // Usage:
// final calendarDays = getFullCalendarDaysAsStrings(DateTime.now());
// print(calendarDays);
// Includes days from previous month, current month, and next month
  List<String> getAllDaysInMonthAsStrings(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 0);

    return List.generate(
      lastDay.day,
      (index) => DateFormat('dd/MM/yyyy')
          .format(DateTime(firstDay.year, firstDay.month, index + 1)),
    );
  }

  String redColor = 'Red';
  String blueColor = 'Blue';
  VisitorsManagementCalendarEntity? visitorsManagementCalendarEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("visitors_logs"),
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => visitorsLogsCubit
              ..getVisitorsLogs(
                  visitorsLogsModel:
                      VisitorsLogsRequestModel(month: '04', year: '2025')),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // BlocBuilder<VisitorsLogsCubit, VisitorsLogsState>(
                  //   builder: (context, state) {
                  //     if (state is VisitorsLogsLoadingState) {
                  //       ViewsToolbox.showLoading();
                  //     } else if (state is VisitorsLogsErrorState) {
                  //       ViewsToolbox.dismissLoading();
                  //       ViewsToolbox.showErrorAwesomeSnackBar(
                  //           context, state.message!);
                  //     } else if (state is VisitorsLogsHostsReadyState) {
                  //       ViewsToolbox.dismissLoading();
                  //       final hostNameResponse = state.response;
                  //       return CustomDropDownField<VisitorLogsHostsEntity>(
                  //         keyName: "hostName",
                  //         height: 42.h,
                  //         width: 250.w,
                  //         labelText: context.tr("host_name"),
                  //         disableSearch: true,
                  //         disableFiled: false,
                  //         onChanged: (
                  //           VisitorLogsHostsEntity? newSelectedService,
                  //         ) {},
                  //         items: hostNameResponse.data == null
                  //             ? []
                  //             : hostNameResponse.data!
                  //                 .map((VisitorLogsHostsEntity item) {
                  //                 return DropdownMenuItem<
                  //                     VisitorLogsHostsEntity>(
                  //                   value: item,
                  //                   child: AppText(
                  //                     text: item.name,
                  //                     style: AppTextStyle.regular_16,
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //         itemsSearchable: state.response.data == null
                  //             ? []
                  //             : state.response.data!
                  //                 .map(
                  //                   (VisitorLogsHostsEntity item) =>
                  //                       <String, VisitorLogsHostsEntity>{
                  //                     item.name!: item,
                  //                   },
                  //                 )
                  //                 .toList(),
                  //         validator: (VisitorLogsHostsEntity? value) =>
                  //             AppValidator.validatorRequired(
                  //           value,
                  //           context,
                  //         ),
                  //       );
                  //     }
                  //     return AppText(text: 'Empty');
                  //   },
                  // ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: DropdownSearch<Item>(
                      asyncItems: (String filter) => fetchItems(),
                      itemAsString: (Item item) => item.name,
                      onChanged: (Item? item) {
                        setState(() {
                          selectedItem = item;
                        });
                      },
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Select Item",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     // ViewsToolbox.showBottomSheet(
                  //     //     // height: 1.sh - 200,
                  //     //     context: context,
                  //     //     customWidget: SubmissionFilterBottomSheet());
                  //   },
                  //   child: Container(
                  //     height: 42.h,
                  //     width: 42.h,
                  //     decoration: BoxDecoration(
                  //       color: Palette.yellow_FBD823,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Assets.svg.filterIcon.svg(),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            20.verticalSpace,
            BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
                listener: (context, state) {
              if (state is VisitorsLogsErrorState) {
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
              }
            }, builder: (context, state) {
              if (state is VisitorsLogsLoadingState) {
                ViewsToolbox.showLoading();
              } else if (state is VisitorsLogsReadyState) {
                ViewsToolbox.dismissLoading();
                final calendarResponse = state.response;
                //calendarResponse.data?.first.date;
                final days = getAllDaysInMonthAsStrings(DateTime.now());
                // Get all days in month as strings (e.g., ["2023-08-01", "2023-08-02", ...])
                List<String> monthDays =
                    getAllDaysInMonthAsStrings(DateTime.now());

// Your data (could come from API/database)
                List<String?>? myDates =
                    calendarResponse.data?.map((item) => item.date).toList();

// Find matches
                List<String> matchingDates = [];
                for (String day in monthDays) {
                  if (myDates!.contains(day)) {
                    matchingDates.add(day);
                    print('Match found: $day');
                  }
                }
                print(days);
                print('DATE1 : ${calendarResponse.data?.first.date}');
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        // ViewsToolbox.showBottomSheet(
                        //   height: 400.h,
                        //   context: context,
                        //   customWidget: VisitsBottomSheet(),
                        // );
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: RangeDatePicker(
                          maxDate: DateTime.now().add(Duration(days: 365)),
                          minDate: DateTime.now(),

                          // selectedRange:
                          //     DateTimeRange(start: DateTime(2022), end: Dat(2023)),
                          selectedCellsDecoration: BoxDecoration(
                            color: Palette.blue_ECEEF4,
                            shape: BoxShape.circle,
                          ),
                          selectedCellsTextStyle: TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                          // singleSelectedCellTextStyle: const TextStyle(),
                          singleSelectedCellDecoration: BoxDecoration(
                            color: Palette.blue_3542B9,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                          ),
                          currentDateDecoration: BoxDecoration(
                            color: Palette.geryPattern,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                          ),
                          currentDateTextStyle:
                              TextStyle(color: Palette.black, fontSize: 16.sp),
                          daysOfTheWeekTextStyle: TextStyle(),
                          // disabledCellsTextStyle: const TextStyle(),
                          // enabledCellsDecoration: const BoxDecoration(),
                          // enabledCellsTextStyle: const TextStyle(),
                          enabledCellsDecoration: BoxDecoration(
                            color:
                                //days.toList() ==
                                //             calendarResponse.data
                                //                 ?.map((item) => item.date)
                                //                 .toList() &&
                                matchingDates == true &&
                                        calendarResponse.data
                                                ?.map((item) => item.visitType)
                                                .toList() ==
                                            redColor
                                    ? Palette.redBackgroundTheme
                                    : Palette.blueBackgroundTheme,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                          ),

                          initialPickerType: PickerType.days,
                          leadingDateTextStyle: const TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          slidersColor: Palette.primaryColor.withOpacity(0.2),
                          highlightColor: Colors.redAccent,
                          slidersSize: 20,
                          //splashColor: Colors.lightBlueAccent,
                          splashRadius: 20,
                          centerLeadingDate: false,

                          //  onRangeSelected: (DateTimeRange? value) {},
                        ),
//=================================================================================================
                        //     TableCalendar(
                        //   firstDay: DateTime.utc(2010, 10, 16),
                        //   lastDay: DateTime.utc(2030, 3, 14),
                        //   focusedDay: DateTime.now(),
                        //   selectedDayPredicate: (day) {
                        //     //calendarResponse.data?.
                        //     return isSameDay(_selectedDay, day);
                        //   },
                        // ),
                        //=====================================================
                        //     SfDateRangePicker(
                        //   view: DateRangePickerView.month,
                        //   showTodayButton: true,
                        //   cellBuilder: (context, cellDetails) {
                        //   //  final calendarResponse = state.response;

                        //     return Container();
                        //   },
                        //   selectableDayPredicate: (date) {

                        //   },
                        // )),
                        // _selectedDates.isNotEmpty ...[
                        //   Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Text(
                        //       'Selected Dates:',
                        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.only(bottom: 16.0),
                        //     child: Wrap(
                        //       spacing: 8,
                        //       children: _selectedDates
                        //           .map((date) => Chip(
                        //                 label: Text(
                        //                   '${date.day}/${date.month}/${date.year}',
                        //                 ),
                        //               ))
                        //           .toList(),
                      ),

                      //      ),
                      //],
                    ),
                  ),
                );
              }
              return Container();
            }),
            30.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                Row(children: [
                  Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      color: Palette.blue_3542B9,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: context.tr("private_visit"),
                    style: AppTextStyle.medium_18,
                  ),
                ]),
                20.horizontalSpace,
                Row(children: [
                  Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      color: Palette.blue_5490EB,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: context.tr("official_visit"),
                    style: AppTextStyle.medium_18,
                  ),
                ]),
              ],
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class ItemSearchDelegate extends SearchDelegate<Item?> {
  final List<Item> items;

  ItemSearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          subtitle: Text('ID: ${results[index].id}'),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? items
        : items
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          subtitle: Text('ID: ${suggestions[index].id}'),
          onTap: () {
            query = suggestions[index].name;
            close(context, suggestions[index]);
          },
        );
      },
    );
  }
}
