import 'package:flutter/material.dart';

import '../vo/Product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product item;

  const ProductDetailPage({super.key, required this.item});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  bool isLike = false;

  late String? welcomeText;

  @override
  void initState() {
    // TODO: implement initState
    welcomeText = "헬로우";
    super.initState();
  }

  Future<String> getUserName() async {
    print('1');
    return "김사랑";
  }

  Future<String> getUserName2() async {
    await Future.delayed(Duration(seconds: 3),() {
    print('2');
    });
    return "김사랑";
  }

  Future<String> getUserName3() async {
    await Future.delayed(Duration(seconds: 3),() {
      print('3');
    });
    return "김사랑";
  }

  void printUserName() async {
    String ddd = await getUserName();
    getUserName2();
    getUserName3();
    print(ddd);
  }

  // void printUserName() {
  //   getUserName().then((value){
  //     print(value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name ?? ""),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              printUserName();
            },
            child: Text("유저이름 프린트"),
          ),
          Text(welcomeText??""),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Image.network(
                  widget.item.imagePath ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLike = !isLike;
                          }
                        );
                      },
                      child: Icon(isLike? Icons.favorite : Icons.favorite_border, color: Colors.pink,)))
            ],
          ),
          SizedBox(height: 10,),
          Text(widget.item.name ?? ""),
          SizedBox(height: 10,),
          Text("${widget.item.price} 원")
        ],
      ),
    );
  }
}
