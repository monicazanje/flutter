import 'package:flutter/material.dart';
import 'package:mvc_2/controller/product_controller.dart';
import 'package:mvc_2/controller/wishlist_controller.dart';
//import 'package:mvc_2/controller/wishlist_controller.dart';
import 'package:mvc_2/view/product_wishlist.dart';
import 'package:provider/provider.dart';
//import 'package:mvc_2/model/product_model.dart';

class ProductDisplayData extends StatefulWidget {
  const ProductDisplayData({super.key});
  @override
  State createState() => _ProductDisplayData();
}

class _ProductDisplayData extends State {
  @override
  Widget build(BuildContext context) {
    var productdetail = Provider.of<ProductController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Data"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProductWishlist();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productdetail.listofproduct.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(10),
                child: Image.network(
                    "${productdetail.listofproduct[index].imgurl}"),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("name: ${productdetail.listofproduct[index].name}"),
              const SizedBox(
                height: 20,
              ),
              Text("Price: ${productdetail.listofproduct[index].price}"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Consumer<ProductController>(
                    builder: (context, provider, child) {
                      return IconButton(
                        onPressed: () {
                          productdetail.addfavorite(index: index);
                          if (productdetail.listofproduct[index].favorite) {
                            Provider.of<WishlistController>(context,
                                    listen: false)
                                .add(obj: productdetail.listofproduct[index]);
                          }
                        },
                        icon: Icon((productdetail.listofproduct[index].favorite)
                            ? Icons.favorite_outline
                            : Icons.favorite_outline_rounded),
                      );
                    },
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Provider.of<ProductController>(context,
                            //         listen: false)
                            //     .addquentity(index: index);
                            productdetail.addquentity(index: index);
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Consumer<ProductController>(
                            builder: (context, value, child) {
                          return Text(
                              "${productdetail.listofproduct[index].quentity}");
                        }),
                        IconButton(
                          onPressed: () {
                            // Provider.of<ProductController>(context,
                            //         listen: false)
                            //     .removequentity(index: index);
                            productdetail.removequentity(index: index);
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
