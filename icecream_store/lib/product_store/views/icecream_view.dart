import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/widgets/product_item.dart';
import 'package:velocity_x/velocity_x.dart';

class IceCreamView extends StatelessWidget {
  const IceCreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child:const Text(
            'Icecreams',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              color: Color.fromARGB(255, 31, 1, 11),
            ),
          ),
        ),
        actions: [
          const VxDarkModeButton(
            showSelectedIcon: true,).p(6),
        ],
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          final products = value.getProducts();
          return ListView.builder(
            itemBuilder: (context, index) {
              return ProductItem(icecream: products[index]);
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
