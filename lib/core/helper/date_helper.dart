import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
 
class DateHelper {
  
  static  Future<void>  selectDate(BuildContext context, {  DateTime? firstDate, DateTime? lastDate, required
  Function (DateTime? selectedDay)
   onSelectedDay}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate:firstDate?? DateTime(2020), // Disable past dates
      lastDate: lastDate ?? DateTime(2040),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Palette.primaryColor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null  ) {
        onSelectedDay(
         picked,
     );
     
    }
  }


}

 
