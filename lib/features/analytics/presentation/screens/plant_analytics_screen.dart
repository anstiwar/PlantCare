import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/chart_data_service.dart';
import '../../data/models/plant_care_stat_model.dart';
import '../widgets/chart_widgets.dart';

class PlantAnalyticsScreen extends ConsumerStatefulWidget {
  final String plantId;
  final String plantName;

  const PlantAnalyticsScreen({
    super.key,
    required this.plantId,
    required this.plantName,
  });

  @override
  ConsumerState<PlantAnalyticsScreen> createState() => _PlantAnalyticsScreenState();
}

class _PlantAnalyticsScreenState extends ConsumerState<PlantAnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weeklyData = ref.watch(
      weeklyChartDataProvider((widget.plantId, widget.plantName)),
    );
    final monthlyData = ref.watch(
      monthlyChartDataProvider((widget.plantId, widget.plantName)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.plantName} Analytics'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.calendar_view_week),
              text: 'Weekly',
            ),
            Tab(
              icon: Icon(Icons.calendar_view_month),
              text: 'Monthly',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Weekly Tab
          weeklyData.when(
            data: (data) => SingleChildScrollView(
              child: Column(
                children: [
                  WeeklyLineChart(data: data),
                  const SizedBox(height: 24),
                  _buildWeeklyDetailsCard(context, data),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          // Monthly Tab
          monthlyData.when(
            data: (data) => SingleChildScrollView(
              child: Column(
                children: [
                  MonthlyBarChart(data: data),
                  const SizedBox(height: 24),
                  _buildMonthlyDetailsCard(context, data),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyDetailsCard(BuildContext context, WeeklyChartData data) {
    final List<DailyStat> dailyStats = data.dailyStats;
    final mostActiveDay = dailyStats.reduce((DailyStat a, DailyStat b) =>
        (a.wateringCount + a.fertilizingCount + a.pruningCount + a.otherCount) >
                (b.wateringCount + b.fertilizingCount + b.pruningCount + b.otherCount)
            ? a
            : b);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Summary',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Most Active Day', style: Theme.of(context).textTheme.bodySmall),
                  Text(mostActiveDay.dayLabel,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Actions', style: Theme.of(context).textTheme.bodySmall),
                  Text(data.totalCareActions.toString(),
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyDetailsCard(BuildContext context, MonthlyChartData data) {
    final List<WeeklyStat> weeklyStats = data.weeklyStats;
    final mostActiveWeek = weeklyStats.reduce((WeeklyStat a, WeeklyStat b) =>
        (a.wateringCount + a.fertilizingCount + a.pruningCount + a.otherCount) >
                (b.wateringCount + b.fertilizingCount + b.pruningCount + b.otherCount)
            ? a
            : b);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Summary',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Most Active Week', style: Theme.of(context).textTheme.bodySmall),
                  Text(mostActiveWeek.weekLabel,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Actions', style: Theme.of(context).textTheme.bodySmall),
                  Text(data.totalCareActions.toString(),
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
