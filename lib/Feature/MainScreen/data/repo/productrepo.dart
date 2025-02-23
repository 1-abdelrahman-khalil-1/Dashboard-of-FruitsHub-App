import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class Productrepo {
  Future<Either<String,String>> uploadFile({required File file,required String fileName});
  Future<Either<String,void>> uploadData({required Map<String ,dynamic> data});
}