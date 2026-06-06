import 'package:flutter/material.dart';

class AddPlantDialog extends StatefulWidget {
  final Function(Map<String, dynamic>)? onAdd;
  final Function(Map<String, dynamic>)? onUpdate;
  final Map<String, dynamic>? initialPlant;

  const AddPlantDialog({
    super.key,
    this.onAdd,
    this.onUpdate,
    this.initialPlant,
  });

  @override
  State<AddPlantDialog> createState() => _AddPlantDialogState();
}

class _AddPlantDialogState extends State<AddPlantDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  String _selectedLocation = 'Living Room';
  int _wateringIntervalDays = 7;

  final List<String> _locations = [
    'Living Room',
    'Balcony',
    'Bedroom',
    'Study Room',
    'Kitchen',
    'Bathroom',
    'Garden',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialPlant != null) {
      final p = widget.initialPlant!;
      _nameController.text = (p['name'] ?? '').toString();
      _speciesController.text = (p['species'] ?? '').toString();
      if (p['location'] != null && _locations.contains(p['location'])) {
        _selectedLocation = p['location'];
      }
      if (p['wateringInterval'] != null && p['wateringInterval'] is int) {
        _wateringIntervalDays = p['wateringInterval'] as int;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32).withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color(0xFF2E7D32),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.initialPlant == null ? 'Add New Plant' : 'Edit Plant',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.initialPlant == null ? 'Grow your collection 🌱' : 'Update plant details',
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Plant Name
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Plant Name',
                    hintText: 'e.g. Snake Plant',
                    prefixIcon: const Icon(Icons.local_florist_rounded, color: Color(0xFF2E7D32)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a plant name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Species
                TextFormField(
                  controller: _speciesController,
                  decoration: InputDecoration(
                    labelText: 'Species (optional)',
                    hintText: 'e.g. Sansevieria trifasciata',
                    prefixIcon: const Icon(Icons.science_outlined, color: Colors.blueGrey),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Location Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedLocation,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.blueGrey),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 2),
                    ),
                  ),
                  items: _locations
                      .map((loc) => DropdownMenuItem(value: loc, child: Text(loc)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedLocation = value);
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Watering Interval
                Text(
                  'Watering Interval',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.water_drop_outlined, color: Colors.blue, size: 20),
                      const SizedBox(width: 12),
                      Text('Every $_wateringIntervalDays days',
                          style: const TextStyle(fontSize: 15)),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, size: 22),
                        onPressed: _wateringIntervalDays > 1
                            ? () => setState(() => _wateringIntervalDays--)
                            : null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, size: 22),
                        onPressed: _wateringIntervalDays < 60
                            ? () => setState(() => _wateringIntervalDays++)
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: FilledButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final newPlant = {
                              'name': _nameController.text.trim(),
                              'species': _speciesController.text.trim().isEmpty
                                  ? 'Unknown species'
                                  : _speciesController.text.trim(),
                              'location': _selectedLocation,
                              'watering': 1.0,
                              'nextWatering': '$_wateringIntervalDays days left',
                              'image': 'spa_rounded',
                              'photoPath': widget.initialPlant?['photoPath'],
                              'health': 'Excellent',
                              'wateringInterval': _wateringIntervalDays,
                              'history': widget.initialPlant?['history'] ?? <Map<String, dynamic>>[],
                              'id': widget.initialPlant?['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
                            };
                            if (widget.initialPlant == null) {
                              widget.onAdd?.call(newPlant);
                            } else {
                              widget.onUpdate?.call(newPlant);
                            }
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.eco_rounded, size: 18),
                        label: Text(widget.initialPlant == null ? 'Add Plant' : 'Update Plant'),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
