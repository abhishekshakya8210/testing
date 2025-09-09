import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logic_1 extends StatefulWidget {
  const Logic_1({super.key});

  @override
  State<Logic_1> createState() => _Logic_1State();
}

class _Logic_1State extends State<Logic_1> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
 final FirebaseAuth _auth = FirebaseAuth.instance;
 void Login(String email, String password)async{
  try{
    await _auth.createUserWithEmailAndPassword(
      email: email,
       password: password
       );
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('you data saved'))
       );

  }on FirebaseAuthException catch(error){
    print('error');
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Column(children: [
          SizedBox(height: 90,),
          Text('crud opration',style: TextStyle(fontSize: 20),),
          TextFormField(
            controller: emailcontroller,
            decoration: InputDecoration(
        
              hintText: 'email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: passwordcontroller,
            decoration: InputDecoration(
              hintText: 'password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
                 Login(emailcontroller.text, passwordcontroller.text);
          },
          style: ElevatedButton.styleFrom(fixedSize: Size(350, 50),
          shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)) ,
          backgroundColor: Colors.blue),
           child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),))
        ],),),
      )
    );
  }
}