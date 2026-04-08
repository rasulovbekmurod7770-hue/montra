import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPeriod = 0;
  final periods = ["Today", "Week", "Month", "Year"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor, // change to your color
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_rounded),
              color: AppColors.primaryColor,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.swap_horiz_rounded),
              color: Colors.grey,
              onPressed: () {},
            ),
            const SizedBox(width: 48), // space for FAB
            IconButton(
              icon: const Icon(Icons.pie_chart_rounded),
              color: Colors.grey,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_rounded),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFFF6E5),
                    const Color(0xFFFFF6E5).withValues(alpha: 0),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primaryColor,
                        // backgroundImage: AssetImage("assets/images/avatar.png"),
                      ),
                      SizedBox(
                        width: 130,
                        child: DropdownButtonFormField(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 24,
                            color: AppColors.primaryColor,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFF1F1FA),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFF1F1FA),
                              ),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "october",
                              child: Text(
                                "October",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                      Icon(
                        Icons.notifications_rounded,
                        size: 32,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Account Balance",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF91919F),
                    ),
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    "\$9400",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF161719),
                    ),
                  ),
                  const SizedBox(height: 27),

                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00A86B),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Income",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "\$5000",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFD3C4A),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_upward_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expenses",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "\$1200",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 13),

            Padding(
              padding: const .symmetric(horizontal: 16),
              child: Text(
                "Spend Frequency",
                style: TextStyle(fontWeight: .w600, fontSize: 18),
              ),
            ),
            const SizedBox(height: 13),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),

                // child: Image.asset("assets/images/graph.png", fit: BoxFit.fill),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1FA),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  children: List.generate(periods.length, (index) {
                    final isSelected = selectedPeriod == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedPeriod = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFFCF0DD)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Text(
                              periods[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : const Color(0xFF91919F),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Transaction",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF161719),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCF0DD),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── transaction items ────────────────────────────────
            _transactionItem(
              // replace Icon with Image.asset("assets/images/shopping.png")
              icon: Icons.shopping_bag_rounded,
              iconBg: const Color(0xFFFCEED4),
              iconColor: const Color(0xFFFCAC12),
              title: "Shopping",
              subtitle: "Buy some grocery",
              amount: "- \$120",
              time: "10:00 AM",
              amountColor: const Color(0xFFFD3C4A),
            ),
            _transactionItem(
              icon: Icons.subscriptions_rounded,
              iconBg: const Color(0xFFEEE5FF),
              iconColor: const Color(0xFF7F3DFF),
              title: "Subscription",
              subtitle: "Disney+ Annual..",
              amount: "- \$80",
              time: "03:30 PM",
              amountColor: const Color(0xFFFD3C4A),
            ),
            _transactionItem(
              icon: Icons.restaurant_rounded,
              iconBg: const Color(0xFFFFDDD5),
              iconColor: const Color(0xFFFD3C4A),
              title: "Food",
              subtitle: "Buy a ramen",
              amount: "- \$32",
              time: "07:30 PM",
              amountColor: const Color(0xFFFD3C4A),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required String time,
    required Color amountColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 28),
            // replace with:
            // child: Image.asset("assets/images/your_icon.png"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF161719),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF91919F),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF91919F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
