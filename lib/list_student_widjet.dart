import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/avd.dart';
import 'package:hivedb/editScreen.dart';
import 'package:hivedb/function/student_funtion.dart';
import 'package:hivedb/student_profile.dart';

import 'model/studentmodel.dart';
import 'update_popup.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 70, 218, 107),
              const Color(0xFF00CCFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList[index];

                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => StudentProfile(index: index))));
                  },
                  leading:
                   CircleAvatar(
                    backgroundImage: FileImage(File(data.image)),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.name,
                      ),
                      Text(
                        data.std,
                      ),
                      Text(
                        data.grade,
                      ),
                    ],
                  ),
                  subtitle: Text(data.age),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // editStudent(index);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PopupScreen(
                                      index: index,
                                    )),
                          );
                        },
                        icon: const Icon(Icons.edit,
                            color: Color.fromARGB(255, 57, 54, 244)),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Alert Dialog Box"),
                  content: Text("Do you want to delete"),
                  actions: <Widget>[
                       FlatButton(
                      onPressed: () {
                      Navigator.of(ctx).pop();
                       // deleteStudent(index);
                      },
                      child: Text("no"),
                    ),
                    FlatButton(
                      onPressed: () {
                      //  Navigator.of(ctx).pop();
                        deleteStudent(index);
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Yes"),
                    ),
                   
                  ],
                ),
              );
                         // deleteStudent(index);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: studentList.length,
            );
          },
        ),
      ),
    );
  }
  //update btn

}
