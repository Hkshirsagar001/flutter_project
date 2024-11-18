import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kaamkar_application1/landing_screen.dart';
import 'package:kaamkar_application1/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyBquAoSvtycqrV5TKgAPGHMEoapgXr8vEs", appId: "353378635466", messagingSenderId: "1:353378635466:android:30f559a2ffd1d56218ae33", projectId: "kaamkar-44d36"));
    print("Firebase successfully!");
  } catch (e) {
    print("Firebas ecxeption: $e");
  }
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen()
    );
  }
}
