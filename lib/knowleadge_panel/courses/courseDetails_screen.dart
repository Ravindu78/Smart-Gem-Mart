import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
class CourseDetails extends StatefulWidget {
  String CourseName;
  String Institute;
  String number;
  String Details;
  String imgUrl;

  CourseDetails(this.CourseName,this.Institute,this.number,this.Details,this.imgUrl);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
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
            child: Text("Course Details")),
      ),

      body: Column(
        children: [
          Container(

            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child:Image.network(widget.imgUrl,
                  fit: BoxFit.fill,),

              ),
              footer: Container(
                height: 50,
                color: Colors.white60,
                child: ListTile(
                  leading:  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(" ${widget.CourseName}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  title: Row(
                    children:  [

                      Expanded(child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),

                        child: Text('('"${widget.Institute}"')',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),),
                      )
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
                "${widget.Details}"),
          ),

          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Course Title :", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.CourseName}"),)
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Contact :", style: TextStyle(color: Colors.grey),),),

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
                  "Institute :", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.Institute}"),)

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Details :", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.Details}"),)

            ],
          ),




        ],
      ),
    );
  }
}
