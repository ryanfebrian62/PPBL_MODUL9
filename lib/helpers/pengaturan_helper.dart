import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PengaturanHelper {
  PengaturanHelper._();
  static const _tema = 'tema_gelap';
  static const _nama = 'nama_pelanggan';
  static late final SharedPreferences _prefs;

  /// Nama pelanggan yang sedang tersimpan. Halaman lain bisa mendengarkan
  /// notifier ini supaya ikut berubah saat nama disimpan atau di-reset.
  static final ValueNotifier<String> namaNotifier = ValueNotifier('');

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    namaNotifier.value = muatNama();
  }

  static bool muatTema() => _prefs.getBool(_tema) ?? false;
  static String muatNama() => _prefs.getString(_nama) ?? '';

  static Future<void> simpanTema(bool gelap) async {
    await _prefs.setBool(_tema, gelap);
  }

  static Future<void> simpanNama(String nama) async {
    final bersih = nama.trim();
    await _prefs.setString(_nama, bersih);
    namaNotifier.value = bersih;
  }

  static Future<void> reset() async {
    await _prefs.remove(_tema);
    await _prefs.remove(_nama);
    namaNotifier.value = '';
  }
}