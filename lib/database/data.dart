import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        children: [
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'name',
              
            ),
          )
        ],
      ) ,),
    );
  }
}