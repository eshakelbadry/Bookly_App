import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'book_details_section.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_item.dart';
import 'similar_books_list_view.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children:  [
                const CustomBookDetailsAppBar(),
                BooksDetailsSection(bookModel: bookModel),
               const Expanded(child: SizedBox(height: 50)),
               const SimilarBooksSection(),
               const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
