import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();


  moveToHome(BuildContext context) async{
    if((_formKey.currentState!.validate())){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage() ),
      );
      setState(() {
        changeButton = false;
      });
    }


  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,

      child: SingleChildScrollView(
        child:Column(
          children: [
            Image.asset("images/login_image.png",fit:BoxFit.cover),
            SizedBox(height:20),
            Text("WELCOME "+name,
              style: TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32
              ),
              child: Form(
                key: _formKey,
                child: Column(
                    children:[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:"Enter Username",
                          labelText: "Username",
                        ),
                        onChanged: (value){
                          name = value;
                          setState(() {});
                        },
                        validator: (value){
                          if( value==null || value ==""){
                            return "Username Can't be Empty...";
                          }
                          return null;
                        },

                      ),
                      TextFormField(
                        obscureText: true ,
                        decoration: InputDecoration(
                          hintText:"Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value){
                          if( value==null || value ==""){
                            return "Password Can't be Empty...";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:20),
                      // ElevatedButton(onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => HomePage() ),
                      //   );
                      // }, child: Text("Login"),
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(99, 40)
                      //   )
                      // )

                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular((
                            changeButton?50:8
                        )),
                        child: InkWell(
                          onTap:() => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 :  150 ,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                          ),
                        ),
                      )


                    ]

                ),
              ),
            )
          ],
        ),
      ),
    ) ;
  }
}
