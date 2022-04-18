import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:hive1/db/db_functions/db_functions.dart';
// import 'package:hive1/screens/addst.dart';
// import 'package:hive1/screens/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedb/function/student_funtion.dart';
import 'package:hivedb/model/studentmodel.dart';
import 'package:image_picker/image_picker.dart';

// import '../model/model.dart';

class PopupScreen extends StatelessWidget {
  var image;
  int index;
  PopupScreen({Key? key, required this.index}) : super(key: key);
  final _updateNameController = TextEditingController();
  final _updateAgeController = TextEditingController();
  final _updateStdController = TextEditingController();
  final _updateGradeController = TextEditingController();

  Widget ver10 = const SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          final data = studentList[index];
          _updateNameController.text = data.name;
          _updateAgeController.text = data.age;
          _updateStdController.text = data.std;
          _updateGradeController.text = data.grade;

          return Scaffold(
              body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextField(
                        onChanged: (value) {},
                        controller: _updateNameController,
                        decoration: const InputDecoration(hintText: " Name"),
                      ),
                      ver10,
                      // Age change
                      TextField(
                        onChanged: (value) {},
                        controller: _updateAgeController,
                        decoration: const InputDecoration(hintText: " Age"),
                      ),

                      //Std change
                      TextField(
                        onChanged: (value) {},
                        controller: _updateStdController,
                        decoration: const InputDecoration(hintText: " Std"),
                      ),

                      //grade change
                      TextField(
                        onChanged: (value) {},
                        controller: _updateGradeController,
                        decoration:
                            const InputDecoration(hintText: "ENTER Grade"),
                      ),
                      ver10,
                      SizedBox(
                        width: 350,
                        height: 55,
                        child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () async {
                              XFile? img =await imagePicker.pickImage(source: ImageSource.camera);
                           if(img==null){
                             img=studentListNotifier.value[index].image;
                           }else{
                             image=img.path;
                           }
                            },
                            child: const Text('Change profile picture')),
                      ),
                      ver10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('CANCEL')),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                onUpdateBtnClicked(context, index);
                              },
                              child: const Text('OK')),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ]),
                  )));
        });
  }

  Future<void> onUpdateBtnClicked(BuildContext context, int index) async {
    final _name = _updateNameController.text.trim();
    final _age = _updateAgeController.text.trim();
    final _std = _updateStdController.text.trim();
    final _grade = _updateGradeController.text.trim();
    final update = StudentModel(
      name: _name,
      age: _age,
      std: _std,
      grade: _grade,
      image: image,
    );

    updateStudent(update, index);
    Navigator.of(context).pop();
  }
}
