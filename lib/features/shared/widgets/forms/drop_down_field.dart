import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/extensions/size_extensions.dart';
import '../../../../core/utility/palette.dart';
import '../../../../core/utility/theme.dart';
import '../../../../gen/assets.gen.dart';
import '../app_text.dart';

class CustomDropDownField<T> extends StatefulWidget {
  CustomDropDownField({
    super.key,
    required this.keyName,
    this.initialValue,
    required this.labelText,
    required this.items,
    this.menuMaxHeight,
    this.validator,
    this.onChanged,
    this.labelAboveField,
    this.itemsSearchable,
    this.disableFiled = false,
    this.disableSearch = false,
    this.isNotRequired = false,
    this.height,
    this.width,
  }) : assert(
           ((disableSearch)) || (itemsSearchable != null && (itemsSearchable??[]).isNotEmpty),
          'itemsSearchable cannot be null or empty when disableFiled is false or null',
        );

       
  @Assert(
    'items != null && items.isNotEmpty',
    'items cannot be null or empty',
  )
  final String keyName;
  final T? initialValue;
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final List<Map<String, T>>? itemsSearchable;
  final String? Function(T?)? validator;
  final String? labelAboveField;
  final double? menuMaxHeight;
  final bool disableSearch;

  final void Function(T?)? onChanged;
  final bool? disableFiled;
  final bool? isNotRequired;
  final double? height;
  final double? width;

  @override
  State<CustomDropDownField<T>> createState() => _CustomDropDownFieldState<T>();
}

class _CustomDropDownFieldState<T> extends State<CustomDropDownField<T>> {
  T? selectedInialValue;
  final TextEditingController textEditingController = TextEditingController();
  // final GlobalKey<DropdownButton2State> dropDownKey =
  //     GlobalKey<DropdownButton2State>();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedInialValue = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CustomDropDownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selectedInialValue when initialValue changes
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        selectedInialValue = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.labelAboveField != null)
          AppText(
            text: widget.labelAboveField,
            style: AppTextStyle.regular_16,
          ),
        10.heightBox,
        DropdownButtonHideUnderline(
          child: FormBuilderField<T>(
            validator: widget.isNotRequired!
                ? null
                : widget.validator ??
                    (T? value) {
                      if (value == null) {
                        return 'emptyError'.tr();
                      }
                      return null;
                    },
            onChanged: (T? value) {
              //dropDownKey.currentState?.did;
              setState(() {
                selectedInialValue = value;
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: !(widget.disableFiled ?? false),
            initialValue: widget.initialValue,
            name: widget.keyName,
            builder: (FormFieldState<T> fieldState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: SizedBox(
                      height: widget.height ?? 60.h,
                      width: widget.width ?? 1.sw,
                      child: DropdownButtonFormField2<T>(
                        // dropdownButtonKey: dropDownKey,
                        iconStyleData: IconStyleData(
                          icon: Assets.svg.arrowDown.svg(
                            color: Palette.grey_9C9C9C,
                          ),
                        ),

                        isExpanded: true,

                        onChanged: widget.disableFiled!
                            ? null
                            : (T? value) {
                                widget.onChanged?.call(value);
                                //Log.d("Selected Item");
                                fieldState.didChange(value);
                              },
                        // menuMaxHeight: widget.menuMaxHeight ?? 300,
                        // iconEnabledColor: Palette.primaryColor,
                        // iconDisabledColor: Palette.primaryColor,
                        //   dropdownStyleData: const DropdownStyleData(
                        //   maxHeight: 200,
                        // ),

                        dropdownStyleData: DropdownStyleData(
                          maxHeight: widget.menuMaxHeight ?? 300,
                        ),

                        dropdownSearchData: widget.disableSearch || widget.itemsSearchable == null
                            ? null
                            : DropdownSearchData<T>(
                                searchController: textEditingController,
                                searchInnerWidgetHeight: 50,
                                searchInnerWidget: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,

                                    // expands: true,
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 20.h,
                                      ),
                                      errorStyle: TextStyle(
                                            fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                                         color: Palette.red_FF0606,
                                      ),
                                      hintText: context.tr("searchHere"),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Palette.red_FF0606),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Palette.grey_9C9C9C),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Palette.grey_9C9C9C),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Palette.grey_9C9C9C),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Palette.red_FF0606),
                                      ),
                                      hintStyle: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                searchMatchFn: (DropdownMenuItem<T> item,
                                    String searchValue) {
                                  // bool? value = true;
                                  // widget.itemsSearchable!.
                                  //     .forEach((Map<String, T> element) {
                                  //   if (element.keys.first.contains(searchValue)) {
                                  //    value=
                                  //   }
                                  // });
                                  // if (searchValue.isNotEmpty) {
                                  //   return value!;
                                  // }
                                  // return true;

                                  return
                                  widget.disableSearch
                                      ? false
                                      : widget.itemsSearchable == null
                                          ? true
                                          : widget.itemsSearchable!
                                              .isNotEmpty
                                              ? widget.itemsSearchable!
                                                  .firstWhere(
                                                    (Map<String, T> element) =>
                                                        element.values.first ==
                                                        item.value,
                                                        orElse: () => {}
                                                  )
                                                  .keys
                                                  .first
                                                  .toLowerCase()
                                                  .contains(searchValue.toLowerCase())
                                          :
                                  
                                   widget.itemsSearchable!
                                      .firstWhere(
                                        (Map<String, T> element) =>
                                            element.values.first == item.value,
                                                orElse: () => {}
                                      )
                                      .keys
                                      .first
                                      .toLowerCase()
                                      .contains(searchValue.toLowerCase());
                                },
                              ),

                        onMenuStateChange: (bool isOpen) {
                          if (!isOpen) {
                            textEditingController.clear();
                          }
                        },

                        // menuItemStyleData: MenuItemStyleData(
                        //   height: widget.menuMaxHeight ?? 300,
                        // ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: (widget.disableFiled ?? false)
                              ? AppTheme.isDarkMode(context)
                                  ? Palette.semiBlack
                                  : Palette.greyBorder
                              : AppTheme.isDarkMode(context)
                                  ? Palette.semiBlack
                                  : Colors.white,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          labelText: context.tr("--Select--"),
                          labelStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppTheme.isDarkMode(context)
                                ? Palette.white
                                : Palette.black,
                          ),
                          helperStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppTheme.isDarkMode(context)
                                ? Palette.white
                                : Palette.black,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppTheme.isDarkMode(context)
                                ? Palette.white
                                : Palette.black,
                          ),
                          errorStyle: TextStyle(
                            color: Palette.red_FF0606,
                          ),
                          hintText: widget.labelText,
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Palette.red_FF0606),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Palette.grey_9C9C9C),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Palette.grey_9C9C9C),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Palette.grey_9C9C9C),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Palette.red_FF0606),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        value: selectedInialValue,
                        // validator: widget.validator ??
                        //     (T? value) {
                        //       if (value == null) {
                        //         return 'emptyError'.tr();
                        //       }
                        //       return null;
                        //     },

                        items: widget.items,
                      ),
                    ),
                  ),
                  if (fieldState.hasError)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        5.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: AppText(
                            text: fieldState.errorText,
                            style: AppTextStyle.regular_12,
                            textColor: Palette.red_FF0606,
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomDropDownModel<T> extends Equatable {
  const CustomDropDownModel({required this.text, required this.value});

  final String text;
  final T value;

  @override
  List<Object?> get props => <Object?>[
        text,
        value,
      ];
}
