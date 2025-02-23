import 'package:dashboard/Core/service/storage_service.dart';
import 'package:dashboard/Core/service/supabase_storage.dart';
import 'package:dashboard/Feature/MainScreen/data/repo/productrepo.dart';
import 'package:dashboard/Feature/MainScreen/data/repo/productrepoImpl.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;
void get_it_setup(){
  getIt.registerSingleton<StorageService>(SupabaseStorage());
  getIt.registerSingleton<Productrepo>(Productrepoimpl(supabase: getIt.get<StorageService>()));
}