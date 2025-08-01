import 'package:flutter/material.dart';
import 'package:job/Dashboard.dart';

class Purchasepage extends StatefulWidget {
  const Purchasepage({super.key});

  @override
  State<Purchasepage> createState() => _PurchasepageState();
}

class _PurchasepageState extends State<Purchasepage> {
  final List<Map<String, dynamic>> features = [
    {
      'title': 'Free Lifetime Update',
      'icon': Icons.sync,
      'color': Colors.purple,
    },
    {
      'title': 'Android & iOS App Support',
      'icon': Icons.smartphone,
      'color': Colors.pink,
    },
    {
      'title': 'Premium Customer Support',
      'icon': Icons.support_agent,
      'color': Colors.cyan,
    },
    {
      'title': 'Custom Invoice Branding',
      'icon': Icons.receipt_long,
      'color': Colors.green,
    },
    {
      'title': 'Unlimited Usage',
      'icon': Icons.all_inclusive,
      'color': Colors.amber[700],
    },
    {
      'title': 'Free Data Backup',
      'icon': Icons.backup,
      'color': Colors.deepPurple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Purchase Premium Plan',
            style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // This goes back to the previous page
                },
                icon: Icon(Icons.close, size: 25, color: Colors.black),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              itemCount: features.length,
              separatorBuilder: (_, __) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                final feature = features[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 4)],
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: feature['color']!.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        feature['icon'],
                        color: feature['color'],
                        size: 24,
                      ),
                    ),
                    title: Text(
                      feature['title'],
                      style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.info_outline, color: Colors.grey),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Our premium Plan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 1 Month
                    Container(
                      width: 100,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "1 Month",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                          Text("\$350.00", style: TextStyle(color: Colors.blueAccent.shade100, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    // Mobile App + Desktop (Save 65%)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            border: Border.all(color: Colors.orange.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Mobile App +\nDesktop",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "1 Year",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              Text("\$1350.00", style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.bold)),
                              Text("\$3850.00",
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              "Save 65%",
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Lifetime Purchase (On Sale)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Lifetime\nPurchase",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              Text("\$850.00", style: TextStyle(color: Colors.deepPurple.shade200, fontWeight: FontWeight.bold)),
                              Text("\$950.00",
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              "On Sale",
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                fixedSize: Size(340, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
              ),
                onPressed: () {}, child: Text('Buy Now', style: TextStyle(fontSize: 18),))
          ],
        ));
  }
}
