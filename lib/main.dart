// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learnings/Bloc/InternetBloc/SignInBloc/SignInBloc.dart';
import 'package:my_learnings/Cubit/PhoneAuthCubit/PhoneAuthCubit.dart';

import 'package:my_learnings/UI/PhoneAuthPage.dart';
import 'package:my_learnings/Widgets/BoldText.dart';
import 'package:my_learnings/firebase_options.dart';

void main() async {
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
    return BlocProvider(
      create: (context) => PhoneAuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // home: Scaffold(
        //   body: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [Center(child: BoldText(text: "SDfsdf"))],
        //   ),
        // ),
        home: PhoneAuthPage(),
      ),
    );
  }
}
