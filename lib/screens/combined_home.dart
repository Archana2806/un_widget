import 'package:flutter/material.dart';
import 'package:un_widget/screens/product_list_page.dart';
import 'package:un_widget/screens/tab_navigation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _CombinedHomePageState();
}

class _CombinedHomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _pageDetails = const [
    (icon: Icon(Icons.list), label: 'Products', page: ProductListPage()),
    (icon: Icon(Icons.tab), label: 'Tabs', page: TabNavigationPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedIndex].label),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            for (int i = 0; i < _pageDetails.length; i++)
              ListTile(
                leading: _pageDetails[i].icon,
                title: Text(_pageDetails[i].label),
                selected: _selectedIndex == i,
                onTap: () {
                  setState(() {
                    _selectedIndex = i;
                  });
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
      body: _pageDetails[_selectedIndex].page,
    );
  }
}