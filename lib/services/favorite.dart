import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/faviroteprovider.dart';
import 'package:testing/services/favirote2.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {


  @override
  Widget build(BuildContext context) {
    print('object');
//  final faviroteprovider = Provider.of<Faviroteprovider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECTED'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavirote()));
          }, icon: Icon(Icons.favorite,color: Colors.blue,))
        ],
      ),
      body: Center(child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<Faviroteprovider>(builder: (context,value,child){
                      return ListTile(
                      onTap: () {
                        if(value.isselected.contains(index)){
                          value.isselected.remove(index);
                        }else{
                            
                     value.itemselect(index);
                        }

                                            },
                      title: Text("Iteams "+ index.toString()),
                     trailing: Icon(
                         value.isselected.contains(index)    
                    ? Icons.favorite
                      : Icons.favorite_border_outlined,
),
                    );
                    })
                  ),
                ),
              );
            }),
          )
        ],
      ),),
    );
  }
}