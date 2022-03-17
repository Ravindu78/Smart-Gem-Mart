
import 'dart:io';

import 'package:smart_gem_mart/reusable_widgets/reusable_widget.dart';
import 'package:smart_gem_mart/screens/home_screen.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/reusable_widgets/addpostdetails.dart';
import '../getpost.dart';
import '../utils/color_utils.dart';
import 'package:smart_gem_mart/reusable_widgets/adduserdetails.dart';
import 'package:smart_gem_mart/screens/signin_screen.dart';
import 'package:file_picker/file_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController _varientNameController = TextEditingController();
  TextEditingController _varientColorController = TextEditingController();
  TextEditingController _cuttingShapeController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _imgUrlController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  File? file;
  late String imagePath;
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Enter Details To Post",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

          //=========ADDING ADVERTISMENT FIELDS TI FILL=========

          child: SingleChildScrollView(
            
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("Choose The Varient", Icons.lock_outline, false, false, _varientNameController,'Choose The Varient'),),
                          PopupMenuButton(
                            onSelected: (value) { setState(() { _varientNameController.text = value.toString(); }); },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value:'Blue Sapphire',
                                child: ListTile(
                                  title: Text('Blue Sapphire'),

                                ),
                              ),
                              const PopupMenuItem(
                                value:'Ruby',
                                child: ListTile(
                                  title: Text('Ruby'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Garnet',
                                child: ListTile(
                                  title: Text('Garnet'),
                                ),
                              ),

                            ],
                          ),

                        ],

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("Choose The Color", Icons.lock_outline, false, false, _varientColorController, 'Choose the color'),),
                          PopupMenuButton(
                            onSelected: (value) { setState(() { _varientColorController.text = value.toString(); }); },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value: 'sky blue',
                                child: ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text('sky blue'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'royal blue',
                                child: ListTile(
                                  leading: Icon(Icons.anchor),
                                  title: Text('royal blue'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'thik blue',
                                child: ListTile(
                                  leading: Icon(Icons.article),
                                  title: Text('thik blue'),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("Choose The Cutting Shape", Icons.lock_outline, false, false, _cuttingShapeController, 'Choose the cutting shape')),
                          PopupMenuButton(
                            onSelected: (value) { setState(() { _cuttingShapeController.text = value.toString(); }); },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value: 'oval',
                                child: ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text('oval'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'heart',
                                child: ListTile(
                                  leading: Icon(Icons.anchor),
                                  title: Text('heart'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'round',
                                child: ListTile(
                                  leading: Icon(Icons.article),
                                  title: Text('round'),
                                ),
                              ),

                            ],
                          ),

                        ],

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField4(
                              " weight", Icons.lock_outline, false,true, _weightController,'Please Enter the weight',r'[+-]?([0-9]*[.])?[0-9]+','Enter valid Weight'),),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("more details", Icons.lock_outline, false,true, _descriptionController,'Enter Details'),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField4("price", Icons.lock_outline, false,true, _priceController,'Enter the price',r'(^\d{0,8}(\.\d{1,4})?$)', 'Enter a Valid Price'),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                     // Row(
                       // children: [
                         // Expanded(child: reusableTextField4("Email", Icons.lock_outline, false,true,_emailController,'Enter your Email',r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",'Enter a valid email')),
                        //]/,
                      //),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (){
                                selectImage();
                              },
                              child: Text('Select Image'),
                            ),
                          ),
                          Expanded(
                            child: (file==null)? Center(child: Text('Select an Image'),) : Image.file(file!),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("address", Icons.lock_outline, false, true, _locationController,'Enter your address'),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField4("phone", Icons.lock_outline, false,true, _phoneController,'Enter your phone numuber', r'(^(?:[+0]9)?[0-9]{10,12}$)', 'Enter a valid Number'),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      firebaseUIButton(context, "Post", () {
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          AddPost(_varientNameController.text,_varientColorController.text,_cuttingShapeController.text,_weightController.text,_descriptionController.text,
                              _priceController.text, _emailController.text,_imgUrlController.text,_locationController.text,_phoneController.text,file!.path).uploadImage();
                        }
                        else
                          return null;
                      },

                      ),
                    ],

                  ),
                ),
              ))),
    );
  }

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result==null) return;
    imagePath = result.files.single.path!;
    setState(() {
      file = File(imagePath);
    });
  }

}