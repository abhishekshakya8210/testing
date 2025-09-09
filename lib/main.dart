import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:testing/apiwithprovide/api_1.dart';
import 'package:testing/apiwithprovide/api_2.dart';
import 'package:testing/apiwithprovide/api_3.dart';
import 'package:testing/apiwithprovide/api_4.dart';
import 'package:testing/crudoprations/create.dart' hide Create;
import 'package:testing/logic/login_1.dart';
import 'package:testing/provider/api2provider.dart';
import 'package:testing/provider/api_1provider.dart';
import 'package:testing/provider/api_3provider.dart';
import 'package:testing/provider/api_4provider.dart';
import 'package:testing/provider/selectprovider.dart';
import 'package:testing/services/logicincreament.dart';
import 'package:testing/provider/TextApiprovider.dart';
import 'package:testing/provider/countprovider.dart';
import 'package:testing/provider/faviroteprovider.dart';
import 'package:testing/provider/logicincreamentprovider.dart';
import 'package:testing/provider/loginprovider.dart';
import 'package:testing/provider/slidprovider.dart';

import 'package:testing/services/count.dart';
import 'package:testing/services/favorite.dart';
import 'package:testing/services/login.dart';
import 'package:testing/services/select.dart';
import 'package:testing/services/slider.dart';
import 'package:testing/services/textapi.dart';
import 'firebase_options.dart';

void main() async{

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>Countprovider()),
      ChangeNotifierProvider(create: (_)=>Slidprovider()),
      ChangeNotifierProvider(create: (_)=>Faviroteprovider()),
      ChangeNotifierProvider(create: (_)=>Loginprovider()),
       ChangeNotifierProvider(create: (_)=>Textapiprovider()),
       ChangeNotifierProvider(create: (_)=>Logicincreamentprovider()),
       ChangeNotifierProvider(create: (_)=>Selectprovider()),
       ChangeNotifierProvider(create: (_)=>Api1provider()),
        ChangeNotifierProvider(create: (_)=>Api2provider()),
         ChangeNotifierProvider(create: (_)=>Api3provider()),
          ChangeNotifierProvider(create: (_)=>Api4provider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home://Api_4()
      //Api3()
      //Api_2()
      //Api1()
      //TextApi()
     // Select()
      //Logicincreament()
      //TextApi()
      Login()
      //Favorite()
      //Slid()
     // Count(),
    //Logic_1(),
      //Create()
    ),
    
    );
  }
}

