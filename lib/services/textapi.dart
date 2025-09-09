import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/TextApiprovider.dart';

class TextApi extends StatefulWidget {
  const TextApi({super.key});

  @override
  State<TextApi> createState() => _TextApiState();
}

class _TextApiState extends State<TextApi> {
  @override
  void initState() {
    super.initState();
    // API call on screen load
    Provider.of<Textapiprovider>(context, listen: false).abhishekapi();
  }

  @override
  Widget build(BuildContext context) {
    final textapiprovider = Provider.of<Textapiprovider>(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text("API Users")),
      
      body: textapiprovider.abhishek.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: textapiprovider.abhishek.length,
              itemBuilder: (context, index) {
                final user = textapiprovider.abhishek[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text("${user['first_name']} ${user['last_name']}"),
                  subtitle: Text(user['email']),
                  trailing: Text("ID: ${user['id']}"),
                );
              },
            ),
    );
  }
}
