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


