import 'package:dashboard/Core/service/get_it_setup.dart';
import 'package:dashboard/Core/service/supabase_storage.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   get_it_setup();
 await SupabaseStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Cairo" ),
        home: const Mainscreen(),
      ),
    );
  }
}
