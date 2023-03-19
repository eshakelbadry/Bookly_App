import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/utils/setup_service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/data/repos/search_repo_impl.dart';
import '../../Features/search/presentation/manager/searched_books_cubit/searched_books_cubit.dart';
import '../../Features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchedBooksCubit(
            getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
      //    GoRoute(
      //     path: kSearchView,
      //     builder: (context, state) =>  const SearchView(),
      //   ),
    ],
  );
}
