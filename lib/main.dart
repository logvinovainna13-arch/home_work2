import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_work2/ui/cat/bloc/image_cat_page.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() {

  Bloc.observer = TalkerBlocObserver();
  runApp(
    MaterialApp(
      home: ImageCatPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
