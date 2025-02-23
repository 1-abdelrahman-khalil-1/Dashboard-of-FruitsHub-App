import 'dart:io';

abstract class StorageService {
  Future<String> uploadFile(File file, String fileName);
  Future<void> uploadData({required Map<String ,dynamic> data});
}
