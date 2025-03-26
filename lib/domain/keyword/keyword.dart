import 'package:string_similarity/string_similarity.dart';

class Keyword {
  final String type;
  final String keyword;
  final String keywordEs;
  final String definition;
  final String definitionEs;
  final String? exampleCard;
  final String? exampleCardEs;
  final List<String>? details;
  final List<String>? detailsEs;

  Keyword({
    required this.type,
    required this.keyword,
    required this.keywordEs,
    required this.definition,
    required this.definitionEs,
    this.exampleCard,
    this.exampleCardEs,
    this.details,
    this.detailsEs,
  });

  // Método para convertir un JSON a una instancia de Keyword
  factory Keyword.fromJson(Map<String, dynamic> json, String type) {
    return Keyword(
      type: type,
      keyword: json['keyword'],
      keywordEs: json['keyword_es'],
      definition: json['definition'],
      definitionEs: json['definition_es'],
      exampleCard: json['example_card'],
      exampleCardEs: json['example_card_es'],
      details: json['details'] != null ? List<String>.from(json['details']) : null,
      detailsEs: json['details_es'] != null ? List<String>.from(json['details_es']) : null,
    );
  }

  bool contains(String searchedText) {
    String fullText = [
      type,
      keyword,
      keywordEs,
      definition,
      definitionEs,
      details?.join(" ") ?? "",
      detailsEs?.join(" ") ?? "",
    ].join(" ").toLowerCase();

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
