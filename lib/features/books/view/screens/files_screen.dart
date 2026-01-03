import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:student_guide/features/books/view/screens/pdfviewer.dart';

import '../../../../core/services/cloud.dart';
class FilesScreen extends StatefulWidget {
  static const String routeName = 'files';
  final   String  title;

  const FilesScreen({Key? key,  required this.title}) : super(key: key);

  @override
  _FilesScreenState createState() => _FilesScreenState(title);

}

class _FilesScreenState extends State<FilesScreen> {
  FirebaseStorageService storageService=FirebaseStorageService();
  late Future<ListResult> futureFiles;

  final   String  title;

  _FilesScreenState(this.title);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureFiles=  FirebaseStorage.instance.ref(getLinks()).listAll();



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text(title)
    ),

       body :FutureBuilder<ListResult>(
          future:futureFiles ,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError) {
                return  Center(
                  child: Text('${snapshot.error}'),
                );
              }else {
                final files = snapshot.data!.items;
                return ListView.builder(

                  shrinkWrap: true,
                  itemCount: files.length ,
                  itemBuilder: (context, index) {
                    final  file =
                    files[index] ;

                    return ListTile(

                      title: Text(file.name,

                    )
                          ,onTap: (){

                        final path=file.fullPath;

                       final _file= File(path);
                        if(file !=null)
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewerScreen(file : _file,)));

                    },
                    );
                  },

                );

              }
            }else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );

    }
  getLinks ( ){
    String link  ='' ;
    switch(title){
      case "Computer Architecture" :
       link =  'Fourth/computer_architecture';
        break ;
      case "CAD" :
        link =  'Fourth/CAD';
        break ;
       // subjects.addAll(['Fourth/computer_archecture' , 'CAD','Software Engineering','Embedded System','Interfaces','AI']);

      case "Software Engineering" :
        link =  'Fourth/Software_Engineering';
        break ;
      case "Embedded System" :
        link =  'Fourth/Embedded_System';
        break ;
      case "Interfaces" :
        link =  'Fourth/Interfaces';
        break ;
      case "AI" :
        link =  'Fourth/AI';
        break ;
        // "Compiler" ,"Security","Advenced Programing","Digital Communication", "Networks" ,
      case "Compiler" :
        link =  'Fourth/Compiler';
        break ;
      case "Security" :
        link =  'Fourth/Security';
        break ;
      case "Advenced Programing" :
        link =  'Fourth/Advenced_Programing';
        break ;
      case "Digital Communication" :
        link =  'Fourth/Digital Communication';
        break ;
      case "Networks" :
        link =  'Fourth/Networks';
        break ;
      case "LAB":
        link= 'Forth/LAB';

            break;

    /*
      case "1":
        subjects.addAll(["Maths 1" , 'Circits','Programing','Health','Labs','Electroncis']);
        break;
      case "2" :
        subjects.addAll(["Maths 3" , 'OOP','IC','signle','Math 4','Machine']);

        break;
      case "3":
        subjects.addAll(["Queue" , 'Control','Communications','Database','OS','Sensors']);
        break;
      case "4" :
      case "0" :
        subjects.addAll(['Fourth/computer_archecture' , 'CAD','Software Engineering','Embedded System','Interfaces','AI']);

        break;
        */
    }
    return link;
  }
}
