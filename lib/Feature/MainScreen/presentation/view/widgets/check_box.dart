
import 'package:dashboard/Core/utils/assets/appcolors.dart';
import 'package:dashboard/Core/utils/assets/fontasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Check_box extends StatefulWidget {
  const Check_box({super.key,  this.onChanged, required this.text});
  final  void Function(bool?)? onChanged;
 final String text;
  @override
  State<Check_box> createState() => _Check_boxState();
}

class _Check_boxState extends State<Check_box> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: AppTextStyles.bold13),
        Checkbox(
          value: check,  
          fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (check == false) {
              return Colors.white;
            }
            return Appcolors.kgreen;
          
          }),
          onChanged: (value) {
            setState(() {
              check = value!;
            });
          widget.onChanged?.call(value);
          },
          // focusColor: Appcolors.kgreen,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ],
    );
  }
}
