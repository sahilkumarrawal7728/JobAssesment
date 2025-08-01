import 'package:flutter/material.dart';
import 'package:job/PurchasePage.dart';
import 'package:job/SaleList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maan Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const Center(child: Text('Sales Screen')),
    const Center(child: Text('Reports Screen')),
    const Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 30,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(backgroundColor: Colors.white54, icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Sales"),
          BottomNavigationBarItem(icon: Icon(Icons.text_snippet_outlined), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Setting"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.deepPurple,
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.person, color: Colors.purple),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Maan Store', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Premium Plan Plan', style: TextStyle(color: Colors.white70, fontSize: 13))
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade400,
                      radius: 25,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    color: Colors.grey.shade300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: SizedBox(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Dashboard Overview", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                                    Switch(value: false, onChanged: null),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 1,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                _buildGridItem(
                  Icons.shopping_cart_rounded,
                  "Sales",
                  Colors.purple,
                  Colors.purple.shade100,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductListPage()),
                    );
                  },
                ),
                _buildGridItem(Icons.people, "Parties", Colors.pink, Colors.pink.shade100,),
                _buildGridItem(Icons.add_shopping_cart, "Purchase", Colors.green, Colors.green.shade100,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Purchasepage()),
                    );
                  },
                ),
                _buildGridItem( Icons.widgets, "Product", Colors.blue, Colors.blue.shade100),
                _buildGridItem(Icons.receipt_long, "Due List", Colors.orange, Colors.orange.shade100),
                _buildGridItem(Icons.lan, "Stocks", Colors.teal, Colors.teal.shade100),
                _buildGridItem(Icons.text_snippet_rounded, "Reports", Colors.pink, Colors.red.shade100),
                _buildGridItem(Icons.shopping_bag, "Sales List", Colors.deepPurple, Colors.deepPurple.shade100),
                _buildGridItem(Icons.assignment, "Purchase ...", Colors.purple, Colors.purple.shade100),
                _buildGridItem(Icons.legend_toggle, "Loss/Profit", Colors.green, Colors.green.shade100),
                _buildGridItem(Icons.library_books_sharp, "Ledger", Colors.blue, Colors.blue.shade100),
                _buildGridItem(Icons.wallet_rounded, "Expense", Colors.orange, Colors.orange.shade100),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ✅ Modified to include onTap (optional)
Widget _buildGridItem(IconData icon, String title,
    Color iconColor, Color bgColor, { VoidCallback? onTap,}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: bgColor,
            child: Icon(icon, size: 45, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black54), textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
