import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'MyBlocObserver.dart';
import 'ToDo.dart';

void main() {
   Bloc.observer = MyBlocObserver();
  
  runApp(MaterialApp(
    home: TODO(),
  ));


}