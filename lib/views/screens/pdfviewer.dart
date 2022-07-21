import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  final File file;
  const PDFViewerScreen({Key? key, required this.file}) : super(key: key);

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState(file);
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
   File file;


  _PDFViewerScreenState( this.file);
  @override
  Widget build(BuildContext context) {
    PDFViewController _controller;
    int _pages=0;
    int indexPage =0;
    return Scaffold(
        appBar: AppBar(title: Text(file.path),)
        ,
        body: PDFView(onError: (error) {
          setState(() {
             Text(error.toString());
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(file.path)));
          });
        },
          onRender: ((pages)=>setState(() =>_pages=pages!
          )),
          onViewCreated: (controller)=>
          setState(() =>_controller =controller)
          ,

          filePath: file.path,
          enableSwipe: true,

          pageFling: false,
          swipeHorizontal: true,

        )

    );
  }}
