import 'package:dashboard/Core/helperFunctions/bar.dart';
import 'package:dashboard/Core/helperFunctions/dialogloading.dart';
import 'package:dashboard/Feature/MainScreen/presentation/cubit/product_cubit.dart';
import 'package:dashboard/Feature/MainScreen/presentation/cubit/product_cubit_states.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/mainscreenbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainscreenBodyBlocConsumer extends StatelessWidget {
  const MainscreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductCubitStates>(
      listener: (context, state) { 
      if (state is LoadingState) {
        DialogLoading(context);
      }else {
        Navigator.pop(context);
      }
       if (state is SuccessState) {
        bar(context, message: "Product uploaded successfully");
       } else if (state is ErrorState) {
        bar(context, message: state.message);
      } 
     
      },
      builder: (context, state) {
        return const SafeArea(
      child: Scaffold(
        body: Mainscreenbody(),
      ),
    );
      },
    );
  }
}