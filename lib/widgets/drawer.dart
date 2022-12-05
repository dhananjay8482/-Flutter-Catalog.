import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/login.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final image_url = "https://imgs.search.brave.com/xoiuBYa9Hjew8o50pO9qYzhtwTNzS-8QuXGO6QoVWco/rs:fit:512:512:1/g:ce/aHR0cHM6Ly9jZG4y/Lmljb25maW5kZXIu/Y29tL2RhdGEvaWNv/bnMvYXZhdGFycy05/OS82Mi9hdmF0YXIt/MzcwLTQ1NjMyMi01/MTIucG5n";
    return Drawer(
      child: Container(
        // color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero ,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Dhananjay"),
                  accountEmail: Text("dms@kaartech.com"),
                  // currentAccountPicture: Image.network(image_url),
                  currentAccountPicture: CircleAvatar(
                    radius: 90.0,
                    backgroundColor: const Color(0xFF778899),
                    child: new Image.asset(
                      'images/profile_img.jpg',
                    ), //For Image Asset
                  ),
                ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text("Home", textScaleFactor: 1.2 ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.arrow_right_circle),
              title: Text("Login", textScaleFactor: 1.2 ),
              onTap: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                )
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text("Profile", textScaleFactor: 1.2 ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.info_circle),
              title: Text("About", textScaleFactor: 1.2 ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail_solid),
              title: Text("Message", textScaleFactor: 1.2 ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.lock_fill),
              title: Text("Logout", textScaleFactor: 1.2 ),
            )
          ],
        ),
      ),
    );
  }
}
