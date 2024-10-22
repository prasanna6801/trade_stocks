import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_trade/domain_layer/home_screen_bloc/home_screen_bloc.dart';
import 'package:stock_trade/ui_layer/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 48, 148, 50),
          useMaterial3: true,
          fontFamily: "Nunito"),
      home: BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
