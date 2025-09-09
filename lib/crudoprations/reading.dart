import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testing/crudoprations/crudtutorial.dart';
import 'package:testing/crudoprations/delete.dart';
import 'package:testing/crudoprations/update.dart';

class Reading extends StatefulWidget {
   Reading({super.key,
   required this.addresscontroller,
   required this.agecontroller,
   required this.namecontroller
  });
    TextEditingController namecontroller;
  TextEditingController agecontroller;

TextEditingController addresscontroller;


  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: CrudTutorial().reading(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                DocumentSnapshot eachDoc = data[index];
                String id = eachDoc.id; // Document ka ID

                Map<String, dynamic> map =
                    eachDoc.data() as Map<String, dynamic>;

                String name = map['NameAttribute'] ?? "No Name";
                String age = map['AgeAttribute'] ?? "No Age";
                String address = map['AddressAttribute'] ?? "No Address";

                return Card(
                  margin: const EdgeInsets.all(8),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                         Text(name),
                          Text(age),
                           Text(address),
                      ],),
                   Row(
                     children: [
                       Update( addresscontroller:widget.addresscontroller, 
                            agecontroller:widget.agecontroller,
                             namecontroller: widget.namecontroller,
                              id: id),
                              Delete(id: id)
                     ],
                   )
                                         ],
                  )
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
