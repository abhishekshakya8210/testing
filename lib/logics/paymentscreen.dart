import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Apna publishable key yaha lagao
  Stripe.publishableKey =
      "pk_test_51S7rdGFE2qJo5jEOJ16A9WWWFFHL4iwaKuIYapfGw6Iy69e9mc40FI98EBRK1fuwpaGdRozELuBbLdojKkV86K7m00mNH2ZQCb";

  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future<void> makePayment() async {
    try {
      // ✅ 1. Backend ko call karke clientSecret lo
      final response = await http.post(
        Uri.parse("http://10.0.2.2:3000/create-payment-intent"), // emulator ke liye
        headers: {"Content-Type": "application/json"},
        body: json.encode({"amount": 500}), // $5.00
      );

      final data = json.decode(response.body);
      final clientSecret = data['clientSecret'];

      // ✅ 2. PaymentSheet initialize karo
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Abhishek Shop",
        ),
      );

      // ✅ 3. PaymentSheet show karo
      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Successful ✅")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Failed ❌ $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stripe Payment Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: makePayment,
          child: const Text("Pay \$5"),
        ),
      ),
    );
  }
}
