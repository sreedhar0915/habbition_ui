import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productimage;
  final String productname;
  final String productdetails;
  final String productprice;

  const ProductCard({
    super.key,
    required this.productname,
    required this.productimage,
    required this.productdetails,
    required this.productprice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    productimage,
                    fit: BoxFit.contain,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline, color: Colors.green),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              productname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              productdetails,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  "₹$productprice",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 29,
                    width: 33,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
