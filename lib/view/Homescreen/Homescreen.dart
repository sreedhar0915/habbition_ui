import 'package:flutter/material.dart';
import 'package:habbition_ui/services/controller/homescreen_controller.dart';
import 'package:habbition_ui/view/Global_widget/Product_card.dart';
import 'package:habbition_ui/view/Product_screen/product_screen.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<HomescreenController>().fetchproduct();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarsection(),
      body: Consumer<HomescreenController>(
        builder: (context, value, child) => value.isloading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 47,
                          width: 252,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    color: Colors.grey,
                                    offset: Offset(0, 3))
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search),
                              label: Text("Search for products"),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image 10.png")))),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          backgroundImage:
                              AssetImage("assets/images/Ellipse 133.png"),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(52, 161, 65, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AI-powered Personalized",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "Diet for just ₹49/month!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 28,
                                width: 114,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "DOWNLOAD NOW",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          width: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/happy-surprised-sociable-lady-looks-positively-screen-cell-phone-recieves-good-news-uses-modern-technologies-online-communication 1.png"))),
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "All products",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(49, 89, 48, 1)),
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/images/Frame (1).png"),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemCount: value.productlist.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                    productimage: value.productlist[index].image
                                        .toString(),
                                    productname: value.productlist[index].title
                                        .toString(),
                                    productdetails: value
                                        .productlist[index].description
                                        .toString(),
                                    productprice: value.productlist[index].price
                                        .toString(),
                                  ),
                                ));
                          },
                          child: ProductCard(
                            productimage:
                                value.productlist[index].image.toString(),
                            productname:
                                value.productlist[index].title.toString(),
                            productdetails:
                                value.productlist[index].description.toString(),
                            productprice:
                                value.productlist[index].price.toString(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  AppBar Appbarsection() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios),
      title: Text("Go Back"),
    );
  }
}
