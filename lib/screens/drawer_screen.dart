import 'package:flutter/material.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            
            decoration: BoxDecoration(
              color: Colors.blue,

            ),
            child: UserAccountsDrawerHeader(accountName: Text("Ravindu Arsakulsooriya"), accountEmail: Text("Rakshitha@gmail.com"),
             currentAccountPicture: InkWell(
           child: CircleAvatar(backgroundColor: Colors.grey,
             child: Icon(Icons.person, color: Colors.white,
             ),),
             ),
            ),


          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}