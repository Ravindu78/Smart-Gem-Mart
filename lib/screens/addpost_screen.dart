
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
                        Expanded(child: reusableTextField3("Choose The Varient", Icons.lock_outline, false, _varientNameController),),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.add),
                                title: Text('Item 1'),
                              ),
                            ),
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.anchor),
                                title: Text('Item 2'),
                              ),
                            ),
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.article),
                                title: Text('Item 3'),
                              ),
                            ),
                            const PopupMenuDivider(),
                            const PopupMenuItem(child: Text('Item A')),
                            const PopupMenuItem(child: Text('Item B')),
                          ],
                        ),

                      ],

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("Choose The Color", Icons.lock_outline, false, _varientColorController)),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.add),
                                title: Text('Item 1'),
                              ),
                            ),
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.anchor),
                                title: Text('Item 2'),
                              ),
                            ),
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.article),
                                title: Text('Item 3'),
                              ),
                            ),
                            const PopupMenuDivider(),
                            const PopupMenuItem(child: Text('Item A')),
                            const PopupMenuItem(child: Text('Item B')),
                          ],
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("Choose The Cutting Shape", Icons.lock_outline, false, _cuttingShapeController)),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.add),
                                title: Text('Item 1'),
                              ),
                            ),
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.anchor),
                                title: Text('Item 2'),
                              ),
                            ),
                            const PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.article),
                                title: Text('Item 3'),
                              ),
                            ),
                            const PopupMenuDivider(),
                            const PopupMenuItem(child: Text('Item A')),
                            const PopupMenuItem(child: Text('Item B')),
                          ],
                        ),

                      ],

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3(" weight", Icons.lock_outline, false, _weightController),),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("more details", Icons.lock_outline, false, _descriptionController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("Email", Icons.lock_outline, false,_emailController)),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("image", Icons.lock_outline, false, _imgUrlController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("address", Icons.lock_outline, false, _locationController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: reusableTextField3("phone", Icons.lock_outline, false, _phoneController),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Post", () {
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      AddPost(_varientNameController.text,_varientColorController.text,_cuttingShapeController.text,_weightController.text,_descriptionController.text,
                          _emailController.text,_imgUrlController.text,_locationController.text,_phoneController.text).addPost();
                    },

                    ),
                  ],

                ),
              ))),
    );
  }
}