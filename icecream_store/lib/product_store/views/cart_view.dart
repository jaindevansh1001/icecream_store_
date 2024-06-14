import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/widgets/cart_item.dart';
import 'package:store_pro/themes/styles.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _State();
}

class _State extends State<CartView> {
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? pin;
  DateTime? dateTime = DateTime.now();
  final formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
        prefixIcon: Icon(Ionicons.person_outline),
      ),
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value;
      },
      onChanged: (value) => setState(() => name = value),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        prefixIcon: Icon(Ionicons.mail_outline),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter valid email address';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value;
      },
      onChanged: (value) => setState(() => email = value),
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Mobile',
        prefixIcon: Icon(Ionicons.call_outline),
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Mobile is required';
        }
        return null;
      },
      onSaved: (String? value) {
        mobile = value;
      },
      onChanged: (value) => setState(() => mobile = value),
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Address',
        prefixIcon: Icon(Ionicons.location_outline),
      ),
      keyboardType: TextInputType.streetAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is required';
        }
        return null;
      },
      onSaved: (String? value) {
        address = value;
      },
      onChanged: (value) => setState(() => address = value),
    );
  }

  Widget _buildPin() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Pin',
        prefixIcon: Icon(Ionicons.pin_outline),
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Pin is required';
        }
        return null;
      },
      onSaved: (String? value) {
        pin = value;
      },
      onChanged: (value) => setState(() => pin = value),
    );
  }

  Widget _buildTimePicker() {
    return InkWell(
      onTap: () async {
        final newTime = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(
            2025,
          ),
        );
        if (newTime != null) {
          setState(() {
            dateTime = newTime;
          });
        }
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Icon(
                    Ionicons.time_outline,
                    size: 28,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Delivery Time',
                    style: Styles.dilveryTimeTable,
                  )
                ],
              ),
              Text(
                DateFormat.yMMMd().add_jm().format(dateTime!),
                style: Styles.dileveryTime,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListView(
            children: [
              ExpansionTile(
                title: const Text('Address Details'),
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: _buildName(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: _buildEmail(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: _buildMobile(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: _buildAddress(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: _buildPin(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: _buildTimePicker(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              if (value.productsInCart.isNotEmpty) ...[
                ListView.builder(
                  itemBuilder: (context, index) {
                    return CartItem(
                      product: value.getProductbyId(
                        value.productsInCart.keys.toList()[index],
                      ),
                      quantity: value.productsInCart.values.toList()[index],
                    );
                  },
                  itemCount: value.productsInCart.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shipping + Tax',
                        style: Styles.productRowItemPrice,
                      ),
                      Text(
                        '₹ ${value.shippingCost.toStringAsFixed(2)} + ${value.tax.toStringAsFixed(2)}',
                        style: Styles.productRowItemPrice,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: Styles.productRowItemName,
                      ),
                      Text(
                        '₹ ${value.totalCost.toStringAsFixed(2)}',
                        style: Styles.productRowItemName,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        value.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order Placed Successfully'),
                          ),
                        );
                      }
                    },
                    child: const Text('Place Order'),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
