
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_gem_mart/map.dart';
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
  late String  _emailController;
  TextEditingController _imgUrlController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  File? file;
  late String imagePath;
  final _formKey = GlobalKey<FormState>();

@override
void initState() {
    // TODO: implement initState
    super.initState();
    var currentUser = FirebaseAuth.instance.currentUser;


    if (currentUser != null) {
      _emailController=currentUser.email!;
      print(currentUser.email);
    }
  }

  PopupMenuButton reusablePopupmenu(String value1,String value2,String value3,String value4,String value5,String value6,String value7 )
  {
    return  PopupMenuButton(
      onSelected: (value) { setState(() { _varientColorController.text = value.toString(); }); },
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
         PopupMenuItem(
          value: value1,
          child: ListTile(

            title: Text(value1),
          ),
        ),
         PopupMenuItem(
          value: value2,
          child: ListTile(

            title: Text(value2),
          ),
        ),
         PopupMenuItem(
          value: value3,
          child: ListTile(

            title: Text(value3),
          ),
        ),
        PopupMenuItem(
          value: value4,
          child: ListTile(

            title: Text(value4),
          ),
        ),
        PopupMenuItem(
          value: value5,
          child: ListTile(

            title: Text(value5),
          ),
        ),
        PopupMenuItem(
          value: value6,
          child: ListTile(

            title: Text(value6),
          ),
        ),
      ],
    );
  }


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
                          Expanded(child: reusableTextField3("Choose The Varient", Icons.checklist_outlined, false, false, _varientNameController,'Choose The Varient'),),
                          PopupMenuButton(
                            onSelected: (value) { setState(() { _varientNameController.text = value.toString();

                            }); },
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
                                value:'Yellow Sapphire',
                                child: ListTile(
                                  title: Text('Yellow Sapphire'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Emerald',
                                child: ListTile(
                                  title: Text('Emerald'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Padmaraga',
                                child: ListTile(
                                  title: Text('Padmaraga'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Garnet',
                                child: ListTile(
                                  title: Text('Garnet'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Cats Eye',
                                child: ListTile(
                                  title: Text('Cats Eye'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Star Sapphire',
                                child: ListTile(
                                  title: Text('Star Sapphire'),
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
                          Expanded(child: reusableTextField3("Choose The Color", Icons.checklist_outlined, false, false, _varientColorController, 'Choose the color'),),
                          if( _varientNameController.text=='Blue Sapphire')
                           reusablePopupmenu('Velvet','Pastal', 'Peacock','Royal','Indigo','Twilight','Other')
                          else if( _varientNameController.text=='Ruby')
                            reusablePopupmenu('Pastel','Hot Pink', 'Fuchsia','Pigeons Blood','Royal','Other','Other')
                          else if( _varientNameController.text=='Yellow Sapphire')
                              reusablePopupmenu('Fancy Vivid','Fancy Deep', 'Fancy Intense','Fancy Dark','Fancy','Fancy Light','Light')
                          else if( _varientNameController.text=='Emerald')
                              reusablePopupmenu('Very Dark','Dark', 'Medium Dark','Medium','Medium Light','Light','Other')
                              else if( _varientNameController.text=='Padmaraga')
                                  reusablePopupmenu('Light','Medium', 'Dark','....','....','....','....')
                                else if( _varientNameController.text=='Garnet')
                                    reusablePopupmenu('Rose','Topaz', 'Green','Orange','White','Amethyst','Other')
                                  else if( _varientNameController.text=='Cats Eye')
                                      reusablePopupmenu('Clear','Blue', 'Green','Orange','Red','Black','Other')
                                    else if( _varientNameController.text=='Star Sapphire')
                                        reusablePopupmenu('Blue','Ruby', 'Emerald','Yellow','Pink','Orange','Other')
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("Choose The Cutting Shape", Icons.checklist_outlined, false, false, _cuttingShapeController, 'Choose the cutting shape')),
                          PopupMenuButton(
                            onSelected: (value) { setState(() { _cuttingShapeController.text = value.toString(); }); },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value: 'Marqulse',
                                child: ListTile(

                                  title: Text('Marqulse'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Round',
                                child: ListTile(

                                  title: Text('Round'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Trilliant',
                                child: ListTile(

                                  title: Text('Trilliant'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Oval',
                                child: ListTile(

                                  title: Text('Oval'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Pear',
                                child: ListTile(

                                  title: Text('Pear'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Square',
                                child: ListTile(

                                  title: Text('Square'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Octagon',
                                child: ListTile(

                                  title: Text('Octagon'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Emerald Cut',
                                child: ListTile(

                                  title: Text('Emerald Cut'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Baguette',
                                child: ListTile(

                                  title: Text('Baguette'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Tapered Baguette',
                                child: ListTile(

                                  title: Text('Tapered Baguette'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Antique Cushion',
                                child: ListTile(

                                  title: Text('Antique Cushion'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Heart Shape',
                                child: ListTile(

                                  title: Text('Heart Shape'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Briolette',
                                child: ListTile(

                                  title: Text('Briolette'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Cabochon',
                                child: ListTile(

                                  title: Text('Cabochon'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'Princess Cut',
                                child: ListTile(

                                  title: Text('Princess Cut'),
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
                              " weight", Icons.monitor_weight, false,true, _weightController,'Please Enter the weight',r'[+-]?([0-9]*[.])?[0-9]+','Enter valid Weight'),),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField3("more details", Icons.details, false,true, _descriptionController,'Enter Details'),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField4("price", Icons.price_change, false,true, _priceController,'Enter the price',r'(^\d{0,200}(\.\d{1,4})?$)', 'Enter a Valid Price'),),
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
                          Expanded(child: reusableTextField4("phone", Icons.phone, false,true, _phoneController,'Enter your phone numuber', r'(^(?:[+0]9)?[0-9]{10,12}$)', 'Enter a valid Number'),),
                        ],
                      ),
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

                      firebaseUIButton(context, "Select Location", () {
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLocation(_varientNameController.text,_varientColorController.text,_cuttingShapeController.text,_weightController.text,_descriptionController.text,
                              _priceController.text, _emailController,_imgUrlController.text,_phoneController.text,file!.path)));
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