// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:kf_ess_mobile_app/core/extensions/size_extensions.dart';
// import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_file_picker_section_widget.dart';
// import 'package:path/path.dart' as path;

// import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
// import 'package:kf_ess_mobile_app/core/utility/palette.dart';
// import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_file_picker_button_widget.dart';
// import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
// import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
// import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
// import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/child_cubit.dart';
// import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/custom_file_picker/custom_file_picker_cubit.dart';
// import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/file_picker.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

// class AddChildWidget extends StatefulWidget {
//   String? id;
//   String? name;
//   String? civilId;
//   String? birthDate;
//   String? gender;
//   String? disabilityDate;
//   String? disabilityType;
//   String? fileExtension;
//   String? bytes;
//   String? selectedFile;
//   AddChildWidget({
//     Key? key,
//     this.id,
//     this.name,
//     this.civilId,
//     this.birthDate,
//     this.gender,
//     this.disabilityDate,
//     this.disabilityType,
//     this.fileExtension,
//     this.bytes,
//     this.selectedFile,
//   }) : super(key: key);

//   @override
//   State<AddChildWidget> createState() => _AddChildWidgetState();
// }

// class _AddChildWidgetState extends State<AddChildWidget> {
//   final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
//   String? _selectedGenderStatus;
//   late List<String> _genderStatuses = _genderStatuses = [
//     context.tr('male'),
//     context.tr('female'),
//   ];
//   String? _selectedDisabilityStatus;
//   late List<String> _genderDisabilityStatuses = _genderDisabilityStatuses = [
//     'type1',
//     'type2',
//     'type3',
//   ];

//   final ChildCubit _childCubit = getIt<ChildCubit>();
//   String? _selectedFile;

//   final FilePickerCubit filePickerFamilyCubit = getIt<FilePickerCubit>();
//   ChildModel? childEntity;
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         // BlocProvider(
//         //     create: (context) => _childCubit
//         //       ..getChild(childModel: ChildRequestModel(id: widget.id))),
//         // BlocProvider(create: (context) => _editChildCubit),
//         BlocProvider(create: (context) => filePickerFamilyCubit),
//       ],
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: FormBuilder(
//                 key: _formKey,
//                 child:
//                     //  BlocConsumer<ChildCubit, ChildState>(
//                     //     listener: (context, state) {
//                     //   if (state is ChildErrorState) {
//                     //     ViewsToolbox.dismissLoading();
//                     //     ViewsToolbox.showErrorAwesomeSnackBar(
//                     //         context, context.tr(state.message!));
//                     //   }
//                     // }, builder: (context, state) {
//                     //   if (state is ChildLoadingState) {
//                     //     ViewsToolbox.showLoading();
//                     //   } else if (state is ChildReadyState) {
//                     //     childEntity = state.response.data;
//                     //     ViewsToolbox.dismissLoading();
//                     //     return
//                     Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       30.verticalSpace,
//                       TextFieldWidget(
//                         labelAboveField: context.tr("name"),
//                         keyName: "name",
//                         validator: FormBuilderValidators.required(),
//                         textInputAction: TextInputAction.next,
//                         // initalValue: childEntity?.name ?? '',
//                         onChanged: (value) {
//                           setState(() {
//                             widget.name = value;
//                           });
//                         },
//                       ),
//                       20.verticalSpace,
//                       TextFieldWidget(
//                         labelAboveField: context.tr("civilIDNumber"),
//                         keyName: "civilIDNumber",
//                         validator: FormBuilderValidators.required(),
//                         textInputAction: TextInputAction.next,
//                         //  initalValue: childEntity?.civilID ?? '',
//                         onChanged: (value) {
//                           setState(() {
//                             widget.civilId = value;
//                           });
//                         },
//                       ),
//                       //  20.verticalSpace,
//                       // CustomSingleRangeDatePicker(
//                       //   fromLabelAboveField:
//                       //       context.tr("residencyExpiryDate"),
//                       //   customFormKey: _formKey,
//                       //   keyNameFrom: "residencyExpiry",
//                       // ),

//                       20.verticalSpace,
//                       CustomSingleRangeDatePicker(
//                         fromLabelAboveField: context.tr("birthDate"),
//                         customFormKey: _formKey,
//                         keyNameFrom: "birthDate",
//                         //   initialDate: childEntity?.birthDate != null
//                         //       ? DateFormat('dd/MM/yyyy')
//                         //           .parse(childEntity!.birthDate!)
//                         //       : null,
//                         onChanged: (value) {
//                           setState(() {
//                             widget.birthDate = value;
//                           });
//                         },
//                       ),
//                       40.verticalSpace,
//                       //?GENDER
//                       DropdownButtonFormField<String>(
//                         value: _selectedGenderStatus,
//                         decoration: InputDecoration(
//                           labelText: context.tr('gender'),
//                           labelStyle: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 14),
//                         ),
//                         icon: Icon(Icons.keyboard_arrow_down_rounded,
//                             color: Colors.grey),
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                         dropdownColor: Colors.white,
//                         items: _genderStatuses.map((String status) {
//                           return DropdownMenuItem<String>(
//                             value: status,
//                             child: AppText(
//                               text:
//                                   status[0].toUpperCase() + status.substring(1),
//                               //  style: TextStyle(fontSize: 16),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _selectedGenderStatus = newValue;
//                           });
//                         },
//                       ),
//                       20.verticalSpace,
//                       //?DISABILITY datepicker
//                       CustomSingleRangeDatePicker(
//                         fromLabelAboveField: context.tr("disabilityDate"),
//                         customFormKey: _formKey,
//                         keyNameFrom: "disabilityDate",
//                         // initialDate: childEntity?.childDisabilityDate !=
//                         //         null
//                         //     ? DateFormat('dd/MM/yyyy')
//                         //         .parse(childEntity!.childDisabilityDate!)
//                         //     : null,
//                         onChanged: (value) {
//                           setState(() {
//                             widget.disabilityDate = value;
//                           });
//                         },
//                       ),
//                       40.verticalSpace,
//                       //?Disability type
//                       DropdownButtonFormField<String>(
//                         value: _selectedDisabilityStatus,
//                         decoration: InputDecoration(
//                           labelText: context.tr('disabilityType'),
//                           labelStyle: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 14),
//                         ),
//                         icon: Icon(Icons.keyboard_arrow_down_rounded,
//                             color: Colors.grey),
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                         dropdownColor: Colors.white,
//                         items: _genderDisabilityStatuses.map((String status) {
//                           return DropdownMenuItem<String>(
//                             value: status,
//                             child: AppText(
//                               text:
//                                   status[0].toUpperCase() + status.substring(1),
//                               //  style: TextStyle(fontSize: 16),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _selectedDisabilityStatus = newValue;
//                           });
//                         },
//                       ),
//                       20.verticalSpace,

//                   FilePickerSection(
//                 filePickerCubit: filePickerFamilyCubit,
//                 onFileSelected: (filePath) =>
                
//                 setState(() {
//                   _selectedFile = filePath;
//                 })  
//               ),
            
//               //         ),

//                       40.verticalSpace,
//                     ],
//                   ),
//                 ),
//                 //   }
//                 //   return Container();
//                 // }),
//               ),
//             ),
//             20.verticalSpace,
//           ],
//         ),
//       ),
//     );
//   }
// }

//   String _getFileExtension(String filePath) {
//     return path.extension(filePath).replaceFirst(".", "");
//   }


