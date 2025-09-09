import 'package:flutter/material.dart';
import 'package:testing/crudoprations/crudtutorial.dart';

class Delete extends StatelessWidget {
   Delete({super.key,
  required this.id,
  });
  String id;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){


        CrudTutorial().Delete(id);

    }, icon: Icon(Icons.delete,color: Colors.red,));
  }
}