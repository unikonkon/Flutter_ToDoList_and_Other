// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
  );
}
