import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
import '../../manager/searched_books_cubit/searched_books_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  // final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: state.books[index]),
                // child: Text('data'),
              );
            },
          );
        } else if (state is SearchedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchedBooksLoading) {
          return const CustomLoadingIndicator();
        } 
          return Container();
        
      },
    );
  }
}
