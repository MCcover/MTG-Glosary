import 'package:string_similarity/string_similarity.dart';

class Keyword {
  final String type;
  final String keyword;
  final String definition;
  final String url;

  Keyword({required this.type, required this.keyword, required this.definition, required this.url});

  // Método para convertir un JSON a una instancia de Keyword
  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      type: json['category'],
      keyword: json['keyword'],
      definition: json['definition'],
      url: json['url'] ?? "",
    );
  }

  bool contains(String searchedText) {
    String fullText = [type, keyword, definition, url].join(" ").toLowerCase();

    var text = searchedText.toLowerCase();

    List<String> words = fullText.split(RegExp(r'\s+'));

    for (String word in words) {
      if (word.contains(text) || text.similarityTo(word) >= 0.6) {
        return true;
      }
    }

    return false; // Ninguna palabra alcanzó el umbral
  }
}
