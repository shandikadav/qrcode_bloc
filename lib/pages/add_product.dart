import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            autocorrect: false,
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Product Code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: false,
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Product Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: false,
            controller: qtyController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add Product'),
          ),
        ],
      ),
    );
  }
}
