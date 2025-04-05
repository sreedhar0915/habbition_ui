import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List category = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 47,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 5,
                        color: Colors.grey,
                        offset: Offset(0, 3))
                  ]),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  label: Text("Search for products"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemCount: category.length,
                  itemBuilder: (context, index) => Container(
                        width: 161,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/background image.jpeg"),
                                fit: BoxFit.cover)),
                        child: Center(
                            child: Text(
                          category[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
