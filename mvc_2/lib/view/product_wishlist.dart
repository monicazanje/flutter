import 'package:flutter/material.dart';
//import 'package:mvc_2/controller/product_controller.dart';
import 'package:mvc_2/controller/wishlist_controller.dart';
//import 'package:mvc_2/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductWishlist extends StatefulWidget {
  const ProductWishlist({super.key});
  @override
  State createState() => _ProductWishlistState();
}

class _ProductWishlistState extends State {
  @override
  Widget build(BuildContext context) {
    var productdetail = Provider.of<WishlistController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("WishList"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Consumer(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: productdetail.productlist.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    child:
                        Image.network(productdetail.productlist[index].imgurl),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("name: ${productdetail.productlist[index].name}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Price: ${productdetail.productlist[index].price}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer(
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<WishlistController>(context)
                              .remove(index: index);
                        },
                        child: const Icon(Icons.favorite),
                      );
                      // return IconButton(
                      //   onPressed: () {
                      //     Provider.of<WishlistController>(context).remove(index: index);
                      //   },
                      //   icon: const Icon(
                      //     Icons.favorite,
                      //   ),
                      // );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
