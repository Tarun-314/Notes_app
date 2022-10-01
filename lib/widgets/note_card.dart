
import 'package:notes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
String path="";
Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc){
  path=doc['ipath'];
  return InkWell(
    onTap: onTap,
      child:Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Appstyle.cardsColor[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0),
        ) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:Text(
              doc['note_title'],
              style: Appstyle.mainTitle,
            ),
            ),
            SizedBox(height: 4.0,),
            if(path!="") buildFileImage(),
            if(path=="")SizedBox(height: 4.0,),
            if(path=="")Text(doc['creation_date'],style: Appstyle.mainTitle,),
            if(path=="")SizedBox(height:8.0),
            if(path=="")Text(doc['note_content'],style: Appstyle.mainContent,
            overflow: TextOverflow.ellipsis ,
              maxLines: 3,
            ),
          ],
        ),
      ),
  );
}
Widget buildFileImage(){
  return
    Center(
      widthFactor: 40.0,
      child:Container(

          child:ClipRRect(
            borderRadius: BorderRadius.circular(16),
            
            child:Image.file(
              File(path),
              height: 115,
              width: 100,


            ),
          ),
        ),

    );
}