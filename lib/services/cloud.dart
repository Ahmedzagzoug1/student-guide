import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {


  /*static Future<List<FirebaseFile>> listAll (String path)async{
    final ref=FirebaseStorage.instance.ref("");
    final result=await ref.listAll();
    final List<String> urls= _getDownloadLinks(result.items) as List<String>;
    return urls.asMap().map((index, url){
      final ref = result.items[index];
      final name =ref.name;
      final file =FirebaseFile(ref: ref, name: name, url: url);
      return MapEntry(index, file);
    }).values.toList();
    //return urls.asStream().map((event) => null);
  }*/

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
    Future.wait(  refs.map((ref) => ref.getDownloadURL()).toList());

   Future<List<Map<String, dynamic>>> loadFiles(String path) async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await FirebaseStorage.instance.ref(path).list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();

      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "name" : file.name

      });
    });

    return files;
  }

}
