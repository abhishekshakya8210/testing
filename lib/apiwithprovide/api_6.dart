import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:testing/provider/api_6provider.dart';

class Api_6 extends StatefulWidget {
  const Api_6({super.key});

  @override
  State<Api_6> createState() => _Api_6State();
}

class _Api_6State extends State<Api_6> {
  @override
  void initState() {
    super.initState();
    Provider.of<Api6provider>(context,listen: false).fatchingdata();
  }

  @override
  Widget build(BuildContext context) {
    final api6provider = Provider.of<Api6provider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("API Example")),
      body: api6provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : api6provider.errorMessage != null
              ? Center(child: Text(api6provider.errorMessage!))
              : ListView.builder(
                  itemCount: api6provider.abhishek!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(api6provider.abhishek![index]['name']),
                      subtitle: Text("ID: ${api6provider.abhishek![index]['id']}"),
                    );
                  },
                ),
    );
  }
}
