import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/selectprovider.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {

  @override
  Widget build(BuildContext context) {
    final selectprovider = Provider.of<Selectprovider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('selctor value',style: TextStyle(fontSize:25,color: Colors.pink),),
      backgroundColor: Colors.blue,),
      body: Center(
        child:Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Icon(
                  selectprovider.isselected?
                  Icons.visibility:
                  Icons.visibility_off_outlined
                  ),
                
                Text(selectprovider.count.toString(),style: TextStyle(fontSize: 30,color:selectprovider.isselected?
                 Colors.blue:Colors.amber),)
              ],
            ),
            Container(
              height: 50,
              width: 70,
              color:
              selectprovider.isselected?
              Colors.green:Colors.pink
            ),
            SizedBox(height: 40,),

            ElevatedButton(onPressed: (){
             selectprovider.setvalue();
             
             },

            style: ElevatedButton.styleFrom(fixedSize: Size(350, 50),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius:
             BorderRadiusGeometry.circular(10))),
             child:Text('click me'))

          ],
        )
      ),
    );
  }
}