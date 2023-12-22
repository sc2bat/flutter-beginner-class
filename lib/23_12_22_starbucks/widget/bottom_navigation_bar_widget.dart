import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Pay',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.coffee),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Other',
        ),
      ],
      selectedItemColor: Colors.lightGreen, // 선택된 아이템 색상
      unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
      currentIndex: _selectedIndex, // 현재 선택된 인덱스
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
