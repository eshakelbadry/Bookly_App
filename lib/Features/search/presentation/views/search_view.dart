import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/models/book_model/book_model.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, });
 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      body: SearchViewBody(),
    ));
  }
}
