import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/plant_care_stat_model.dart';

class WeeklyLineChart extends StatelessWidget {
  final WeeklyChartData data;

  const WeeklyLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue, // watering
      Colors.purple, // fertilizing
      Colors.orange, // pruning
      Colors.green, // other
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Care Activity',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < data.dailyStats.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              data.dailyStats[value.toInt()].dayLabel,
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: true),
                borderData: FlBorderData(show: true),
                minY: 0,
                maxY: (data.dailyStats
                      .map((e) => e.wateringCount + e.fertilizingCount + e.pruningCount + e.otherCount)
                      .fold<int>(0, (a, b) => max(a, b)))
                    .toDouble()
                    .clamp(1, double.infinity),
                lineBarsData: [
                  LineChartBarData(
                    spots: data.dailyStats
                        .asMap()
                        .entries
                        .map((e) => FlSpot(
                              e.key.toDouble(),
                              (e.value.wateringCount +
                                      e.value.fertilizingCount +
                                      e.value.pruningCount +
                                      e.value.otherCount)
                                  .toDouble(),
                            ))
                        .toList(),
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildStatisticsRow(context),
        ],
      ),
    );
  }

  Widget _buildStatisticsRow(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildStatCard(
          context,
          'Total Actions',
          data.totalCareActions.toString(),
          Colors.green,
        ),
        _buildStatCard(
          context,
          'Watering',
          data.dailyStats.fold<int>(0, (sum, stat) => sum + stat.wateringCount).toString(),
          Colors.blue,
        ),
        _buildStatCard(
          context,
          'Fertilizing',
          data.dailyStats.fold<int>(0, (sum, stat) => sum + stat.fertilizingCount).toString(),
          Colors.purple,
        ),
        _buildStatCard(
          context,
          'Pruning',
          data.dailyStats.fold<int>(0, (sum, stat) => sum + stat.pruningCount).toString(),
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyBarChart extends StatelessWidget {
  final MonthlyChartData data;

  const MonthlyBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Care Activity',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < data.weeklyStats.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              data.weeklyStats[value.toInt()].weekLabel,
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(show: true),
                maxY: (data.weeklyStats
                      .map((e) => e.wateringCount + e.fertilizingCount + e.pruningCount + e.otherCount)
                      .fold<int>(0, (a, b) => max(a, b)))
                    .toDouble()
                    .clamp(1, double.infinity),
                barGroups: data.weeklyStats
                    .asMap()
                    .entries
                    .map((e) => BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: (e.value.wateringCount +
                                      e.value.fertilizingCount +
                                      e.value.pruningCount +
                                      e.value.otherCount)
                                  .toDouble(),
                              color: Colors.green,
                              width: 16,
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildMonthlyStats(context),
        ],
      ),
    );
  }

  Widget _buildMonthlyStats(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildStatCard(
          context,
          'Total Actions',
          data.totalCareActions.toString(),
          Colors.green,
        ),
        _buildStatCard(
          context,
          'Watering',
          data.weeklyStats.fold<int>(0, (sum, stat) => sum + stat.wateringCount).toString(),
          Colors.blue,
        ),
        _buildStatCard(
          context,
          'Fertilizing',
          data.weeklyStats.fold<int>(0, (sum, stat) => sum + stat.fertilizingCount).toString(),
          Colors.purple,
        ),
        _buildStatCard(
          context,
          'Pruning',
          data.weeklyStats.fold<int>(0, (sum, stat) => sum + stat.pruningCount).toString(),
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
