import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../widgets/add_plant_dialog.dart';

class PlantDetailScreen extends StatefulWidget {
  final Map<String, dynamic> plant;
  final VoidCallback? onDelete;
  final Function(Map<String, dynamic>)? onUpdate;

  const PlantDetailScreen({
    super.key,
    required this.plant,
    this.onDelete,
    this.onUpdate,
  });

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  late List<Map<String, dynamic>> _careHistory;
  late Map<String, dynamic> _plant;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _plant = Map<String, dynamic>.from(widget.plant);

    // Initialize care history from plant data, or create default history
    if (_plant.containsKey('history') && _plant['history'] is List) {
      _careHistory = List<Map<String, dynamic>>.from(
        (_plant['history'] as List).map((e) => Map<String, dynamic>.from(e)),
      );
    } else {
      _careHistory = [
        {
          'action': 'Watered',
          'icon': Icons.water_drop_rounded,
          'color': Colors.blue,
          'date': DateTime.now().subtract(const Duration(days: 2)),
          'note': 'Regular watering',
        },
        {
          'action': 'Fertilized',
          'icon': Icons.opacity_rounded,
          'color': Colors.purple,
          'date': DateTime.now().subtract(const Duration(days: 7)),
          'note': 'Used organic liquid fertilizer',
        },
        {
          'action': 'Added',
          'icon': Icons.add_circle_outline_rounded,
          'color': Colors.green,
          'date': DateTime.now().subtract(const Duration(days: 30)),
          'note': 'Plant added to collection',
        },
      ];
    }
  }

  void _logCareAction(String action, IconData icon, Color color) {
    showDialog(
      context: context,
      builder: (context) {
        final noteController = TextEditingController();
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Text('Log $action'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Record that you ${action.toLowerCase()} ${_plant['name']}.',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: noteController,
                decoration: InputDecoration(
                  hintText: 'Add a note (optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                maxLines: 2,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _careHistory.insert(0, {
                    'action': action,
                    'icon': icon,
                    'color': color,
                    'date': DateTime.now(),
                    'note': noteController.text.isEmpty
                        ? '$action completed'
                        : noteController.text,
                  });
                  // Update watering indicator
                  if (action == 'Watered') {
                    _plant['watering'] = 1.0;
                    _plant['nextWatering'] = '7 days left';
                    _plant['health'] = 'Excellent';
                  }
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$action ${_plant['name']} ✓'),
                    backgroundColor: const Color(0xFF2E7D32),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
              icon: Icon(icon, size: 18),
              label: Text('Log $action'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickPhoto(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 80,
      );
      if (pickedFile == null) return;

      final appDir = await getApplicationDocumentsDirectory();
      final plantPhotosDir = Directory('${appDir.path}/plant_photos');
      if (!plantPhotosDir.existsSync()) {
        plantPhotosDir.createSync(recursive: true);
      }

      final fileName = 'plant_${_plant['id'] ?? DateTime.now().millisecondsSinceEpoch}_${path.basename(pickedFile.path)}';
      final savedFile = await File(pickedFile.path).copy('${plantPhotosDir.path}/$fileName');

      if (!mounted) return;
      setState(() {
        _plant['photoPath'] = savedFile.path;
      });
      widget.onUpdate?.call(_plant);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Plant photo saved locally.'),
          backgroundColor: const Color(0xFF2E7D32),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save photo: $e'),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _showPhotoSourceSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_rounded),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickPhoto(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_rounded),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickPhoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
            SizedBox(width: 12),
            Text('Remove Plant'),
          ],
        ),
        content: Text(
          'Are you sure you want to remove "${_plant['name']}" from your collection? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              widget.onDelete?.call();
              Navigator.pop(context); // go back to list
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color healthColor = Colors.green;
    if (_plant['health'] == 'Needs Attention') healthColor = Colors.orange;
    if (_plant['health'] == 'Critical') healthColor = Colors.red;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero app bar with plant visual
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF2E7D32),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () {
                widget.onUpdate?.call(_plant);
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.camera_alt_rounded, color: Colors.white70),
                onPressed: _showPhotoSourceSheet,
                tooltip: 'Capture plant photo',
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.white70),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddPlantDialog(
                      initialPlant: _plant,
                      onUpdate: (updated) {
                        setState(() {
                          _plant = Map<String, dynamic>.from(updated);
                        });
                        widget.onUpdate?.call(_plant);
                      },
                    ),
                  );
                },
                tooltip: 'Edit plant',
              ),
              IconButton(
                icon: const Icon(Icons.analytics_rounded, color: Colors.white70),
                onPressed: () {
                  final idOrName = (_plant['id']?.toString() ?? _plant['name']?.toString() ?? 'unknown');
                  final name = (_plant['name']?.toString() ?? idOrName);
                  context.push('/analytics/${Uri.encodeComponent(idOrName)}/${Uri.encodeComponent(name)}');
                },
                tooltip: 'Analytics',
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded, color: Colors.white70),
                onPressed: _confirmDelete,
                tooltip: 'Remove plant',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2E7D32), Color(0xFF1B5E20), Color(0xFF0D3311)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative background leaf
                    Positioned(
                      right: -40,
                      top: 20,
                      child: Icon(
                        Icons.spa_rounded,
                        size: 250,
                        color: Colors.white.withOpacity(0.06),
                      ),
                    ),
                    // Plant info overlay
                    Positioned(
                      bottom: 24,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                            ),
                            child: _buildPlantAvatar(),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _plant['name'] ?? 'Unnamed Plant',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _plant['species'] ?? '',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Body content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Status Cards Row ──
                  Row(
                    children: [
                      _buildInfoChip(Icons.location_on_outlined, _plant['location'] ?? 'Unknown', Colors.blueGrey),
                      const SizedBox(width: 8),
                      _buildInfoChip(Icons.favorite_rounded, _plant['health'] ?? 'Unknown', healthColor),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ── Watering Status Card ──
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.08),
                            Theme.of(context).colorScheme.surface,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.water_drop_rounded, color: Colors.blue, size: 20),
                              const SizedBox(width: 8),
                              const Text(
                                'Watering Status',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const Spacer(),
                              Text(
                                _plant['nextWatering'] ?? '',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: (_plant['nextWatering'] ?? '').toString().contains('now')
                                      ? Colors.red
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: (_plant['watering'] as num?)?.toDouble() ?? 0.5,
                              minHeight: 10,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                (_plant['watering'] as num? ?? 0.5) < 0.3
                                    ? Colors.red
                                    : const Color(0xFF2E7D32),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Quick Care Actions ──
                  Text(
                    'Quick Care Actions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildCareButton('Water', Icons.water_drop_rounded, Colors.blue),
                      const SizedBox(width: 10),
                      _buildCareButton('Fertilize', Icons.opacity_rounded, Colors.purple),
                      const SizedBox(width: 10),
                      _buildCareButton('Prune', Icons.content_cut_rounded, Colors.orange),
                      const SizedBox(width: 10),
                      _buildCareButton('Repot', Icons.grid_view_rounded, Colors.brown),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // ── Care History Timeline ──
                  Row(
                    children: [
                      Text(
                        'Care History',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${_careHistory.length} entries',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Timeline list
                  if (_careHistory.isEmpty)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(Icons.history_rounded, size: 48, color: Colors.grey.shade300),
                              const SizedBox(height: 12),
                              Text(
                                'No care history yet',
                                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Use the Quick Care buttons above to log your first action.',
                                style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _careHistory.length,
                      itemBuilder: (context, index) {
                        final entry = _careHistory[index];
                        final date = entry['date'] as DateTime;
                        final isLast = index == _careHistory.length - 1;

                        return IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Timeline vertical line and dot
                              SizedBox(
                                width: 40,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: entry['color'] as Color,
                                        boxShadow: [
                                          BoxShadow(
                                            color: (entry['color'] as Color).withOpacity(0.4),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (!isLast)
                                      Expanded(
                                        child: Container(
                                          width: 2,
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // Entry content
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Card(
                                    elevation: 1,
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(entry['icon'] as IconData, size: 16, color: entry['color'] as Color),
                                              const SizedBox(width: 6),
                                              Text(
                                                entry['action'] as String,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: entry['color'] as Color,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                _formatDate(date),
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            entry['note'] as String,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey.shade700,
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
                        );
                      },
                    ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final idOrName = (_plant['id']?.toString() ?? _plant['name']?.toString() ?? 'unknown');
          final name = (_plant['name']?.toString() ?? idOrName);
          context.push('/analytics/${Uri.encodeComponent(idOrName)}/${Uri.encodeComponent(name)}');
        },
        icon: const Icon(Icons.analytics_rounded),
        label: const Text('Analytics'),
        tooltip: 'View plant analytics and charts',
      ),
    );
  }

  Widget _buildPlantAvatar() {
    final photoPath = _plant['photoPath'] as String?;
    if (photoPath != null && File(photoPath).existsSync()) {
      return ClipOval(
        child: Image.file(
          File(photoPath),
          fit: BoxFit.cover,
          width: 72,
          height: 72,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.spa_rounded, color: Color(0xFFE8F5E9), size: 40),
        ),
      );
    }
    return const Icon(Icons.spa_rounded, color: Color(0xFFE8F5E9), size: 40);
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildCareButton(String label, IconData icon, Color color) {
    return Expanded(
      child: Material(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => _logCareAction(label, icon, color),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Column(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(height: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return DateFormat('MMM d, yyyy').format(date);
  }
}
