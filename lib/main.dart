import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bcoder_assignment/screens/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bcoder_assignment/bloc/base_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => BaseBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.josefinSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
