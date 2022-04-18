


import 'package:hive_flutter/hive_flutter.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {


@HiveField(0)
  int? id;
@HiveField(1)
  final String name;

@HiveField(2)
  final String age;

@HiveField(3)
  final String std;


@HiveField(4)
  final String grade;

  @HiveField(5)
   var image;


  StudentModel({required this.name, required this.age,required this.std,required this.grade, this.id, this.image});

 // StudentModel.updateWithoutImage({required this.name, required this.age, required this.std, required this.grade});
}