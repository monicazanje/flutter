import 'package:flutter/material.dart';
import 'package:model_view_controller/controller/product_controller.dart';
import 'package:model_view_controller/view/product_display_data.dart';
import 'package:provider/provider.dart';
import 'package:model_view_controller/model/product_model.dart';

class GetProductData extends StatefulWidget {
  const GetProductData({super.key});
  @override
  State createState() => _MyAppState();
}

TextEditingController urlController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController priceCOntroller = TextEditingController();

class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model View Controller"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                  hintText: "Enter name"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: priceCOntroller,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                  hintText: "enter price"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: urlController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                  hintText: "Enter url"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ProductController>(context, listen: false).addProduct(
                  ProductModel(
                      imgurl: urlController.text,
                      name: nameController.text,
                      price: int.parse(priceCOntroller.text),
                      quentity: 2,
                      favorite: false),);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDisplayData(),
                ),
              );
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
