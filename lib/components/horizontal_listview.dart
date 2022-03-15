import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
         Category(image_location: 'assets/images/blue.png', image_caption: 'Blue Sapphire'),
          Category(image_location: 'assets/images/c2.png', image_caption: 'Ruby'),
          Category(image_location: 'assets/images/c3.png', image_caption: 'Yellow Sapphire'),
          Category(image_location: 'assets/images/c4.png', image_caption: 'Garnet'),
          Category(image_location: 'assets/images/c1.png', image_caption: 'Cats Eye'),
          Category(image_location: 'assets/images/c2.png', image_caption: 'Star Sapphire'),
          Category(image_location: 'assets/images/c3.png', image_caption: 'Padparadscha Sapphire'),
          Category(image_location: 'assets/images/c4.png', image_caption: 'Emarald'),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({
    required this.image_location,
    required this.image_caption,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location,
            width: 100.0,
              height: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}
