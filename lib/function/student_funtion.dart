import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hivedb/screenhome.dart';
import '../model/studentmodel.dart';



ValueNotifier< List<StudentModel> > studentListNotifier =ValueNotifier([]);
  final _updateNameController = TextEditingController();
  final _updateAgeController = TextEditingController();
  final _updateStdController = TextEditingController();
  final _updateGradeController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  var image;



Future<void> addStudent (StudentModel valuest)async{


 final studentDB =await Hive.openBox<StudentModel>('student_db');
 final _id =await studentDB.add(valuest);
 valuest.id=_id;
  studentListNotifier.value.add(valuest);
  studentListNotifier.notifyListeners();
  
getAllStudents();
}

Future <void> getAllStudents()async{
 final studentDB =await Hive.openBox<StudentModel>('student_db');
studentListNotifier.value.clear();
 studentListNotifier.value.addAll(studentDB.values);
studentListNotifier.notifyListeners();

}

 
Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
final key=studentDB.keys;
final saved_key=key.elementAt(id);
  await studentDB.delete(saved_key);

  getAllStudents();
}
//alertbox for updating

// Get from gallery
 Future getFromGallery() async {
   XFile? img =
   await ImagePicker().pickImage(source: ImageSource.gallery);

   return img!.path;
      
    }
  
// Get from Camera
 Future getFromCamera() async {
   XFile? img =
   await ImagePicker().pickImage(source: ImageSource.camera);

   return img!.path;
      
          

  }
  picImageSelection(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Open'),
          content: SingleChildScrollView(
            child: ListBody(children: [
              GestureDetector(
                child: Text('Camera'),
                onTap: () async {
                  XFile? img =
                      await imagePicker.pickImage(source: ImageSource.camera);
                   image = File(img!.path);
                  Navigator.of(context).pop();
                },
              ),
              Padding(padding: EdgeInsets.all(10)),
              GestureDetector(
                child: Text('Gallery'),
                onTap: () async {
                  XFile? img =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  image = File(img!.path);
                  Navigator.of(context).pop();
                },
              )
            ]),
          ),
        );
      });
}

//update student
Future<void> updateStudent( StudentModel value, var index) async {
 // print(' the index ins $index');
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final keys = studentDB.keys;
  final key = keys.elementAt(index);
  await studentDB.put(key, value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  getAllStudents();
  
}




  

  



