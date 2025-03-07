import 'package:dashboard/Core/utils/assets/appcolors.dart';
import 'package:dashboard/Core/utils/assets/fontasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,  required this.text, this.onpressed,
    
  });


  final String text;
  final onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onpressed,
      child: Container(
       width: 343.w,
       padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
       decoration: ShapeDecoration(
         color: Appcolors.kgreen,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16.r),
         ),
       ),
       child: Text(
             text,
             textAlign: TextAlign.center,
             style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
           ),
              ),
    );
  }
}
