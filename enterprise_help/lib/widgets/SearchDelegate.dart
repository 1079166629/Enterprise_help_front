import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Dio.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/routes/UserSearchRoute.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    String hintText,
  }) : super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }
  @override
  TextInputType get keyboardType => TextInputType.number;

  Future<int> _onSearchUser(BuildContext context)  async {

    Global.findUser = await EA(context).findUser(int.parse(query));
    return Global.findUser.status;

  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _onSearchUser(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return UserSearchRoute(status: Global.findUser.status);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView();
  }
}