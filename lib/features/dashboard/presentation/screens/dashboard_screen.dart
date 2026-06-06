import 'dart:io';

import 'package:flutter/material.dart';
import '../../../plants/presentation/screens/plant_detail_screen.dart';
import '../../../plants/presentation/widgets/add_plant_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // State for mock tasks to show interactivity
  final List<Map<String, dynamic>> _tasks = [
    {
      'id': 1,
      'name': 'Water Snake Plant',
      'location': 'Living Room',
      'icon': Icons.water_drop_rounded,
      'color': Colors.blue,
      'completed': false,
    },
    {
      'id': 2,
      'name': 'Fertilize Monstera',
      'location': 'Balcony',
      'icon': Icons.opacity_rounded,
      'color': Colors.purple,
      'completed': false,
    },
    {
      'id': 3,
      'name': 'Prune Bonsai',
      'location': 'Study Room',
      'icon': Icons.content_cut_rounded,
      'color': Colors.orange,
      'completed': false,
    },
    {
      'id': 4,
      'name': 'Repot Aloe Vera',
      'location': 'Bedroom',
      'icon': Icons.grid_view_rounded,
      'color': Colors.brown,
      'completed': true,
    },
  ];

  // State for search and filter chips
  String _searchQuery = '';
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _plants = [
    {
      'name': 'Snake Plant',
      'species': 'Sansevieria trifasciata',
      'location': 'Living Room',
      'watering': 0.8,
      'nextWatering': '3 days left',
      'image': 'spa_rounded',
      'health': 'Excellent',
    },
    {
      'name': 'Monstera',
      'species': 'Monstera deliciosa',
      'location': 'Balcony',
      'watering': 0.4,
      'nextWatering': 'Tomorrow',
      'image': 'spa_rounded',
      'health': 'Healthy',
    },
    {
      'name': 'Mini Bonsai',
      'species': 'Ficus microcarpa',
      'location': 'Study Room',
      'watering': 0.2,
      'nextWatering': 'Needs water now!',
      'image': 'spa_rounded',
      'health': 'Needs Attention',
    },
    {
      'name': 'Aloe Vera',
      'species': 'Aloe barbadensis',
      'location': 'Bedroom',
      'watering': 0.95,
      'nextWatering': '12 days left',
      'image': 'spa_rounded',
      'health': 'Excellent',
    },
  ];

  void _addPlant(Map<String, dynamic> plant) {
    setState(() {
      _plants.add(plant);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${plant['name']} added to your collection! 🌱'),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _removePlant(int index) {
    final name = _plants[index]['name'];
    setState(() {
      _plants.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name removed from your collection'),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _openPlantDetail(int plantIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlantDetailScreen(
          plant: _plants[plantIndex],
          onDelete: () => _removePlant(plantIndex),
          onUpdate: (updatedPlant) {
            setState(() {
              _plants[plantIndex] = updatedPlant;
            });
          },
        ),
      ),
    );
  }

  void _showAddPlantDialog() {
    showDialog(
      context: context,
      builder: (context) => AddPlantDialog(onAdd: _addPlant),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeTab(),
      _buildPlantsTab(),
      _buildSettingsTab(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      // Show FAB only on the Plants tab
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton.extended(
              onPressed: _showAddPlantDialog,
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Add Plant'),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_florist_outlined),
            selectedIcon: Icon(Icons.local_florist_rounded),
            label: 'My Plants',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // ==========================================
  // TAB 1: HOME DASHBOARD
  // ==========================================
  Widget _buildHomeTab() {
    int completedCount = _tasks.where((t) => t['completed'] == true).length;
    double progress = _tasks.isEmpty ? 0.0 : completedCount / _tasks.length;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 180,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'My Green Sanctuary',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  right: -30,
                  bottom: -30,
                  child: Icon(
                    Icons.spa_rounded,
                    size: 200,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good day, Plant Parent! 👋',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your plants are doing wonderful today.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quick Summary Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
                          Theme.of(context).colorScheme.surface,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Progress",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "$completedCount of ${_tasks.length} care tasks completed",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 8,
                                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  progress == 1.0 ? Colors.green : const Color(0xFF2E7D32),
                                ),
                              ),
                            ),
                            Text(
                              '${(progress * 100).toInt()}%',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Stats Row
                Row(
                  children: [
                    _buildStatCard('Total Plants', '${_plants.length}', Icons.local_florist_rounded, const Color(0xFF2E7D32)),
                    const SizedBox(width: 12),
                    _buildStatCard('Tasks Today', '${_tasks.length}', Icons.task_alt_rounded, Colors.blue),
                    const SizedBox(width: 12),
                    _buildStatCard('Need Care', '${_plants.where((p) => p['health'] == 'Needs Attention').length}', Icons.warning_amber_rounded, Colors.orange),
                  ],
                ),
                const SizedBox(height: 24),
                // Section Title
                Text(
                  "Today's Tasks",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                // Task List Items
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: _tasks.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Card(
                      elevation: task['completed'] ? 0.5 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: task['completed']
                            ? BorderSide(color: Colors.grey.withValues(alpha: 0.2))
                            : BorderSide.none,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: (task['color'] as Color).withValues(alpha: 0.15),
                          child: Icon(task['icon'] as IconData, color: task['color'] as Color),
                        ),
                        title: Text(
                          task['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: task['completed'] ? TextDecoration.lineThrough : null,
                            color: task['completed'] ? Colors.grey : null,
                          ),
                        ),
                        subtitle: Text(task['location'] as String),
                        trailing: Checkbox(
                          value: task['completed'] as bool,
                          activeColor: const Color(0xFF2E7D32),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          onChanged: (bool? value) {
                            setState(() {
                              task['completed'] = value ?? false;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlantCardImage(Map<String, dynamic> plant) {
    final photoPath = plant['photoPath'] as String?;
    if (photoPath != null && File(photoPath).existsSync()) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          File(photoPath),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 80,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.spa_rounded,
            size: 45,
            color: Color(0xFF2E7D32),
          ),
        ),
      );
    }
    return Icon(
      Icons.spa_rounded,
      size: 45,
      color: const Color(0xFF2E7D32).withValues(alpha: 0.7),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // TAB 2: PLANTS CATALOG
  // ==========================================
  Widget _buildPlantsTab() {
    // Filter & Search logic
    final filteredPlants = <int>[];
    for (int i = 0; i < _plants.length; i++) {
      final plant = _plants[i];
      final matchesSearch = plant['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          plant['species'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || plant['location'] == _selectedCategory;
      if (matchesSearch && matchesCategory) {
        filteredPlants.add(i);
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'My Green Family',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${_plants.length} plants',
                    style: const TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Beautiful Search Bar
            SearchBar(
              hintText: 'Search plants by name or species...',
              leading: const Icon(Icons.search_rounded, color: Colors.grey),
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              elevation: const WidgetStatePropertyAll<double>(2.0),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Scrolling Location Filter Chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['All', 'Living Room', 'Balcony', 'Bedroom', 'Study Room', 'Kitchen', 'Bathroom', 'Garden'].map((category) {
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(category),
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      selectedColor: const Color(0xFFE8F5E9),
                      checkmarkColor: const Color(0xFF2E7D32),
                      labelStyle: TextStyle(
                        color: isSelected ? const Color(0xFF2E7D32) : null,
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Grid of plant cards
            Expanded(
              child: filteredPlants.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.eco_rounded, size: 80, color: Colors.grey.withValues(alpha: 0.3)),
                          const SizedBox(height: 16),
                          Text(
                            _plants.isEmpty
                                ? 'No plants yet! Tap + to add your first plant.'
                                : 'No plants found matching constraints',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.only(bottom: 80), // extra padding for FAB
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: filteredPlants.length,
                      itemBuilder: (context, index) {
                        final plantIndex = filteredPlants[index];
                        final plant = _plants[plantIndex];
                        Color healthColor = Colors.green;
                        if (plant['health'] == 'Needs Attention') {
                          healthColor = Colors.orange;
                        }

                        return GestureDetector(
                          onTap: () => _openPlantDetail(plantIndex),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Decorative Top Container
                                Container(
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: _buildPlantCardImage(plant),
                                      ),
                                      // Tap hint icon
                                      Positioned(
                                        top: 6,
                                        right: 6,
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withValues(alpha: 0.7),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.open_in_new_rounded,
                                            size: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              plant['name'] as String,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              plant['species'] as String,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        // Status Details
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 6,
                                                  height: 6,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: healthColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    plant['health'] as String,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: healthColor,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(4),
                                              child: LinearProgressIndicator(
                                                value: (plant['watering'] as num).toDouble(),
                                                minHeight: 4,
                                                backgroundColor: Colors.grey.shade200,
                                                valueColor: const AlwaysStoppedAnimation<Color>(
                                                  Color(0xFF2E7D32),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              plant['nextWatering'] as String,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: (plant['nextWatering'] as String).contains('now')
                                                    ? Colors.red
                                                    : Colors.black54,
                                                fontWeight: (plant['nextWatering'] as String).contains('now')
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
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
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // TAB 3: SETTINGS SCREEN
  // ==========================================
  Widget _buildSettingsTab() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Visual App Info Card
          Card(
            color: const Color(0xFFFFF8F0),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF2E7D32).withValues(alpha: 0.15),
                    child: const Icon(Icons.spa_rounded, color: Color(0xFF2E7D32), size: 35),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PlantCare Premium',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Offline Database Version 1.0.0',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Group: General
          _buildSettingsGroupHeader('General Preferences'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications_active_outlined),
                  title: const Text('Daily Care Reminders'),
                  subtitle: const Text('Every day at 8:00 AM'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Theme Selection'),
                  subtitle: const Text('Follow System Defaults'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Group: Database Operations
          _buildSettingsGroupHeader('Offline Backup & Sync'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.backup_outlined, color: Color(0xFF2E7D32)),
                  title: const Text('Backup Data to File', style: TextStyle(color: Color(0xFF2E7D32))),
                  subtitle: const Text('Export plant inventory & tasks as JSON'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Offline backup file saved to downloads!'),
                        backgroundColor: Color(0xFF2E7D32),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.restore_outlined),
                  title: const Text('Restore Data from File'),
                  subtitle: const Text('Import from a previously exported JSON backup'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSettingsGroupHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
