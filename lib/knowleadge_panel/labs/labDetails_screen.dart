import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
class LabDetails extends StatefulWidget {
  String labName;
  String address;
  String number;
  String services;
  String imgUrl;

  LabDetails(this.labName,this.address,this.number,this.services,this.imgUrl);

  @override
  State<LabDetails> createState() => _LabDetailsState();
}

class _LabDetailsState extends State<LabDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")],
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0.2,
        title: InkWell(
            onTap: (){
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Text("Advertisement Details")),
      ),

      body: Column(
        children: [
          Container(
            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child:Image.network(widget.imgUrl),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading:  Text(" ${widget.labName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children:  [

                      Expanded(child: Text("${widget.address}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          //===========the first buttons======//



          //===========the second buttons======//
          Row(
            children: [
              //===== the size button
            ],
          ),

          ListTile(
            title: Text("Description"),
            subtitle: Text(
                "${widget.services}"),
          ),

          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Varient", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.labName}"),)
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Color", style: TextStyle(color: Colors.grey),),),

              //=======remember to creat the product brand====

              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.number}"),)

            ],
          ),

          //=======remember to creat the product condition===

          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Cutting Shape", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.address}"),)

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Weight", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.services}"),)

            ],
          ),




        ],
      ),
    );
  }
}
