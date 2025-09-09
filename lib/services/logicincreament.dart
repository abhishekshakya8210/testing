import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/logicincreamentprovider.dart';

class Logicincreament extends StatefulWidget {
  const Logicincreament({super.key});

  @override
  State<Logicincreament> createState() => _LogicincreamentState();
}

class _LogicincreamentState extends State<Logicincreament> {
  @override
  Widget build(BuildContext context) {
    final logicincreamentprovider =
        Provider.of<Logicincreamentprovider>(context, listen: true);

    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                logicincreamentprovider.setSelected(index); 
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: logicincreamentprovider.isselected == index
                      ? Colors.pink
                      : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'value $index',
                    style: TextStyle(
                      color: logicincreamentprovider.isselected == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
