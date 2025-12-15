import 'package:flutter/material.dart';
import 'package:mtg/domain/keyword/keyword.dart';
import 'package:url_launcher/url_launcher.dart';

class KeywordInfo extends StatelessWidget {
  final Keyword keyword;

  const KeywordInfo({
    super.key,
    required this.keyword,
  });

  Future<void> _launchUrl(String urlText) async {
    final Uri url = Uri.parse(urlText);
    if (!await launchUrl(url)) {
      throw Exception('No se pudo lanzar $url');
    }
  }

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
              keyword.keyword,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colors.primary),
            ),
            const SizedBox(height: 8),
            Text(
              "📖 Definition: ${keyword.definition}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchUrl(keyword.url),
              child: const Text(
                '🔗 More Info',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
