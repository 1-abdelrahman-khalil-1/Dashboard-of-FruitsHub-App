import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashboard/Core/errors/Customexception.dart';
import 'package:dashboard/Core/service/storage_service.dart';
import 'package:dashboard/Feature/MainScreen/data/repo/productrepo.dart';

class Productrepoimpl implements Productrepo {
  final StorageService supabase;

  Productrepoimpl({required this.supabase});
  @override
  Future<Either<String, String>> uploadFile({required File file, required String fileName}) async {
    try {
      final String imageUrl = await supabase.uploadFile(file, "Images/$fileName");
      log("Image uploaded successfully : $imageUrl");
     return right(imageUrl);
    } catch (e) {
      log("Failed to upload Image in Productrepoimpl : $e imageUrl");
     return left("Can't upload image please try again");
    }
  }

  @override
  Future<Either<String,void>> uploadData({required Map<String, dynamic> data}) async {
    try {
     await supabase.uploadData(data: data);
      log("Data uploaded successfully");
      return right(null);
    }on Customexception catch (e) {
      log("Failed to upload Data in Productrepoimpl : $e");
     return left(e.message);
    }
  }
}
