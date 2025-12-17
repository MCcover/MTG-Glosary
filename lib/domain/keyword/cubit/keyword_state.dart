part of 'keyword_cubit.dart';

enum KeywordStatus { initial, loading, loaded, error }

class KeywordState extends Equatable {
  final List<Keyword> allKeywords;
  final List<Keyword> filteredKeywords;
  final KeywordStatus status;
  final String? errorMessage;

  const KeywordState({
    required this.allKeywords,
    required this.filteredKeywords,
    this.status = KeywordStatus.initial,
    this.errorMessage,
  });

  KeywordState copyWith({
    List<Keyword>? allKeywords,
    List<Keyword>? filteredKeywords,
    KeywordStatus? status,
    String? errorMessage,
  }) {
    return KeywordState(
      allKeywords: allKeywords ?? this.allKeywords,
      filteredKeywords: filteredKeywords ?? this.filteredKeywords,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [allKeywords, filteredKeywords, status, errorMessage];
}
