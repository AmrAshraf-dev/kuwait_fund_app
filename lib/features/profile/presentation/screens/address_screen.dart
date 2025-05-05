import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../../core/utility/palette.dart';
import '../../../di/dependency_init.dart';
import '../../domain/entities/address_entity.dart';
import '../cubits/address_cubit.dart';
import '../widgets/personal_info_item_widget.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/main_title_widget.dart';
import '../../../../gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
  }

  final AddressCubit _addressCubit = getIt<AddressCubit>();
  MyAddressEntity? addressEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myAddress"),
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _addressCubit..getAddress()),
        ],
        child: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                // Assets.svg.refresh.svg(),
                CustomElevatedButton(
                  onPressed: () {},
                  backgroundColor: Palette.white,
                  borderColor: Palette.gray_B6B7B8,
                  showBorder: true,
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.png.paci.image(),
                      6.horizontalSpace,
                      AppText(
                        text: context.tr("updateWithPACI"),
                        style: AppTextStyle.semiBold_14,
                        textColor: Palette.black,
                      ),
                    ],
                  ),
                  width: 197.w,
                  height: 40.h,
                  radius: 10.r,
                ),
              ]),
              25.verticalSpace,
              MainTitleWidget(title: context.tr("address")),
              12.verticalSpace,
              BlocConsumer<AddressCubit, AddressState>(
                listener: (context, state) {
                  if (state is AddressErrorState) {
                    ViewsToolbox.dismissLoading();
                    ViewsToolbox.showErrorAwesomeSnackBar(
                        context, state.message!);
                  }
                },
                builder: (context, state) {
                  if (state is AddressLoadingState) {
                    ViewsToolbox.showLoading();
                  } else if (state is AddressReadyState) {
                    addressEntity = state.response.data;
                    ViewsToolbox.dismissLoading();
                    return SizedBox(
                      height: 411.h,
                      width: 364.w,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: Palette.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Palette.gery_DADADA, width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 13.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Align(
                              //   alignment: AlignmentDirectional.topEnd,
                              //   child: EditButton(
                              //     onPressed: () {
                              //       CustomMainRouter.push(EditAddressRoute());
                              //     },
                              //   ),
                              // ),
                              20.verticalSpace,
                              PersonalInfoItemWidget(
                                  title: context.tr("government"),
                                  body: addressEntity?.avenue ??
                                      '', //"Farwaniya",
                                  withDivider: false),
                              12.verticalSpace,
                              PersonalInfoItemWidget(
                                  title: context.tr("street"),
                                  body: addressEntity?.street ??
                                      '', //"Ahmad Riyad Abdel",
                                  withDivider: false),
                              12.verticalSpace,
                              PersonalInfoItemWidget(
                                  title: context.tr("block"),
                                  body: addressEntity?.block ?? '', //"12",
                                  withDivider: false),
                              12.verticalSpace,
                              PersonalInfoItemWidget(
                                  title: context.tr("buildingNumber"),
                                  body: addressEntity?.building ?? '', //"230",
                                  withDivider: false),
                              12.verticalSpace,
                              PersonalInfoItemWidget(
                                  title: context.tr("floor"),
                                  body: addressEntity?.apartmentNumber ??
                                      '', //"1",
                                  withDivider: false),
                              12.verticalSpace,
                              PersonalInfoItemWidget(
                                  title: context.tr("flat"),
                                  body: addressEntity?.apartmentNumber ??
                                      '', //"13",
                                  withDivider: false),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
