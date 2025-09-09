import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/crudoprations/crudtutorial.dart';
import 'package:testing/crudoprations/reading.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Reading(
          addresscontroller: addresscontroller,
           agecontroller: agecontroller,
         namecontroller: namecontroller)));
      } ,child:Icon(Icons.add) ,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Column(children: [
          SizedBox(height: 90,),
          Text('crud opration',style: TextStyle(fontSize: 20),),
          TextFormField(
            controller: namecontroller,
            decoration: InputDecoration(
              
        
              hintText: 'name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: agecontroller,
            
            decoration: InputDecoration(
              hintText: 'age',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: addresscontroller,
            decoration: InputDecoration(
              hintText: 'address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
               
            CrudTutorial().create(
              name: namecontroller.text,
             age: agecontroller.text,
              address: addresscontroller.text);


                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("you data submited"))
                   );
                        },
          style: ElevatedButton.styleFrom(fixedSize: Size(350, 50),
          shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)) ,
          backgroundColor: Colors.blue),
           child: Text('SUBMIT',style: TextStyle(fontSize: 20,color: Colors.white),))
        ],),),
      )
    );
  }
}