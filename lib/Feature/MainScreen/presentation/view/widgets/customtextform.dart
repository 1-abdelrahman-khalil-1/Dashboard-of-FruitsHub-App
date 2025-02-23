import 'package:dashboard/Core/utils/assets/appcolors.dart';
import 'package:dashboard/Core/utils/assets/fontasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hinttext,

    required this.textInputType,required this.onSaved,required this.validator, required this.controller, required this.maxline,  this.textInputFormatter ,
  });
  final String hinttext;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final  FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final int maxline;
  final List<TextInputFormatter>? textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: textInputFormatter,
      maxLines: maxline,
      controller: controller,
      onSaved: onSaved,
      validator:  validator,
        keyboardType: textInputType,
        decoration: InputDecoration(
            label: Text("    $hinttext",
                style: AppTextStyles.bold13.copyWith(color: Appcolors.kgrey )),
            fillColor: const Color.fromARGB(181, 249, 250, 250),
            filled: true,     
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(
                color: Colors.redAccent
              ),
            ),                                                       
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFE6E9E9),
              ),
            )));
  }
}
