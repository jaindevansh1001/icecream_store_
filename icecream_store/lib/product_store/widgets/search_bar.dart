import 'package:flutter/material.dart';
import 'package:store_pro/themes/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar(
      {required this.controller, required this.focusNode, super.key});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 227, 227),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 4,
                offset: const Offset(0,2),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: Styles.searchText,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed:controller.clear,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
