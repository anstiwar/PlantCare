import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/plant_care_stat_model.dart';

class ChartDataService {
  /// Generate mock weekly chart data for a plant
  WeeklyChartData generateWeeklyChartData(String plantId, String plantName) {
    final now = DateTime.now();
    final dailyStats = <DailyStat>[];
    
    final dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    for (int i = 6; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final dayLabel = dayLabels[date.weekday - 1];

      dailyStats.add(
        DailyStat(
          date: date,
          dayLabel: dayLabel,
          wateringCount: (date.day % 3 == 0) ? 1 : 0,
          fertilizingCount: (date.day % 7 == 0) ? 1 : 0,
          pruningCount: (date.day % 14 == 0) ? 1 : 0,
          otherCount: (date.day % 5 == 0) ? 1 : 0,
        ),
      );
    }

    final totalCareActions = dailyStats.fold<int>(
      0,
      (sum, stat) =>
          sum +
          stat.wateringCount +
          stat.fertilizingCount +
          stat.pruningCount +
          stat.otherCount,
    );

    return WeeklyChartData(
      plantId: plantId,
      plantName: plantName,
      dailyStats: dailyStats,
      totalCareActions: totalCareActions,
    );
  }

  /// Generate mock monthly chart data for a plant
  MonthlyChartData generateMonthlyChartData(String plantId, String plantName) {
    final now = DateTime.now();
    final weeklyStats = <WeeklyStat>[];

    for (int week = 3; week >= 0; week--) {
      final startDate = now.subtract(Duration(days: now.weekday - 1 + (week * 7)));
      final endDate = startDate.add(const Duration(days: 6));

      final wateringCount = (week * 2 + 1) % 5;
      final fertilizingCount = (week + 1) % 3;
      final pruningCount = week % 2;
      final otherCount = (week * 3) % 4;

      weeklyStats.add(
        WeeklyStat(
          startDate: startDate,
          endDate: endDate,
          weekLabel: 'Week ${4 - week}',
          wateringCount: wateringCount,
          fertilizingCount: fertilizingCount,
          pruningCount: pruningCount,
          otherCount: otherCount,
        ),
      );
    }

    final totalCareActions = weeklyStats.fold<int>(
      0,
      (sum, stat) =>
          sum +
          stat.wateringCount +
          stat.fertilizingCount +
          stat.pruningCount +
          stat.otherCount,
    );

    return MonthlyChartData(
      plantId: plantId,
      plantName: plantName,
      weeklyStats: weeklyStats,
      totalCareActions: totalCareActions,
    );
  }
}

final chartDataServiceProvider = Provider((ref) => ChartDataService());

final weeklyChartDataProvider = FutureProvider.family<WeeklyChartData, (String, String)>(
  (ref, params) async {
    final service = ref.watch(chartDataServiceProvider);
    return service.generateWeeklyChartData(params.$1, params.$2);
  },
);

final monthlyChartDataProvider = FutureProvider.family<MonthlyChartData, (String, String)>(
  (ref, params) async {
    final service = ref.watch(chartDataServiceProvider);
    return service.generateMonthlyChartData(params.$1, params.$2);
  },
);
