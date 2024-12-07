import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildGreetingCard(),
        const SizedBox(height: 16),
        _buildQuickActionsCard(),
        const SizedBox(height: 16),
        _buildWeatherCard(),
      ],
    );
  }

  Widget _buildGreetingCard() {
    final now = DateTime.now();
    final greeting = now.hour < 12 ? 'Good Morning' : (now.hour < 18 ? 'Good Afternoon' : 'Good Evening');
    final dateFormat = DateFormat('EEEE, MMMM d');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greeting, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(dateFormat.format(now), style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActionChip(Icons.add_alert, 'Set Reminder'),
                _buildActionChip(Icons.note_add, 'New Note'),
                _buildActionChip(Icons.search, 'Web Search'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip(IconData icon, String label) {
    return ActionChip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      onPressed: () {
        // TODO: Implement action
      },
    );
  }

  Widget _buildWeatherCard() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weather', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New York', style: TextStyle(fontSize: 16)),
                    Text('Partly Cloudy', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.cloud, size: 24),
                    SizedBox(width: 8),
                    Text('72°F', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

