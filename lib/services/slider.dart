import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/slidprovider.dart';

class Slid extends StatefulWidget {
  const Slid({super.key});

  @override
  State<Slid> createState() => _SlidState();
}

class _SlidState extends State<Slid> {

  @override
  Widget build(BuildContext context) {
    final slidprovider = Provider.of<Slidprovider>(context,listen: true);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
         Consumer<Slidprovider>(builder: (context,value,child){
          return   Slider(
            min: 0.1,
            max: 1.0,
            value:(value.val) , onChanged:(Newval){
              slidprovider.updateVal(Newval);
                   
           } );

         }),
          Consumer<Slidprovider>(builder: (context,value,child){
            return  Row(
             children: [
               Expanded(
                 child: Container(
                  height: 500,
                  color: Colors.green.withOpacity(value.val),
                  
                 ),
                 
               ),
               Expanded(
                 child: Container(
                  height: 500,
                  color: Colors.pink.withOpacity(value.val),
                  
                 ),
               )
             ],
           );
          
          })],
        ),
      ),
    );
  }
}