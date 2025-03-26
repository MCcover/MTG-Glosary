import 'package:flutter/material.dart';
import 'package:mtg/domain/keyword/keyword.dart';

class KeywordInfo extends StatelessWidget {
  final Keyword keyword;

  const KeywordInfo({
    super.key,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(keyword.type),
            ),
            const Divider(),
            Text(
              "${keyword.keyword} / ${keyword.keywordEs}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colors.primary),
            ),
            const SizedBox(height: 8),
            Text(
              "📖 Definition: ${keyword.definition}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            if (keyword.details != null && keyword.details!.isNotEmpty) ...[
              const Text("📌 Details:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...keyword.details!.map((detail) => Text("• $detail")),
            ],
            // const SizedBox(height: 8),
            // if (keyword.exampleCard != null) ...[
            //   Text("🎴 Example Card: ${keyword.exampleCard}", style: const TextStyle(fontSize: 16)),
            // ],
            const SizedBox(height: 12),
            Text(
              "📖 Definición: ${keyword.definitionEs}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            if (keyword.detailsEs != null && keyword.detailsEs!.isNotEmpty) ...[
              const Text("📌 Detalles:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...keyword.detailsEs!.map((detailEs) => Text("• $detailEs")),
            ],
            const SizedBox(height: 8),
            // if (keyword.exampleCardEs != null) ...[
            //   Text("🎴 Carta Ejemplo: ${keyword.exampleCardEs}", style: const TextStyle(fontSize: 16)),
            // ],
          ],
        ),
      ),
    );
  }
}
