import 'package:flutter/material.dart';

class TabNavigationPage extends StatelessWidget {
  const TabNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabbed View'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.fiber_new), text: 'Latest'),
              Tab(icon: Icon(Icons.trending_up), text: 'Trending'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _LatestTab(),
            _TrendingTab(), // << updated
            _ProfileTab(),
          ],
        ),
      ),
    );
  }
}

class _LatestTab extends StatelessWidget {
  const _LatestTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.article),
          title: Text('Flutter 4.0 Released'),
          subtitle: Text('New widgets, faster builds, more suffering.'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.new_releases),
          title: Text('Dart Adds Records & Patterns'),
          subtitle: Text('Real pattern matching.'),
        ),
      ],
    );
  }
}

class _TrendingTab extends StatelessWidget {
  const _TrendingTab();

  @override
  Widget build(BuildContext context) {
    final items = [
      'Flutter is hot',
      'Dart is Cool',
      'Stock market rising',
      'Memes are the new news',
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.trending_up),
          title: Text(items[index]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You tapped on "${items[index]}"')),
            );
          },
        );
      },
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=10'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Archana Mohanty',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Flutter Developer'),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
