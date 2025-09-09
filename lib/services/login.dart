import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/loginprovider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<Loginprovider>(context);
    return Scaffold(
      body: Center(child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text('Login',style: TextStyle(fontSize: 30,color: Colors.pink),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: 'email',
              ),
              
            ),
          ),
           SizedBox(height: 15,),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: 'password',
              ),
              
            ),
          ),
          SizedBox(height: 25,),
          ElevatedButton(onPressed: (){
              loginprovider.Login(
                emailcontroller.text, 
              passwordcontroller.text);


          },
          style: ElevatedButton.styleFrom(fixedSize: Size(300, 50),
          backgroundColor: Colors.pink,shape: RoundedRectangleBorder(borderRadius: 
          BorderRadiusGeometry.circular(10))),
           child:
           loginprovider.isloading?CircularProgressIndicator(color: Colors.white,):
           Text('Login',style: TextStyle(fontSize: 20,color: Colors.blue,),))
        ],
      ),),
    );
  }
}