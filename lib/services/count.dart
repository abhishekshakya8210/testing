import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/countprovider.dart';

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    print('object');
    final countProvider = Provider.of<Countprovider>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increment(); 
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Consumer<Countprovider>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
    );
  }
}
