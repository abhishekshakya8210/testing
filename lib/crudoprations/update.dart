import 'package:flutter/material.dart';
import 'package:testing/crudoprations/crudtutorial.dart';

class Update extends StatelessWidget {
   Update({super.key,
   required this.addresscontroller,
   required this.agecontroller,
   required this.namecontroller,
   required this.id
   });

  TextEditingController namecontroller;
  TextEditingController agecontroller;

TextEditingController addresscontroller;
String id;



  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
     showDialog(context: context, builder: (context) {
       return Dialog(
        child: AboutDialog(
          children: [
            Center(child: Column(children: [
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
               CrudTutorial().updateData(id: id, 
               name: namecontroller.text,
                age: agecontroller.text,
                 address: addresscontroller.text);
                


                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("you data updated"))
                   );
                        },
          style: ElevatedButton.styleFrom(fixedSize: Size(350, 50),
          shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)) ,
          backgroundColor: Colors.blue),
           child: Text('Update',style: TextStyle(fontSize: 20,color: Colors.white),))
        ],),),
          ],
        ),
       );
     },);


    }, icon:Icon(Icons.edit));
  }
}