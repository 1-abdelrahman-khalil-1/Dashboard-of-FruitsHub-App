import 'package:dashboard/Core/service/get_it_setup.dart';
import 'package:dashboard/Feature/MainScreen/data/repo/productrepo.dart';
import 'package:dashboard/Feature/MainScreen/presentation/cubit/product_cubit.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/customtextform.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/mainscreen_body_bloc_consumer.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/mainscreenbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<Productrepo>()),
      child: const MainscreenBodyBlocConsumer(),
    );
  }
}
