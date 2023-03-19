import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({required String bookName}) async{
  try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=$bookName');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString())); 
    }
  }
}
