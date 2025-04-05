import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String productimage;
  final String productname;
  final String productdetails;
  final String productprice;
  const ProductScreen(
      {super.key,
      required this.productname,
      required this.productimage,
      required this.productdetails,
      required this.productprice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Stack(children: [
                Container(
                  height: 245,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                      image: DecorationImage(
                          image: NetworkImage("$productimage"))),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline,
                        size: 30, color: Colors.green),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios,
                        size: 30, color: Colors.green),
                  ),
                ),
              ]),
              SizedBox(height: 10),
              Text(
                "$productname",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                "$productdetails",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$productprice",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      )),
                  SizedBox(width: 2),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Center(child: Text("0")),
                  ),
                  SizedBox(width: 2),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30, color: Colors.green),
                      )),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Spacer(),
                          Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
