import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_care_stat_model.freezed.dart';
part 'plant_care_stat_model.g.dart';

@freezed
class PlantCareStat with _$PlantCareStat {
  const factory PlantCareStat({
    required String id,
    required String plantId,
    required String taskType, // watering, fertilizing, pruning, etc.
    required int count, // number of times completed
    required DateTime date, // date of the stat
    required DateTime createdAt,
  }) = _PlantCareStat;

  factory PlantCareStat.fromJson(Map<String, dynamic> json) =>
      _$PlantCareStatFromJson(json);
}

@freezed
class WeeklyChartData with _$WeeklyChartData {
  const factory WeeklyChartData({
    required String plantId,
    required String plantName,
    required List<DailyStat> dailyStats, // 7 days
    required int totalCareActions,
  }) = _WeeklyChartData;

  factory WeeklyChartData.fromJson(Map<String, dynamic> json) =>
      _$WeeklyChartDataFromJson(json);
}

@freezed
class MonthlyChartData with _$MonthlyChartData {
  const factory MonthlyChartData({
    required String plantId,
    required String plantName,
    required List<WeeklyStat> weeklyStats, // 4 weeks
    required int totalCareActions,
  }) = _MonthlyChartData;

  factory MonthlyChartData.fromJson(Map<String, dynamic> json) =>
      _$MonthlyChartDataFromJson(json);
}

@freezed
class DailyStat with _$DailyStat {
  const factory DailyStat({
    required DateTime date,
    required String dayLabel, // Mon, Tue, etc.
    required int wateringCount,
    required int fertilizingCount,
    required int pruningCount,
    required int otherCount,
  }) = _DailyStat;

  factory DailyStat.fromJson(Map<String, dynamic> json) =>
      _$DailyStatFromJson(json);
}

@freezed
class WeeklyStat with _$WeeklyStat {
  const factory WeeklyStat({
    required DateTime startDate,
    required DateTime endDate,
    required String weekLabel, // Week 1, Week 2, etc.
    required int wateringCount,
    required int fertilizingCount,
    required int pruningCount,
    required int otherCount,
  }) = _WeeklyStat;

  factory WeeklyStat.fromJson(Map<String, dynamic> json) =>
      _$WeeklyStatFromJson(json);
}
