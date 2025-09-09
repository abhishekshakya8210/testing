import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/api_1provider.dart';

class Api1 extends StatefulWidget {
  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  @override
  void initState() {
    super.initState();
    
    
      Provider.of<Api1provider>(context, listen: false).fetchData();
    
  }

  @override
  Widget build(BuildContext context) {
    final api1provider = Provider.of<Api1provider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("API with Provider")),
      body: api1provider.abhishek.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: api1provider.abhishek.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    api1provider.abhishek[index]['url'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  trailing: Image.network(
                    api1provider.abhishek[index]['thumbnailUrl'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(api1provider.abhishek[index]['title']),
                  subtitle: Text(
                      api1provider.abhishek[index]['id'].toString()),
                );
              },
            ),
    );
  }
}
