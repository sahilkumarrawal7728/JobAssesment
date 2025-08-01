import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Sales List',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Product code*',
                        hintText: '25634',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    children: [Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.qr_code_2,color: Colors.green, size: 30),
                    ),
                      Positioned(
                        top: 0,
                          left: 0,
                          child: Icon(
                        Icons.horizontal_rule,color: Colors.red.shade200,size: 40,))
    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            // Product List
            Expanded(
              child: ListView(
                children: const [
                  ProductItem("assets/images/sale1.png", "Smart watch", "40", "\$45"),
                  ProductItem("assets/images/sale2.png", "winter jacket", "40", "\$50"),
                  ProductItem("assets/images/sale3.png", "Shoes for men", "40", "\$30"),
                  ProductItem("assets/images/sale4.png", "Tea & Coffee Mugs", "40", "\$35"),
                  ProductItem("assets/images/sale5.png", "Ladies Sweater", "40", "\$45"),
                  ProductItem("assets/images/sale6.png", "T-Shirts", "40", "\$35"),
                  ProductItem("assets/images/sale7.png", "Man Black Dress", "40", "\$60"),
                ],
              ),
            ),

            // Add button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 340,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Add New Product +",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Item widget (still within single file, no external custom widget)
class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String stock;
  final String price;

  const ProductItem(this.image, this.name, this.stock, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Container(
          width: 60,
          decoration: BoxDecoration(color: Colors.grey.shade100),
            child: Image.asset(image, width: 100, height: 100)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18)),
        subtitle: Text("Stock: $stock", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 12)),
        trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18)),
      ),
    );
  }
}
