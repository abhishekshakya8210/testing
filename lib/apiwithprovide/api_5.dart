import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:testing/provider/api_5provider.dart';

class Api_5 extends StatefulWidget {
  const Api_5({super.key});

  @override
  State<Api_5> createState() => _Api_5State();
}

class _Api_5State extends State<Api_5> {
  @override
  void initState() {
    super.initState();
     Provider.of<Api5provider>(context,listen: false).fetchValue();
  }

  @override
  Widget build(BuildContext context) {
    final api5provider = Provider.of<Api5provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single User API"),
        centerTitle: true,
      ),
      body: api5provider.abhishek == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView( // ✅ overflow error fix
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          api5provider.abhishek?['avatar'] ?? "",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${api5provider.abhishek?['first_name'] ?? ''} ${api5provider.abhishek?['last_name'] ?? ''}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(api5provider.abhishek?['email'] ?? "",
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 10),
                      Text("ID: ${api5provider.abhishek?['id'] ?? ''}"),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
