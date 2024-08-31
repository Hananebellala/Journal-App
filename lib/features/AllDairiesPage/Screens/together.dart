import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Widgets/NavBar.dart';
import 'package:my_journey/features/AllDairiesPage/Screens/alldiariesEmpty.dart';
import 'package:my_journey/features/AllDairiesPage/Screens/onthisdayempty.dart';

class Together extends StatefulWidget {
  const Together({super.key});

  @override
  State<Together> createState() => _TogetherState();
}

class _TogetherState extends State<Together>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 50), // 40 pixels from top
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFAF3),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: const Color(0xFF7469B6),
                borderRadius: BorderRadius.circular(5),
              ),
              tabs: [
                Tab(
                  child: Container(
                    width: 180,
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      'All Diaries',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'CourierPrime',
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 180,
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      'On This Day',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'CourierPrime',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AlldairiesEmpty(),
          Onthisdayempty(),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
