import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/api2provider.dart';

class Api_2 extends StatefulWidget {
  const Api_2({super.key});

  @override
  State<Api_2> createState() => _Api_2State();
}

class _Api_2State extends State<Api_2> {
  @override
  void initState() {
    super.initState();
    Provider.of<Api2provider>(context, listen: false).abhishekapi();
  }

  @override
  Widget build(BuildContext context) {
    final api2provider = Provider.of<Api2provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("API with Provider"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: api2provider.abhishek.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: api2provider.abhishek.length,
              itemBuilder: (context, index) {
                var item = api2provider.abhishek[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Text(
                        item['userId'].toString(),
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                    title: Text(
                      item['title'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          item['body'],
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "ID: ${item['id']}",
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
