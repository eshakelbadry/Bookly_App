import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/searched_books_cubit/searched_books_cubit.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';
import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});
  // final BookModel bookModel;
  String bookName = '';
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onChanged: (data) {
              if (data.isEmpty) {
                // BlocProvider.of<SearchedBooksCubit>(context).clearSearchResults();
                searchController.clear();
              } else {
                bookName = data;
              }
            },
            onSubmitted: (data) {
              bookName = data;
              BlocProvider.of<SearchedBooksCubit>(context)
                  .fetchSearchedBooks(bookName: bookName);
            },
          ),
          const SizedBox(height: 16),
          const Text('Search Result', style: Styles.textStyle18),
          const SizedBox(height: 16),
          const Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}
