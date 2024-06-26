import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/widgets/product_item.dart';
import 'package:store_pro/product_store/widgets/search_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _query)
      ..addListener(_onQueryChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged() {
    setState(() {
      _query = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MySearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final filteredProducts = model.search(_query);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
          child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 210, 180, 204),
        ),
        child: Column(
          children: [
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ProductItem(icecream: filteredProducts[index]);
                },
                itemCount: filteredProducts.length,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
