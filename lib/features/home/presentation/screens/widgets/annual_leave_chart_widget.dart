import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class AnnualLeaveChart extends StatefulWidget {
  final int leaveUsed;
  final int totalLeave;
  final Color color;
  final String title;
  final String? subTitle;
  final double? width;
  final double? height;
  const AnnualLeaveChart({
    super.key,
    required this.leaveUsed,
    required this.totalLeave,
    required this.color,
    required this.title,
    this.width,
    this.height,
    this.subTitle,
  });

  @override
  _AnnualLeaveChartState createState() => _AnnualLeaveChartState();
}

class _AnnualLeaveChartState extends State<AnnualLeaveChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Define the animation to go from 0 to the actual progress value
    _animation = Tween<double>(
      begin: 0,
      end: widget.leaveUsed / widget.totalLeave,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.width ?? 90.w,
          height: widget.height ?? 60.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(150, 150),
                    painter: HalfCirclePainter(
                        progress: _animation.value, color: widget.color),
                  );
                },
              ),
              Positioned(
                top: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "${widget.leaveUsed}",
                      style: AppTextStyle.bold_16,
                      textColor: widget.color,
                    ),
                    AppText(
                      text: "/",
                      style: AppTextStyle.bold_16,
                      textColor: Colors.white,
                    ),
                    AppText(
                      text: "${widget.totalLeave}",
                      style: AppTextStyle.bold_16,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
                text: widget.title,
                textAlign: TextAlign.center,
                style: AppTextStyle.bold_14,
                textColor: Colors.white),
            5.verticalSpace,
            if (widget.subTitle != null)
              AppText(
                  text: widget.subTitle!,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold_14,
                  textColor: Colors.white),
          ],
        ),
      ],
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final double progress;
  final Color color;

  HalfCirclePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.butt;

    double radius = size.width / 2;

    // Draw the background arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius - 10),
      pi,
      pi,
      false,
      backgroundPaint,
    );

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius - 10),
      pi,
      pi * progress, // Animated progress
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
