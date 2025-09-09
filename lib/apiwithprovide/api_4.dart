import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/api_4provider.dart';

class Api_4 extends StatefulWidget {
  const Api_4({super.key});

  @override
  State<Api_4> createState() => _Api_4State();
}

class _Api_4State extends State<Api_4> {
  @override
  void initState() {
    super.initState();
    Provider.of<Api4provider>(context, listen: false).fatchdata();
  }

  @override
  Widget build(BuildContext context) {
    final api4provider = Provider.of<Api4provider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("API 4 Example")),
      body: api4provider.abhishek.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: api4provider.abhishek.length,
              itemBuilder: (context, index) {
                var item = api4provider.abhishek[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(item['id'].toString()),
                    ),
                    title: Text(
                      item['title'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    trailing:  Text(api4provider.abhishek[index]['postId'].toString()),
                  ),
                );
              },
            ),
    );
  }
}
