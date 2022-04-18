// import 'dart:ffi';





import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hivedb/function/student_funtion.dart';
import 'package:hivedb/list_student_widjet.dart';
import 'package:hivedb/model/studentmodel.dart';
import 'package:image_picker/image_picker.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {


  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _stdController = TextEditingController();

  final _gradeController = TextEditingController();

  var _image;
 
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Color.fromARGB(255, 165, 3, 103),
        ],
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Students')),
          flexibleSpace: Container(
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 41, 150, 68),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            //name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 71, 5, 80), width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fillColor: Color.fromARGB(255, 210, 219, 213),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Name'),
              ),
            ),

            SizedBox(height: 10),

            //age keyboardType: TextInputType.number

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType:TextInputType.number ,
                controller: _ageController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 210, 219, 213),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Age'),
              ),
            ),

            SizedBox(height: 10),

            //class

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _stdController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 210, 219, 213),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Std'),
              ),
            ),

            SizedBox(height: 10),

            //grade

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _gradeController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 210, 219, 213),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Grade'),
              ),
            ),

            SizedBox(height: 10),
            //elevated button upload image
            ElevatedButton.icon(
              onPressed: () {

                showAlertDialog(context);



              },
              icon: Icon(Icons.image),
              label: Text('UPLOAD YOUR IMAGE'),
            ),
            //elevated button add
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
      content: Text("Students details added"),
    ));
                    onStudentbtnClicked();
                  },
                  icon: Icon(Icons.add),
                  label: Text('ADD'),
                ),
                SizedBox(width: 10),

// elevated btn viewlist

                ElevatedButton.icon(
                  onPressed: () {
    //                     ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
    //   content: Text("Studetn details added"),
    // ));
                  
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentList()),
                    );
                  },
                  icon: Icon(Icons.list),
                  label: Text('viewlist'),
                ),
              ],
            ),

            Container(
                width: 100,
                height: 100,
                child: SvgPicture.asset(
                  'assets/studentwithbooks.svg',
                )
                // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/studentwithbooks.svg'))),
                )
          ],
        ),
      ),
    );
  }

  Future<void> onStudentbtnClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _std = _stdController.text.trim();
    final _grade = _gradeController.text.trim();

    if (_name.isEmpty || _age.isEmpty || _std.isEmpty || _grade.isEmpty) {
      return;
    } else {
      //calling the studentmodel constructor and passing the value to _student
      final _student =
          StudentModel(name: _name, age: _age, std: _std, grade: _grade, image: _image);
      //giving the stored student to addStudent
      addStudent(_student);
    }
  }

  //upload image
  showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget galleryButton = IconButton(
    icon: Icon(Icons.image),
    onPressed:  () async{

      var image =await getFromGallery();
      Navigator.of(context).pop();

     setState(() {
       _image=image;
     });

    },
  );
  Widget cameraButton = IconButton(
    icon: Icon(Icons.camera_alt_rounded),
    onPressed:  ()async {
      var camera =await getFromCamera();
      Navigator.of(context).pop();

     setState(() {
       _image=camera;
     });

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Choose"),
    content: Text(""),
    actions: [
      galleryButton,
      cameraButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Get from gallery
//  Future getFromGallery() async {
//    XFile? img =
//    await ImagePicker().pickImage(source: ImageSource.gallery);

//    return img!.path;
      
//     }
//   }
// // Get from Camera
//  Future getFromCamera() async {
//    XFile? img =
//    await ImagePicker().pickImage(source: ImageSource.gallery);

//    return img!.path;
      
          

//   }
  

}