import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../core/extensions/size_extensions.dart';
import '../../../core/utility/palette.dart';
import 'app_text.dart';

class CustomFormFieldWidget extends StatelessWidget{
  const CustomFormFieldWidget({
    super.key,
    required this.child,
     required this.validator, required this. keyName,
  });

  final Widget child;
   final String? Function(String?)? validator;
   final String keyName;


  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: keyName,
      validator:  validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
           child,
            if(state.hasError)...[
            15.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: AppText(
                            text: state.errorText,
                            style: AppTextStyle.regular_14,
                            textColor: Palette.red_FF0606,
                          ),
                        ),
            ]
          
            
          ],
        );
        
      },



    );
  }
}