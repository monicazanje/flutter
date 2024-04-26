import 'package:flutter/material.dart';
import 'package:model_view_controller/controller/product_controller.dart';
import 'package:provider/provider.dart';

class ProductDisplayData extends StatefulWidget {
  const ProductDisplayData({super.key});
  @override
  State createState() => _ProductDisplayData();
}

class _ProductDisplayData extends State {
  @override
  Widget build(BuildContext context) {
    var productdetail =
        Provider.of<ProductController>(context, listen: true).productobj!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Data"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 400,
            margin: const EdgeInsets.all(10),
            child: Image.network(productdetail.imgurl),
          ),
          const Spacer(
            flex: 1,
          ),
          Text("name: ${productdetail.name}"),
          const SizedBox(
            height: 20,
          ),
          Text("Price: ${productdetail.price}"),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Consumer(builder: (context, Provider, child) {
                return IconButton(
                  onPressed: () {
                    // Provider.of<ProductController>(context, listen: false)
                    //     .addquentity();
                  },
                  icon: const Icon(
                    Icons.favorite,
                  ),
                );
              }),
              const Spacer(
                flex: 1,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<ProductController>(context, listen: false)
                            .addquentity();
                      },
                      icon: const Icon(Icons.add),
                    ),
                    Consumer(builder: (context, Provider, child) {
                      return Text("${productdetail.quentity}");
                    }),
                    IconButton(
                      onPressed: () {
                        Provider.of<ProductController>(context, listen: false)
                            .removequentity();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
