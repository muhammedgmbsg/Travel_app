import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isChecking = StateProvider<bool>((ref) {
  return false;
});

final emailProvider = StateProvider<String>((ref) {
  return "";
});

final userNameProvider = StateProvider<String>((ref) {
  return "";
});

final passwordProvider = StateProvider<String>((ref) {
  return "";
});

final rpasswordProvider = StateProvider<String>((ref) {
  return "";
});

final userKey = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final mailKey = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final pwKey = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final rpwKey = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});
