import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg/domain/keyword/cubit/keyword_cubit.dart';
import 'package:mtg/presentation/widgets/inputs/text_input.dart';
import 'package:mtg/presentation/widgets/keyword_info/keyword_info.dart';
import 'package:mtg/presentation/widgets/not_results_found/not_result_found.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => KeywordCubit(),
        child: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce; // Timer para el debounce

  @override
  void initState() {
    super.initState();
    context.read<KeywordCubit>().getKeywords();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context.read<KeywordCubit>().getKeywords(searchedText: text);
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final keywordsCubit = context.watch<KeywordCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          TextInput(
            label: "Search",
            hintText: "Search a keyword...",
            controller: _controller,
            onChanged: _onSearchChanged, // Conectar con debounce
          ),
          const SizedBox(height: 10),
          (keywordsCubit.state.status == KeywordStatus.initial || keywordsCubit.state.status == KeywordStatus.loading)
              ? const Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: showKeywordsInfo(keywordsCubit.state),
                  ),
                ),
        ],
      ),
    );
  }

  Widget showKeywordsInfo(KeywordState state) {
    if (state.status == KeywordStatus.error) {
      return Center(child: Text('Error: ${state.errorMessage}'));
    } else {
      return state.filteredKeywords.isEmpty
          ? const NoResultsFound(
              message: 'No results found',
              icon: Icons.auto_awesome_mosaic_outlined,
            )
          : Column(
              children: state.filteredKeywords.map((item) => KeywordInfo(keyword: item)).toList(),
            );
    }
  }
}
