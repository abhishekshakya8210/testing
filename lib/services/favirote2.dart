import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/faviroteprovider.dart';

class Myfavirote extends StatefulWidget {
  const Myfavirote({super.key});

  @override
  State<Myfavirote> createState() => _MyfaviroteState();
}

class _MyfaviroteState extends State<Myfavirote> {
  @override
  Widget build(BuildContext context) {
    final faviroteprovider = Provider.of<Faviroteprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('your favirote'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: faviroteprovider.isselected.length,
                itemBuilder: (context, index) {
                  final itemIndex = faviroteprovider.isselected[index]; // actual item index
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text("Item $itemIndex"),
                        trailing: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
