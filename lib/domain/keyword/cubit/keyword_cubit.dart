import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:mtg/domain/keyword/keyword.dart';

part 'keyword_state.dart';

class KeywordCubit extends Cubit<KeywordState> {
  KeywordCubit()
      : super(
          const KeywordState(
            allKeywords: [],
            filteredKeywords: [],
            errorMessage: "",
            status: KeywordStatus.initial,
          ),
        ) {
    _loadInitialKeywords();
  }

  Future<void> _loadInitialKeywords() async {
    try {
      emit(state.copyWith(status: KeywordStatus.loading));

      await getAllKeywords();

      emit(
        state.copyWith(
          filteredKeywords: state.allKeywords,
          status: KeywordStatus.loaded,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: "", status: KeywordStatus.error));
    }
  }

  Future<void> getAllKeywords() async {
    final String response = await rootBundle.loadString('assets/jsons/keywords.json');
    final List<dynamic> jsonData = jsonDecode(response);

    List<Keyword> keywords = [];

    for (var item in jsonData) {
      var keyword = Keyword.fromJson(item);
      keywords.add(keyword);
    }

    keywords.sort((a, b) => a.keyword.compareTo(b.keyword));

    emit(
      state.copyWith(
        allKeywords: keywords,
        status: KeywordStatus.loaded,
      ),
    );
  }

  void getKeywords({String searchedText = ""}) {
    List<Keyword> keywords = [];

    for (var keyword in state.allKeywords) {
      if (searchedText.isEmpty || keyword.contains(searchedText)) {
        keywords.add(keyword);
      }
    }

    emit(
      state.copyWith(
        filteredKeywords: keywords,
      ),
    );
  }
}
