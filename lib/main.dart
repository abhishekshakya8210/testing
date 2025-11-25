import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:testing/apiwithprovide/api_1.dart';
import 'package:testing/apiwithprovide/api_2.dart';
import 'package:testing/apiwithprovide/api_3.dart';
import 'package:testing/apiwithprovide/api_4.dart';
import 'package:testing/apiwithprovide/api_5.dart';
import 'package:testing/apiwithprovide/api_6.dart';
import 'package:testing/apiwithprovide/wheather_api.dart';
import 'package:testing/crudoprations/create.dart' hide Create;
import 'package:testing/database/data.dart';
import 'package:testing/goodui/instagram.dart';
import 'package:testing/goodui/nuture.dart';
import 'package:testing/goodui/travle.dart'; 
import 'package:testing/logic/login_1.dart';
import 'package:testing/logics/countryflagintextfield.dart';
import 'package:testing/logics/paymentscreen.dart';
import 'package:testing/provider/api2provider.dart';
import 'package:testing/provider/api_1provider.dart';
import 'package:testing/provider/api_3provider.dart';
import 'package:testing/provider/api_4provider.dart';
import 'package:testing/provider/api_5provider.dart';
import 'package:testing/provider/api_6provider.dart';
import 'package:testing/provider/selectprovider.dart';
import 'package:testing/provider/weather_api_provider.dart';
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
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Firebase initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Stripe publishable key (Frontend safe key - public)
  // 👉 Ye key tum Stripe dashboard se lete ho (Test mode me pk_test se start hoti hai)
  Stripe.publishableKey =
      "pk_test_51S7rdGFE2qJo5jEOJ16A9WWFFHL4iwaKuIYapfGw6Iy69e9mc4OfI98EBRK1fuwpaGdRozELuBbLdojKkV86K7m00mNH2ZQCb";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ MultiProvider (alag-alag providers register ho rahe hain app ke liye)
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Countprovider()),
        ChangeNotifierProvider(create: (_) => Slidprovider()),
        ChangeNotifierProvider(create: (_) => Faviroteprovider()),
        ChangeNotifierProvider(create: (_) => Loginprovider()),
        ChangeNotifierProvider(create: (_) => Textapiprovider()),
        ChangeNotifierProvider(create: (_) => Logicincreamentprovider()),
        ChangeNotifierProvider(create: (_) => Selectprovider()),
        ChangeNotifierProvider(create: (_) => Api1provider()),
        ChangeNotifierProvider(create: (_) => Api2provider()),
        ChangeNotifierProvider(create: (_) => Api3provider()),
        ChangeNotifierProvider(create: (_) => Api4provider()),
        ChangeNotifierProvider(create: (_) => Api5provider()),
        ChangeNotifierProvider(create: (_) => Api6provider()),
        ChangeNotifierProvider(create: (_) => WeatherApiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ✅ Abhi Stripe Payment screen default home hai
        home:DataScreen()
        //Travle()
         //Nuture()
       // PaymentScreen(),
      ),
    );
  }
}
