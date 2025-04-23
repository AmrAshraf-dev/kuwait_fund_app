import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
 
class DateHelper {
  
  static  Future<void>  selectDate(BuildContext context, {required DateTime firstDate , required
  Function (DateTime selectedDay)
   onSelectedDay}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate:firstDate, // Disable past dates
      lastDate: DateTime(2100),
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

 
