import 'dart:developer';
import 'dart:io';

import 'package:dashboard/Core/errors/Customexception.dart';
import 'package:dashboard/Core/service/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements StorageService {
 static late Supabase _supabase ;
  
  static Future<void> init() async{
   _supabase = await Supabase.initialize(
      url: 'https://tlxazsbcnzpviobfefme.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRseGF6c2JjbnpwdmlvYmZlZm1lIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczODc0Nzc4MiwiZXhwIjoyMDU0MzIzNzgyfQ.2U5zi4F1et-aLZxp_NwX005yAlnCGwxMa3lHpy0wRfo',
    );
  }
  @override
  Future<String> uploadFile(File file, String fileName) async {
     try {
     await _supabase.client.storage.from('Products Collection').upload(
          fileName,
          file,   
        );

    final imageUrl = _supabase.client.storage.from('Products Collection').getPublicUrl(fileName);
    return imageUrl;
  } catch (e) {
    log('Error uploading image Supabase Storage: $e');
    throw Customexception(message: "Can't upload image please try again");
  }
  }
  
  @override
  Future<void> uploadData({required Map<String, dynamic> data}) async {
    try {
      await _supabase.client.from("Products Collection").insert(data);
    } catch (e) {
      log('Error uploading data Supabase Storage: $e');
      if (e is SocketException) {
      throw Customexception(message: "Can't upload data. No Internet Connection.");
    } else if (e is PostgrestException) {
      throw Customexception(message: "Can't upload data. duplicate ProductID value");
    } else if (e is AuthException) {
      throw Customexception(message: "Can't upload data. Authentication Failed.");
    } else if (e is StorageException) {
      throw Customexception(message: "Can't upload data. Storage Error: ${e.message}");
    } else if (e is FormatException) {
      throw Customexception(message: "Can't upload data. Data Format Error.");
    } else if (e is TypeError) {
      throw Customexception(message: "Can't upload data. Type Mismatch Error.");
    } else {
      throw Customexception(message: "Can't upload data. Unexpected Error: $e");
    }
    }
  }
}