class ProductModel {
  String imgurl;
  String name;
  int price;
  bool favorite = false;
  int quentity;
  ProductModel(
      {required this.imgurl,
      required this.name,
      required this.price,
      required this.favorite,
      required this.quentity});

  List productlist = [];
}
