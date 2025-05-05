import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/images.dart';
import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/utility/palette.dart';
import '../../../../shared/widgets/app_text.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  _SliderSectionState createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  final List<String> imgList = [
    slide1Image,
    slide2Image,
    slide1Image,
    slide2Image,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imgList
            .map((item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Stack(
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.0.r)),
                            child: Image.asset(
                              item,
                              fit: BoxFit.contain,
                            )),
                      ),
                      Align(
                        alignment: LanguageHelper.isAr(context)
                            ? Alignment.topLeft
                            : Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.all(20.0),
                          child: Directionality(
                            textDirection:  TextDirection.ltr,
                                
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: AppText(
                                    maxLines: 2,
                                    text: context.tr(
                                        "tips_to_achieve_better_productivity"),
                                    style: AppTextStyle.bold_22,
                                    textColor: _current == 0 || _current == 2
                                        ? Palette.white
                                        : Palette.blue_002A69,
                                  ),
                                ),
                                Container(
                                  width: 30.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: _current == 0 || _current == 2
                                        ? Colors.yellow
                                        : Palette.black,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Palette.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        controller: _controller,
        options: CarouselOptions(
          viewportFraction: 0.95,
          aspectRatio: 2.2,
          disableCenter: true,
          autoPlay: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: (index, reason) {
            setState(() => _current = index);
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Palette.blue_002A69)
                      .withOpacity(_current == entry.key ? 1 : 0.2)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
