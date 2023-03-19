import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());
  final SearchRepo searchRepo;
  var result;
  // List<BookModel> searchedBooksList = [];
  Future<void> fetchSearchedBooks({required String bookName}) async {
    emit(SearchedBooksLoading());
     result = await searchRepo.fetchSearchedBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchedBooksSuccess(books));
    });
  }

  void clearSearchResults() {
    result.clear();
    emit(SearchedBooksInitial());
  }
}
