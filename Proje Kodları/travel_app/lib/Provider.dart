
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Detay sayfasının izleyeceği yer adı
final popularTouristicPlace_name = StateProvider<String>((ref) {
  return '';
});

//Detay sayfasının izleyeceği image url
final popularTouristicPlace_imageUrl = StateProvider<String>((ref) {
  return '';
});

final selectedCityProvider = StateProvider<String>((ref) {
  return 'İstanbul';
});

final selectedDateTime = StateProvider<String>((ref) {
  return '00.00.0000';
});