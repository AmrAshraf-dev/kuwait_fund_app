import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SWALogoWidget extends StatelessWidget {
  const SWALogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/app-logo.svg',
      width: 100,
      height: 100,
    );
  }
}
