import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => SearchProvider(),
      child: Scaffold(
          appBar: AppBar(
            leading: Consumer<SearchProvider>(builder: (context, value, child) {
              if (value.isSearching) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    value.setIsSearching(false);
                  },
                );
              } else {
                return Container();
              }
            }),
            title: Consumer<SearchProvider>(
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: value.isSearching
                      ? TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                          ),
                          onChanged: (text) {
                            value.setSearchText(text);
                          },
                        )
                      : const Text('My App'),
                );
              },
            ),
            actions: <Widget>[
              Consumer<SearchProvider>(
                builder: (context, value, child) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      value.setIsSearching(true);
                    },
                  );
                },
              ),
            ],
          ),
          body: Consumer<SearchProvider>(builder: (context, value, child) 
          {
              return Text('Search text: ${value.searchText}');  
          },) ),
    );
  }
}
