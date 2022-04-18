// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hivedb/function/student_funtion.dart';

// import 'model/studentmodel.dart';

// class EditScreen extends StatefulWidget {
//   EditScreen({Key? key}) : super(key: key);

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//    final _updateNameController = TextEditingController();
//   final _updateAgeController = TextEditingController();
//   final _updateStdController = TextEditingController();
//   final _updateGradeController = TextEditingController();

//   var _image;
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// Future<void> displayTextInputDialog(BuildContext context,int index) async {
 
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Updation'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               //Name Change
//               TextField(
//                 onChanged: (value) {
     
//                 },
//                 controller: _updateNameController,
//                  decoration: InputDecoration(hintText: "ENTER Name"),
//               ),

//               // Age change
//                 TextField(
//                 onChanged: (value) {
     
//                 },
//                 controller: _updateAgeController,
//                  decoration: InputDecoration(hintText: "ENTER Age"),
//               ),

//               //Std change
//                TextField(
//                 onChanged: (value) {
     
//                 },
//                 controller: _updateStdController,
//                  decoration: InputDecoration(hintText: "ENTER Std"),
//               ),

//               //grade change
//                TextField(
//                 onChanged: (value) {
     
//                 },
//                 controller: _updateGradeController,
//                  decoration: InputDecoration(hintText: "ENTER Grade"),
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton.icon(onPressed: (){

//                     //UPDATE old with new function


//                 //]    onUpdateBtnClicked(index);
      



//                   }, icon: Icon(Icons.done), label: Text('SUBMIT')
//                   ),



//                   ElevatedButton.icon(onPressed: ()async {
//       var camera =await getFromCamera();
//       Navigator.of(context).pop();

//      setState(() {
//        _image=camera;
//      });

//     }, icon: Icon(Icons.image), label: Text('ADD IMAGE'))
//                 ],
//               )
//             ],
//           )

//         );
//       });
// }
// //update btn clicked funcntion
// //  Future<void> onUpdateBtnClicked(int index) async {
// //     final _updateName = _updateNameController.text.trim();
// //     final _updateAge = _updateAgeController.text.trim();
// //     final _updateStd = _updateStdController.text.trim();
// //     final _updateGrade = _updateGradeController.text.trim();

// //     if (_updateName.isEmpty || _updateAge.isEmpty || _updateStd.isEmpty || _updateGrade.isEmpty) {
// //       return;
// //     } else {
// //       // //calling the studentmodel constructor and passing the value to _student
// //       final _updateStudent =
// //        //   StudentModel.updateWithoutImage(name: _updateName, age: _updateAge, std: _updateStd, grade: _updateGrade,);
// //       // //giving the stored student to addStudent
// //     //  UpdateAddStudent(_updateStudent, index);
   
// //     }
//  }


// Future<void> UpdateAddStudent (StudentModel valuest,int id)async{


//  final studentDB =await Hive.openBox<StudentModel>('student_db');
// // final _id =await studentDB.put(valuest);
// //  valuest.id=_id;
// final key=studentDB.keys;
// final savedKey=key.elementAt(id);
//   final _id =await studentDB.put(savedKey,valuest);
//   // valuest.id=_id;
//   studentListNotifier.notifyListeners();
  
// getAllStudents();
// }

  
// //}