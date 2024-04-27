import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvc_2/controller/product_controller.dart';
import 'package:mvc_2/model/product_model.dart';
import 'package:mvc_2/view/product_display_data.dart';

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
          // GestureDetector(
          //   onTap: () {
          //     var tempobj = ProductModel(
          //         imgurl: urlController.text.trim(),
          //         name: nameController.text.trim(),
          //         price: int.parse(priceCOntroller.text.trim()),
          //         quentity: 2,
          //         favorite: false);
          //     Provider.of<ProductController>(context, listen: false)
          //         .addproduct(tempobj);

          //     urlController.clear();
          //     nameController.clear();
          //     priceCOntroller.clear();
          //   },
          //   child: const Text("Add"),
          // ),
          ElevatedButton(
            onPressed: () {
              var tempobj = ProductModel(
                  imgurl: urlController.text.trim(),
                  name: nameController.text.trim(),
                  price: int.parse(priceCOntroller.text.trim()),
                  quentity: 2,
                  favorite: false);
              Provider.of<ProductController>(context, listen: false)
                  .addproduct(tempobj);

              urlController.clear();
              nameController.clear();
              priceCOntroller.clear();
            },
            child: const Text("Add"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
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
