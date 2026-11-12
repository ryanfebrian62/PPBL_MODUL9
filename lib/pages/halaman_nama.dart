import 'package:flutter/material.dart';
import '../helpers/pengaturan_helper.dart';

class HalamanNama extends StatelessWidget {
  const HalamanNama({super.key});

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Nama')),
      body: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: PengaturanHelper.namaNotifier,
          builder: (context, nama, _) {
            final kosong = nama.isEmpty;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person, size: 64),
                const SizedBox(height: 12),
                Text('Nama pelanggan', style: teks.labelLarge),
                const SizedBox(height: 4),
                Text(
                  kosong ? 'Belum diisi' : nama,
                  style: teks.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                if (kosong) ...[
                  const SizedBox(height: 8),
                  const Text('Isi nama di halaman Pengaturan.'),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}