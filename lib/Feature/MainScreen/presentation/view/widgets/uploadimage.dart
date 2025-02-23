import 'dart:io';
import 'package:dashboard/Core/service/get_it_setup.dart';
import 'package:dashboard/Core/utils/assets/appcolors.dart';
import 'package:dashboard/Feature/MainScreen/data/repo/productrepo.dart';
import 'package:dashboard/Feature/MainScreen/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path; 
class Uploadimage extends StatefulWidget {
  const Uploadimage({super.key, required this.onImageSelected, required this.onImageRemoved});
   final VoidCallback onImageSelected , onImageRemoved;
  @override
  State<Uploadimage> createState() => _UploadimageState();
}

class _UploadimageState extends State<Uploadimage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final Productrepo _storagerepo = getIt.get<Productrepo>();
  Future<void> _pickImage() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          String filename = path.basename(pickedFile.path);
          context.read<ProductCubit>().uploadImage(file: _image! , filename: filename);
          widget.onImageSelected();
        });
      }
      
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image == null
            ? const Text("No image selected.")
            : Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Appcolors.kgrey),
                child: Stack(children: [
                  Positioned.fill(
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _image = null;
                          widget.onImageRemoved;
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ])),
        ElevatedButton(
          onPressed: _pickImage
          ,
          child: const Text("Add Product's Image"),
        ),
      ],
    );
  }
}
