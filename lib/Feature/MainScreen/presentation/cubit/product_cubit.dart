import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashboard/Feature/MainScreen/data/repo/productrepo.dart';
import 'package:dashboard/Feature/MainScreen/presentation/cubit/product_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductCubitStates> {
  ProductCubit(this._productrepo) : super(InitalState());
  final Productrepo _productrepo;
  late String url;

  Future<void> uploadImage(
      {required File file, required String filename}) async {
    emit(LoadingState());

    Either<String, String> imageurl = await _productrepo.uploadFile(
        file: file, fileName: "${DateTime.now()}$filename");
    imageurl.fold((e) {
      emit(ErrorState(message: e));
    }, (succes) {
      url = succes;
      emit(SuccessState());
    });
  }

  Future<void> uploadData({required Map<String, dynamic> data}) async {
    emit(LoadingState());
    data["imageUrl"] = url;
     var result = await _productrepo.uploadData(data: data);
     result.fold((e){
      emit(ErrorState(message: e));
     } ,(s){
       emit(SuccessState());
     });
  }
}
