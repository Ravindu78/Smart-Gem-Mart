import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_gem_mart/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class PriceChecker extends StatefulWidget {
  const PriceChecker({Key? key}) : super(key: key);

  @override
  _PriceCheckerState createState() => _PriceCheckerState();
}

class _PriceCheckerState extends State<PriceChecker> {
  TextEditingController _varientNameController = TextEditingController();
  TextEditingController _varientColorController = TextEditingController();
  TextEditingController _cuttingShapeController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  final db = FirebaseFirestore.instance;
  double finalPrice = 0;

  void calculatePrice (String variant ,String color , double weight) async {
    final docRef = db.collection("PriceChecker").doc(variant).collection("colors").doc(color);
    docRef.get().then(
          (res) {
            print("Successfully completed");
            print(res.data()!['price01']);
            if(weight<10.0){
              finalPrice = res.data()!['price01'] * weight;
            }else{
              finalPrice = res.data()!['price02'] * weight;
            }
            setState(() {
              print(finalPrice);
            });
          },
      onError: (e) => print("Error completing: $e"),
    );
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
      body: Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          //=========ADDING ADVERTISMENT FIELDS TI FILL=========

          child: SingleChildScrollView(

              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Container(
                            width:330,
                            height: 50,
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30.0) //                 <--- border radius here
                              ),
                            ),
                            child: Text("LKR $finalPrice  ",style: TextStyle(fontSize: 20),),

                            alignment: AlignmentDirectional.centerEnd,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField5("Choose The Varient", Icons.checklist_outlined, false, false, _varientNameController,'Choose The Varient'),),
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
                          Expanded(child: reusableTextField5("Choose The Color", Icons.checklist_outlined, false, false, _varientColorController, 'Choose the color'),),
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
                          Expanded(child: reusableTextField5("Choose The Cutting Shape", Icons.checklist_outlined, false, false, _cuttingShapeController, 'Choose the cutting shape')),
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
                          Expanded(child: reusableTextField6(
                              " weight (ct)", Icons.monitor_weight, false,true, _weightController,'Please Enter the weight',r'[+-]?([0-9]*[.])?[0-9]+','Enter valid Weight'),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: priceCheckerUiButton(context, "Check Price", (){
                            calculatePrice(_varientNameController.text, _varientColorController.text, double.parse(_weightController.text));
                          })),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 350,
                            // color: Colors.yellow,
                            child: Expanded(child: Text (

                                  '(* This will only calculate the approximate current price for your gemstone. It can go up or down.)',

                              ) ,),
                          ),                      ],
                      )

                  ],

                  ),
                ),
              ))),
    );
  }


}