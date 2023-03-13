import 'package:dartz/dartz.dart';

import 'package:bookly_app/core/errors/failures.dart';

import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:programming');
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
   
    throw UnimplementedError();
  }
}
