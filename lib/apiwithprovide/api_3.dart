import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:testing/provider/api_3provider.dart';

class Api3 extends StatefulWidget {
  const Api3({super.key});

  @override
  State<Api3> createState() => _Api3State();
}

class _Api3State extends State<Api3> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Api3provider>(context,listen: false).fatch();
  }

  
  @override
  Widget build(BuildContext context) {
    final api3provider  =Provider.of<Api3provider>(context);
    return Scaffold(
      body: api3provider.abhishek.isEmpty?
      Center(child: CircularProgressIndicator(),)
      :ListView.builder(
        itemCount: api3provider.abhishek.length,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(api3provider.abhishek[index]['id'].toString(),
                    style: TextStyle(fontSize: 13,color: Colors.white),)),
                Text(api3provider.abhishek[index]['name'],style: TextStyle(fontSize: 18,color: Colors.black),), 
                  Text(api3provider.abhishek[index]['email'],style: TextStyle(fontSize: 16,color: Colors.black),),
                  Text(api3provider.abhishek[index]['body'],style: TextStyle(fontSize: 14,color: Colors.grey),)
              
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}