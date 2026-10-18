import 'package:flutter/material.dart';
import 'package:home_work2/ui/counter/counter_page.dart';

void main() {

  Bloc.observer = TalkerBlocObserver();
  runApp(
    MaterialApp(
      home: ImageDogPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
