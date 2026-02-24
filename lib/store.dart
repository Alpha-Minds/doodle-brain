import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  Widget storeCard({
    required String title,
    required String image,
    required int price,
    double imageHeight = 90, 
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5E6D3),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: imageHeight,
              fit: BoxFit.contain,
            ),

            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF3E2C23),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5E3C),
                foregroundColor: const Color(0xFFF5E6D3),
                minimumSize: const Size(double.infinity, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Buy "),
                  Text(
                    "$price",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/background.png",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Store",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3E2C23),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius:22 ,
                      backgroundImage:
                          AssetImage("assets/coin.png"),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "250",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E2C23),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// ===== Characters =====
                        const Text(
                          "Characters",
                          style: TextStyle(
                            color: Color(0xFF3E2C23),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        SizedBox(
                          height: 230,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            scrollDirection: Axis.horizontal,
                            children: [
                              storeCard(
                                title: "Warrior",
                                image: "assets/character3.png",
                                price: 500,
                                imageHeight: 90,
                              ),
                              storeCard(
                                title: "Mage",
                                image: "assets/character4.png",
                                price: 600,
                                imageHeight: 90,
                              ),
                              storeCard(
                                title: "Cyber Ninja",
                                image: "assets/character2.png",
                                price: 800,
                                imageHeight: 90,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 35),

                        /// ===== Weapons =====
                        const Text(
                          "Weapons",
                          style: TextStyle(
                            color: Color(0xFF3E2C23),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        SizedBox(
                          height: 260,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            scrollDirection: Axis.horizontal,
                            children: [
                              storeCard(
                                title: "Fire Gun",
                                image: "assets/gun2.png",
                                price: 400,
                                imageHeight: 130, 
                              ),
                              storeCard(
                                title: "Ice Gun",
                                image: "assets/gun3.png",
                                price: 450,
                                imageHeight: 130,
                              ),
                              storeCard(
                                title: "Thunder Gun",
                                image: "assets/gun4.png",
                                price: 600,
                                imageHeight: 130,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}