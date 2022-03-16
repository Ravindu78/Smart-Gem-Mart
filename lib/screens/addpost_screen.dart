
import 'package:smart_gem_mart/reusable_widgets/reusable_widget.dart';
import 'package:smart_gem_mart/screens/home_screen.dart';
import 'package:smart_gem_mart/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/reusable_widgets/addpostdetails.dart';
import '../getpost.dart';
import '../utils/color_utils.dart';
import 'package:smart_gem_mart/reusable_widgets/adduserdetails.dart';
import 'package:smart_gem_mart/screens/signin_screen.dart';

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
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("Choose The Varient", Icons.lock_outline, false, false, _varientNameController),),
                        PopupMenuButton(
                          onSelected: (value) { setState(() { _varientNameController.text = value.toString(); }); },
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                              value:'Blue Sapphire',
                              child: ListTile(
                                leading: Icon(Icons.add),
                                title: Text('Blue Sapphire'),

                              ),
                            ),
                            const PopupMenuItem(
                              value:'Ruby',
                              child: ListTile(
                                leading: Icon(Icons.anchor),
                                title: Text('Ruby'),
                              ),
                            ),
                            const PopupMenuItem(
                              value:'Garnet',
                              child: ListTile(
                                leading: Icon(Icons.article),
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
                        Expanded(child: reusableTextField3("Choose The Color", Icons.lock_outline, false, false, _varientColorController),),
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
                        Expanded(child: reusableTextField3("Choose The Cutting Shape", Icons.lock_outline, false, false, _cuttingShapeController)),
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
                        Expanded(child: reusableTextField3(" weight", Icons.lock_outline, false,true, _weightController),),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("more details", Icons.lock_outline, false,true, _descriptionController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("price", Icons.lock_outline, false,true, _priceController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("Email", Icons.lock_outline, false,true,_emailController)),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("image", Icons.lock_outline, false, true,_imgUrlController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("address", Icons.lock_outline, false, true, _locationController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("phone", Icons.lock_outline, false,true, _phoneController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Post", () {
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      AddPost(_varientNameController.text,_varientColorController.text,_cuttingShapeController.text,_weightController.text,_descriptionController.text,
                          _priceController.text, _emailController.text,_imgUrlController.text,_locationController.text,_phoneController.text).addPost();
                    },

                    ),
                  ],

                ),
              ))),
    );
  }
}