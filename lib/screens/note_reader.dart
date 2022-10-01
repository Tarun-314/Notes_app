import 'dart:io';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/screens/editer.dart';
import 'package:notes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/full_image.dart';
class NoteReaderScreen extends StatefulWidget {
   NoteReaderScreen(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    String pathi=widget.doc['ipath'];
    int color_id=widget.doc['color_id'];
    return Scaffold(
      backgroundColor: Appstyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: Appstyle.cardsColor[color_id],
        elevation:0.0,

       actions: <Widget>[
         Padding(padding: EdgeInsets.only(right: 20.0),
           child:GestureDetector(
            onTap: ()async {
              widget.doc.reference.delete().whenComplete(() => Navigator.pop(context));
            } ,
           child: const Icon(Icons.delete),



    ),

         )
       ],
      ),
     body: SingleChildScrollView(
       child:Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           if(pathi!="") buildFileImage(),
           SizedBox(height: 20,),
           Text(
             widget.doc["note_title"],
             style: Appstyle.mainTitle,
           ),
           const SizedBox(height: 4.0,),
           Text(widget.doc["creation_date"],style: Appstyle.mainTitle,),
           const SizedBox(height:28.0),
           Text(widget.doc["note_content"],style: Appstyle.mainContent,
             maxLines: null,
           ),
         ],
       ),

     ),
     ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=> editer(widget.doc))).whenComplete(() => Navigator.pop(context));

          },
        
          child:Icon(Icons.edit),
      ),
    );
  }
  Widget buildFileImage(){
    return
      Center(
        child : Stack(

            children:[

              CircleAvatar(
                radius: 120,
                child : ClipOval(
                  child: Image.file(
                    File(widget.doc['ipath']),
                    width: 240,
                    height: 240,
                    fit: BoxFit.cover,

                  ),
                ),
              ),
              // Padding(padding: EdgeInsets.all(8.0),
                Positioned(
                    bottom: 20,
                    right: 20,
                    
                    child:Padding(padding: EdgeInsets.all(5.0),
                      
                      child:IconButton(
                      icon: Icon(Icons.zoom_in_rounded),
                      color: Colors.white,
                      padding: EdgeInsets.all(5.0),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> fullimage(widget.doc['ipath'])));
                      },
                    )
                        
                ),
              ),
            ]
        ),

      );
  }
}
