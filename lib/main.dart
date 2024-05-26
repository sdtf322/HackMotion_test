import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home/bloc/home_swing_list_event.dart';
import 'pages/home/ui/home_swing_list_page.dart';
import 'pages/home/bloc/home_swing_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeSwingListBloc()..add(LoadSwings()),
      child: MaterialApp(
        title: 'HackMotion test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeSwingListPage(),
      ),
    );
  }
}
