import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/entities/contactus_entity.dart';
import 'package:kf_ess_mobile_app/features/contactus/presentation/cubits/contactus_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/tab_cubit/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TabCubit _tabCubit = getIt<TabCubit>();
  final ContactusCubit _contactusCubit = getIt<ContactusCubit>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("contact_us"),
      isBackEnabled: true,
      hasScroll: false,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<TabCubit>(
                create: (context) => _tabCubit,
              ),
            ],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: BlocBuilder<TabCubit, int>(
                  builder: (context, int selectedIndex) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: TabBar(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsetsDirectional.only(end: 10.w),
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      _tabCubit.changeTab(value);
                    },
                    controller: _tabController,
                    isScrollable: true,
                    tabs: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 37.h),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? Palette.yellow_FBD823
                                  : Palette.white,
                              border: Border.all(
                                  color: selectedIndex == 0
                                      ? Palette.yellow_FBD823
                                      : Palette.gery_DADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("contact_info"),
                              style: AppTextStyle.semiBold_13,
                              textColor: Palette.blue_002A6A,
                            ))),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? Palette.yellow_FBD823
                                  : Palette.white,
                              border: Border.all(
                                  color: selectedIndex == 1
                                      ? Palette.yellow_FBD823
                                      : Palette.gery_DADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("map"),
                              style: AppTextStyle.semiBold_13,
                              textColor: Palette.blue_002A6A,
                            ))),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 37.h),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? Palette.yellow_FBD823
                                  : Palette.white,
                              border: Border.all(
                                  color: selectedIndex == 2
                                      ? Palette.yellow_FBD823
                                      : Palette.gery_DADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("telephone_fax"),
                              style: AppTextStyle.semiBold_13,
                              textColor: Palette.blue_002A6A,
                            ))),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          10.verticalSpace,
          Flexible(
              child: BlocProvider(
                  create: (context) => _contactusCubit,
                  child: BlocConsumer<ContactusCubit, ContactusState>(
                    listener: (context, state) {
                      if (state is ContactusLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is ContactusErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showMessageBottomsheet(
                          
                          context: 
                            context,message:  state.message??"general-error".tr() ,
                            status:  ConfirmationPopupStatus.failure,);
                      } else if (state is ContactusReadyState) {
                        ViewsToolbox.dismissLoading();
                      }
                    },
                    builder: (context, state) {
                    
                       if (state is ContactusReadyState) {
                     

                        return TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: <Widget>[
                            ContactInfoWidget(
                                contactusEntity: state.contactusEntity),
                            MapWidget(contactusEntity: state.contactusEntity),
                            TelephoneFaxWidget(
                                contactusEntity: state.contactusEntity),
                          ],
                        );
                      }
                      return Container();
                    },
                  ))),
        ],
      ),
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  final ContactusEntity? contactusEntity;
  const ContactInfoWidget({super.key, this.contactusEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitleWidget(
            title: context.tr('you_can_send_message'),
          ),
          20.verticalSpace,
          AppText(
            text: context.tr("operations"),
            style: AppTextStyle.regular_18,
          ),
          AppText(
            text: contactusEntity?.operationsEmail,
            style: AppTextStyle.regular_18,
            textColor: Palette.blue_3B72C5,
          ),
          20.verticalSpace,
          AppText(
            text: context.tr("webmaster"),
            style: AppTextStyle.regular_18,
          ),
          AppText(
            text: contactusEntity?.webmasterEmail,
            style: AppTextStyle.regular_18,
            textColor: Palette.blue_3B72C5,
          ),
          30.verticalSpace,
          MainTitleWidget(
            title: context.tr('address'),
          ),
          10.verticalSpace,
          AppText(
            maxLines: 6,
            text:
                "${contactusEntity?.address?.line1}\n${contactusEntity?.address?.line2}\n${contactusEntity?.address?.line3}\n${contactusEntity?.address?.line4}\n${contactusEntity?.address?.line5}\n${contactusEntity?.address?.line6}",
            style: AppTextStyle.regular_14,
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  final ContactusEntity? contactusEntity;
  const MapWidget({super.key, this.contactusEntity});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(
            double.parse(contactusEntity?.latitude ?? "29.37120141748113"),
            (double.parse(contactusEntity?.longitude ?? "47.98199412585341"))),
        zoom: 15,
      ),
      markers: <Marker>{
        Marker(
          markerId: MarkerId('customLocation'),
          position: LatLng(
              double.parse(contactusEntity?.latitude ?? "29.37120141748113"),
              (double.parse(
                  contactusEntity?.longitude ?? "47.98199412585341"))),
          icon: BitmapDescriptor.defaultMarker,
        ),
      },
      myLocationEnabled: true,
      style: "",
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}

class TelephoneFaxWidget extends StatelessWidget {
  final ContactusEntity? contactusEntity;
  const TelephoneFaxWidget({super.key, this.contactusEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: context.tr("telephone"),
              style: AppTextStyle.regular_18,
            ),
            20.verticalSpace,
            Directionality(
              textDirection: TextDirection.ltr,
              child: AppText(
                text: contactusEntity?.telephoneNumber,
                style: AppTextStyle.regular_18,
              ),
            ),
            20.verticalSpace,
            AppText(
              text: context.tr("fax"),
              style: AppTextStyle.regular_18,
            ),
            20.verticalSpace,
            Directionality(
              textDirection: TextDirection.ltr,
              child: AppText(
                text: contactusEntity?.fax,
                style: AppTextStyle.regular_18,
              ),
            ),
          ],
        ));
  }
}
