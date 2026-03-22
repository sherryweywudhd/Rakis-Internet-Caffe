import 'package:flutter/material.dart';

// --- PRODUCT MODEL ---
class Product {
  final String id;
  final String name;
  final String size;
  final String description;
  final String price;
  final String category;
  final String subCategory;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.size,
    required this.description,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.image,
  });
}

// --- MAIN SCREEN ---
class KioskHomeScreen extends StatefulWidget {
  const KioskHomeScreen({super.key});

  @override
  State<KioskHomeScreen> createState() => _KioskHomeScreenState();
}

class _KioskHomeScreenState extends State<KioskHomeScreen> {
  // Default states based on your screenshots
  String activeCategory = "Foods/Snacks";
  String activeSub = "Fries";
  String activeSize = "Small";
  List<String> cartItems = [];

  // --- YOUR ORIGINAL PRODUCTS (PRESERVED) ---
  final List<Product> menu = [
    Product(
      id: "1",
      name: "Classic",
      size: "8oz",
      description: "Arabica",
      price: "45",
      category: "Coffees/Latte",
      subCategory: "Hot Coffee",
      image: "assets/arabic.png",
    ),
    Product(
      id: "2",
      name: "Classic",
      size: "16oz",
      description: "Arabica",
      price: "55",
      category: "Coffees/Latte",
      subCategory: "Hot Coffee",
      image: "assets/arabic.png",
    ),
    Product(
      id: "3",
      name: "Cafe Latte",
      size: "8oz",
      description: "Arabica",
      price: "59",
      category: "Coffees/Latte",
      subCategory: "Hot Coffee",
      image: "assets/cafe.png",
    ),
    Product(
      id: "4",
      name: "Cafe Latte",
      size: "16oz",
      description: "Arabica",
      price: "69",
      category: "Coffees/Latte",
      subCategory: "Hot Coffee",
      image: "assets/cafe.png",
    ),
    Product(
      id: "5",
      name: "Iced",
      size: "16oz",
      description: "Latte",
      price: "39",
      category: "Coffees/Latte",
      subCategory: "Iced Coffee",
      image: "assets/iced_latte.png",
    ),
    Product(
      id: "6",
      name: "Iced",
      size: "16oz",
      description: "Mocha",
      price: "49",
      category: "Coffees/Latte",
      subCategory: "Iced Coffee",
      image: "assets/iced_mocha.png",
    ),
    Product(
      id: "7",
      name: "Iced Brown",
      size: "16oz",
      description: "Sugar Latte",
      price: "49",
      category: "Coffees/Latte",
      subCategory: "Iced Coffee",
      image: "assets/iced_brown.png",
    ),
    Product(
      id: "8",
      name: "Burger",
      size: "",
      description: "Classic",
      price: "45",
      category: "Foods/Snacks",
      subCategory: "Burger",
      image: "assets/burger_classic.png",
    ),
    Product(
      id: "9",
      name: "Cheese",
      size: "",
      description: "Burger",
      price: "55",
      category: "Foods/Snacks",
      subCategory: "Burger",
      image: "assets/cheese_bur.png",
    ),
    Product(
      id: "10",
      name: "Burger",
      size: "",
      description: "with egg",
      price: "59",
      category: "Foods/Snacks",
      subCategory: "Burger",
      image: "assets/burger_egg.png",
    ),
    Product(
      id: "11",
      name: "Burger",
      size: "",
      description: "Overload",
      price: "59",
      category: "Foods/Snacks",
      subCategory: "Burger",
      image: "assets/burger_overload.png",
    ),
    Product(
      id: "12",
      name: "Hotdog",
      size: "",
      description: "Sandwich",
      price: "45",
      category: "Foods/Snacks",
      subCategory: "Hotdog",
      image: "assets/hotdog_sandwich.png",
    ),
    Product(
      id: "13",
      name: "Hotdog",
      size: "",
      description: "Overload",
      price: "65",
      category: "Foods/Snacks",
      subCategory: "Hotdog",
      image: "assets/hotdog_overload.png",
    ),
    Product(
      id: "14",
      name: "Cheese",
      size: "",
      description: "Fries",
      price: "45",
      category: "Foods/Snacks",
      subCategory: "Fries",
      image: "assets/fries_cheese.jpg",
    ),
    Product(
      id: "15",
      name: "Bbq",
      size: "",
      description: "Fries",
      price: "65",
      category: "Foods/Snacks",
      subCategory: "Fries",
      image: "assets/fries_bbq.jpg",
    ),
    Product(
      id: "16",
      name: "Sour and Cream",
      size: "",
      description: "Fries",
      price: "65",
      category: "Foods/Snacks",
      subCategory: "Fries",
      image: "assets/fries_sour_cream.jpg",
    ),
    Product(
      id: "17",
      name: "Cheese Stick",
      size: "6pcs",
      description: "Classic",
      price: "50",
      category: "Foods/Snacks",
      subCategory: "Cheese Stick",
      image: "assets/cheese_stick.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = menu
        .where(
          (p) => p.category == activeCategory && p.subCategory == activeSub,
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "CATEGORY",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildTopTabs(),
          Expanded(
            child: Row(
              children: [
                _buildSidebar(),
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        if (activeCategory != "Foods/Snacks")
                          _buildSizeFilter(),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(12),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.65, // Adjusted for the new price/size labels
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                            itemCount: filteredItems.length,
                            itemBuilder: (c, i) => ProductCard(
                              product: filteredItems[i],
                              isAdded: cartItems.contains(filteredItems[i].id),
                              onAdd: () => setState(
                                () => cartItems.add(filteredItems[i].id),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildTopTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ["Coffees/Latte", "Foods/Snacks", "Drinks/Tea"].map((cat) {
          bool isSel = activeCategory == cat;
          return ChoiceChip(
            selectedColor: const Color(0xFF5DFD89),
            backgroundColor: Colors.white,
            label: Text(
              cat,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            selected: isSel,
            onSelected: (_) => setState(() {
              activeCategory = cat;
              if (cat == "Foods/Snacks")
                activeSub = "Fries";
              else if (cat == "Coffees/Latte")
                activeSub = "Hot Coffee";
              else
                activeSub = "Milkshake";
            }),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSizeFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ["Small", "Medium", "Large"].map((size) {
        bool isSel = activeSize == size;
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ChoiceChip(
            label: Text(size),
            selected: isSel,
            onSelected: (_) => setState(() => activeSize = size),
            selectedColor: const Color(0xFF5DFD89),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSidebar() {
    List<String> subs = (activeCategory == "Foods/Snacks")
        ? ["Burger", "Hotdog", "Fries", "Cheese Stick"]
        : (activeCategory == "Drinks/Tea"
              ? ["Milkshake", "Milktea", "Fruit Soda"]
              : ["Hot Coffee", "Iced Coffee"]);

    return SizedBox(
      width: 100,
      child: ListView(
        children: subs.map((s) {
          bool isSel = activeSub == s;
          return GestureDetector(
            onTap: () => setState(() => activeSub = s),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSel ? const Color(0xFFE8FDF0) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSel ? const Color(0xFF5DFD89) : Colors.grey.shade200,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    _getSidebarIcon(s),
                    height: 50,
                    errorBuilder: (c, e, s) => const Icon(Icons.fastfood),
                  ),
                  Text(
                    s,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getSidebarIcon(String s) {
    if (s == "Fries") return "assets/fries_cheese.jpg";
    if (s == "Burger") return "assets/burger_classic.png";
    if (s == "Hotdog") return "assets/hotdog_sandwich.png";
    if (s == "Cheese Stick") return "assets/cheese_stick.jpg";
    return "assets/arabic.png";
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 30),
            onPressed: () => setState(() => cartItems.clear()),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA26B),
                minimumSize: const Size(0, 60),
              ),
              onPressed: () {},
              child: Text(
                activeCategory == "Drinks/Tea"
                    ? "View Cart (${cartItems.length})"
                    : "View Order (${cartItems.length})",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PRODUCT CARD WIDGET ---
class ProductCard extends StatelessWidget {
  final Product product;
  final bool isAdded;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.product,
    required this.isAdded,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(child: Image.asset(product.image, fit: BoxFit.contain)),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA26B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "₱${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (product.size.isNotEmpty)
                      Text(
                        "(${product.size})",
                        style: const TextStyle(
                          color: Color(0xFFFFA26B),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                  ],
                ),
                Text(
                  product.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isAdded ? null : onAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAdded
                          ? Colors.grey[300]
                          : const Color(0xFF5DFD89),
                    ),
                    child: Text(
                      isAdded ? "Added" : "Add",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
