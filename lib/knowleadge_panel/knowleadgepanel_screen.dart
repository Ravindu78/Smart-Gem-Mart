import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:smart_gem_mart/knowleadge_panel/labs/Laboratory_screen.dart';

class KnowledgePanel extends StatefulWidget {
  const KnowledgePanel({Key? key}) : super(key: key);

  @override
  State<KnowledgePanel> createState() => _KnowledgePanelState();
}

class _KnowledgePanelState extends State<KnowledgePanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: Container(
                  height: 200.0,
                  width: 390.0,
                  child: Carousel(
                    images: [
                      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.5),
                    borderRadius: true,
                  ),

              ),


            ),
          Container(
            child: ListTile(
              onTap: (){
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Labs(),
                  ),
                );
              },
                  title: Text('LABORATORIES'),
                  subtitle: Text(
                      'Lab Services'
                  ),

          ),
          ),
            Container(
              child: ListTile(
                onTap: () {},
                title: Text('NEWS PANEL'),
                subtitle: Text(
                    'Latest News'
                ),

              ),
            ),
            Container(
              child: ListTile(
                onTap: () {},
                title: Text('NEWS PANEL'),
                subtitle: Text(
                    'Latest News'
                ),

              ),
            ),
          // Container(
          //   child: ListView(
          // children: [
          // Card(
          //   child: ListTile(
          //     onTap: () {},
          //     title: Text('NEWS PANEL'),
          //     subtitle: Text(
          //         'Latest News'
          //     ),
          //
          //   ),
          // ),
          //   Card(
          //     child: ListTile(
          //       onTap: () {
          //         // Navigator.push<void>(
          //         //   context,
          //         //   MaterialPageRoute<void>(
          //         //     builder: (BuildContext context) => const RecentLabs(),
          //         //   ),
          //         // );
          //       },
          //       title: Text('LABORATORIES'),
          //       subtitle: Text(
          //           'Gem Lab Services'
          //       ),
          //     ),
          //   ),
          //   Card(
          //     child: ListTile(
          //       onTap: () {},
          //       title: Text('COURSES'),
          //       subtitle: Text(
          //           'Courses and Deplomas'
          //       ),
          //     ),
          //   )
          // ],
          //   ),
          // ),

          ],

        ),

      ),

    );
  }
}
