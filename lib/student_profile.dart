import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hivedb/function/student_funtion.dart';
import 'package:hivedb/model/studentmodel.dart';
// import 'package:myapp/functions/functions.dart';

// import 'functions/studentmodel.dart';

class StudentProfile extends StatelessWidget {
  Widget style = Divider(
    color: Color.fromARGB(255, 13, 150, 224),
    thickness: 1,
    indent: 10,
    endIndent: 10,
  );
  final  index;
   StudentProfile({ Key? key,required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext ctx, List<StudentModel> studentlist,
                Widget? child) { {
                  final data=studentlist[this.index];
        return Scaffold(
          appBar: AppBar(title: Text('STUDENT PROFILE'),),
          body: SafeArea(child: Column(
            children: [
              data.image!=null?
             CircleAvatar(backgroundImage: FileImage(File(data.image)),
             radius: 100,):
             Image(image: AssetImage('')),


              SizedBox(height: 30,),display('NAME:', data.name.toUpperCase()),
              SizedBox(height: 30,),display('AGE:', data.age.toUpperCase()),
              SizedBox(height: 30,),display('BRANCH:', data.std.toUpperCase()),
              SizedBox(height: 30,),display('MARK:', data.grade.toUpperCase()),

            ],
            
          )),
          
        );
      }
      });
  }

Widget display(field,data){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(field,style: TextStyle(fontSize: 30),),
      SizedBox(
        width: 10,
      ),
      Text(data,style: TextStyle(fontSize: 30),)
    ],
  );
}




}