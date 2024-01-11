import 'package:flutter/material.dart';
import 'package:project_flutter_test/component/ProductGridWidget.dart';
import 'package:project_flutter_test/component/ProductListWidget.dart';
import 'package:project_flutter_test/vo/StoreProduct.dart';

class MainProductPage extends StatefulWidget {
  MainProductPage({super.key});

  final List<StoreProduct> StoreList = [
    StoreProduct(productName: "포도", imagePath: "https://media.istockphoto.com/id/1295773461/ko/%EC%82%AC%EC%A7%84/%EB%B3%B4%EB%9D%BC%EC%83%89-%ED%8F%AC%EB%8F%84-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%ED%81%B4%EB%A6%AC%ED%95%91-%EA%B2%BD%EB%A1%9C-%ED%95%84%EB%93%9C%EC%9D%98-%EC%A0%84%EC%B2%B4-%EA%B9%8A%EC%9D%B4.jpg?s=1024x1024&w=is&k=20&c=yrp-d7Hq2UuHtDorR6NRWgeg8o6xZHAHgvRwfpIWbJA=", price: "3,000 원" ),
    StoreProduct(productName: "사과", imagePath: "https://media.istockphoto.com/id/185262648/ko/%EC%82%AC%EC%A7%84/%EB%A0%88%EB%93%9C-%EC%82%AC%EA%B3%BC%EB%82%98%EB%AC%B4-%EB%B0%8F-%EC%9E%8E-%ED%9D%B0%EC%83%89-%EB%B0%94%ED%83%95%EC%97%90-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD.jpg?s=1024x1024&w=is&k=20&c=7L6XOvvjEV2OYW6PyVtYCQfU97X5e6E8b6uPjSVms84=", price: "4,000 원" ),
    StoreProduct(productName: "두부", imagePath: "https://media.istockphoto.com/id/523444303/ko/%EC%82%AC%EC%A7%84/%EC%9C%A0%EA%B8%B0-%EB%82%A0%EA%B2%83-soy-%EB%91%90%EB%B6%80.jpg?s=1024x1024&w=is&k=20&c=X7oyWPGlZjQCGcfEdT_iE5lsGzeE2BiYwnLv24jv7WI=", price: "5,000 원" ),
    StoreProduct(productName: "어묵", imagePath: "https://media.istockphoto.com/id/463674463/ko/%EC%82%AC%EC%A7%84/%EC%9C%A0%EA%B8%B0-%ED%99%88%EB%A9%94%EC%9D%B4%ED%8A%B8-%ED%81%AC%EB%9E%A9-%EC%BC%80%EC%9D%B4%ED%81%AC.jpg?s=1024x1024&w=is&k=20&c=-mrgMadMNuBd9in2l7GADUVv2nZWsN45W_LhJU5C1Zc=", price: "6,000 원" ),
    StoreProduct(productName: "고무장갑", imagePath: "https://media.istockphoto.com/id/97505619/ko/%EC%82%AC%EC%A7%84/guantes-de-%EA%B3%A0%EB%A7%88.jpg?s=1024x1024&w=is&k=20&c=5BNwfAjZ2benQrdgYmVyB8CDgwtMqPL2RdfTkoPtMyM=", price: "7,000 원" ),
    StoreProduct(productName: "마우스", imagePath: "https://media.istockphoto.com/id/1145791506/ko/%EC%82%AC%EC%A7%84/%EC%82%AC%EB%AC%B4%EC%8B%A4-%EA%B0%9C%EB%85%90%EC%9D%98-%EB%8D%B0%EC%8A%A4%ED%81%AC%ED%86%B1%EC%97%90%EC%84%9C-%EC%8A%A4%ED%81%AC%EB%A1%A4-%EC%9B%B9-%ED%8E%98%EC%9D%B4%EC%A7%80-%EB%98%90%EB%8A%94-%EC%BB%B4%ED%93%A8%ED%84%B0-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%EC%97%90%EC%84%9C-%EC%9E%91%EC%97%85%EC%97%90-%EB%8C%80-%ED%95%9C-%EB%A7%88%EC%9A%B0%EC%8A%A4-%EC%BB%A4%EC%84%9C%EB%A5%BC-%EC%82%AC%EC%9A%A9-%ED%95%98-%EC%97%AC-%EC%A7%81%EC%9B%90-%EB%82%A8%EC%9E%90-%EC%86%90-%EB%8B%AB%EA%B8%B0.jpg?s=1024x1024&w=is&k=20&c=dl1UxQrvMc4-dSbZdF6nakKjDwCIK9gcmgTYiCIUy7w=", price: "8,000 원" ),
    StoreProduct(productName: "과자", imagePath: "https://media.istockphoto.com/id/1263686908/ko/%EC%82%AC%EC%A7%84/%ED%98%BC%ED%95%A9-%EC%A7%A0-%EC%8A%A4%EB%82%B5-%ED%94%8C%EB%9E%AB-%ED%8F%89%EC%8B%A0%EB%8F%84-%EC%9E%A5%EB%A9%B4-%EC%97%90-a-%EB%82%98%EB%AC%B4-%EB%B0%B0%EA%B2%BD.jpg?s=1024x1024&w=is&k=20&c=40sPe2J8yecPKYZngoNCGDYzOFZJrwvZMSanPa5ERyw=", price: "9,000 원" ),
    StoreProduct(productName: "에어컨", imagePath: "https://media.istockphoto.com/id/519620442/ko/%EC%82%AC%EC%A7%84/%EC%86%90%EC%9C%BC%EB%A1%9C-%EC%A7%81%EC%A0%91-%EC%9B%90%EA%B2%A9-%EC%A0%9C%EC%96%B4-%EA%B5%B4%EC%A0%88%EB%A5%A0%EC%9D%80-%EC%BB%A8%EB%94%94%EC%85%94%EB%84%88.jpg?s=1024x1024&w=is&k=20&c=a7k906PwZUFjL8xy8QKAuc8D5KSPJaLKlp3uVf1Gg8k=", price: "10,000 원" ),
  ];

  @override
  State<MainProductPage> createState() => _MainProductPageState();
}

class _MainProductPageState extends State<MainProductPage> {

  String select = "list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("싱싱마을"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      select = "list";
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(color: select == "list" ? Colors.blue : Colors.grey),
                      child: Text("그리드 뷰"),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      select = "grid";
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(color: select == "grid" ? Colors.blue : Colors.grey),
                      child: Text("리스트 뷰"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            if(select == "list")
              ProductGridWidget(storeProduct: widget.StoreList,),
            if(select == "grid")
              ProductListWidget(storeProduct: widget.StoreList,)
          ],
        ),
      ),
    );
  }
}
