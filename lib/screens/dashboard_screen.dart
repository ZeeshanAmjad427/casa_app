import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedTimeframe = 'Today';
  int selectedTabIndex = 0;

  // Real dashboard data
  final Map<String, dynamic> dashboardData = {
    'production_summary': {
      'total_output': 45680,
      'target_output': 50000,
      'efficiency_rate': 91.4,
      'quality_rate': 98.2,
      'downtime_hours': 2.5,
      'active_orders': 127,
    },
    'alerts': [
      {'type': 'critical', 'message': 'Line 003 temperature exceeding limits', 'time': '2 min ago'},
      {'type': 'warning', 'message': 'Warehouse 02 approaching capacity limit', 'time': '15 min ago'},
      {'type': 'info', 'message': 'Scheduled maintenance for Line 007 tomorrow', 'time': '1 hour ago'},
    ],
    'top_performers': [
      {'line': 'Line 001', 'efficiency': 98.5, 'output': 2450},
      {'line': 'Line 004', 'efficiency': 96.8, 'output': 2380},
      {'line': 'Line 009', 'efficiency': 95.2, 'output': 2290},
    ],
    'bottlenecks': [
      {'process': 'Quality Control Station 2', 'delay': '45 min', 'impact': 'High'},
      {'process': 'Material Loading Bay 1', 'delay': '23 min', 'impact': 'Medium'},
      {'process': 'Packaging Line B', 'delay': '12 min', 'impact': 'Low'},
    ],
    'resource_utilization': {
      'workforce': {'current': 245, 'capacity': 280, 'percentage': 87.5},
      'machinery': {'current': 18, 'capacity': 24, 'percentage': 75.0},
      'materials': {'current': 78, 'capacity': 100, 'percentage': 78.0},
    },
    'shift_performance': [
      {'shift': 'Morning', 'output': 18500, 'efficiency': 94.2, 'quality': 98.8},
      {'shift': 'Afternoon', 'output': 17200, 'efficiency': 89.1, 'quality': 97.5},
      {'shift': 'Night', 'output': 9980, 'efficiency': 87.6, 'quality': 98.1},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLandscape = screenWidth > MediaQuery.of(context).size.height;
    final isLargeTablet = screenWidth > 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF007BFF),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF007BFF), Color(0xFF0056b3)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Production Control Center',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Real-time Operations Dashboard',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _buildTimeframeSelector(),
                                const SizedBox(width: 12),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.refresh, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Dashboard Content
          SliverPadding(
            padding: EdgeInsets.all(isLargeTablet ? 32.0 : 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                 [
                  // Critical Alerts Banner
                  _buildAlertsSection(),
                  const SizedBox(height: 24),

                  // Production Overview Cards
                  _buildProductionOverview(isLandscape),
                  const SizedBox(height: 24),

                  // Performance Analytics
                  _buildPerformanceSection(isLandscape),
                  const SizedBox(height: 24),

                  // Resource Utilization
                  _buildResourceUtilization(isLandscape),
                  const SizedBox(height: 24),

                  // Operational Intelligence
                  _buildOperationalIntelligence(isLandscape),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeframeSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedTimeframe,
          dropdownColor: const Color(0xFF007BFF),
          style: const TextStyle(color: Colors.white, fontSize: 14),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
          items: ['Today', 'This Week', 'This Month'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedTimeframe = newValue!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildAlertsSection() {
    final alerts = dashboardData['alerts'] as List;
    if (alerts.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade50, Colors.orange.shade50],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red.shade600, size: 24),
              const SizedBox(width: 12),
              const Text(
                'Active Alerts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All (${alerts.length})',
                  style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...alerts.take(2).map((alert) => _buildAlertItem(alert)).toList(),
        ],
      ),
    );
  }

  Widget _buildAlertItem(Map<String, dynamic> alert) {
    Color alertColor;
    IconData alertIcon;

    switch (alert['type']) {
      case 'critical':
        alertColor = Colors.red;
        alertIcon = Icons.error;
        break;
      case 'warning':
        alertColor = Colors.orange;
        alertIcon = Icons.warning;
        break;
      default:
        alertColor = Colors.blue;
        alertIcon = Icons.info;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: alertColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(alertIcon, color: alertColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert['message'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  alert['time'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, size: 18),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildProductionOverview(bool isLandscape) {
    final summary = dashboardData['production_summary'] as Map<String, dynamic>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Production Overview',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isLandscape ? 3 : 2,
          childAspectRatio: isLandscape ? 1.4 : 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildProductionCard(
              'Total Output',
              '${(summary['total_output'] / 1000).toStringAsFixed(1)}K',
              'Target: ${(summary['target_output'] / 1000).toStringAsFixed(0)}K',
              summary['total_output'] / summary['target_output'],
              Icons.trending_up,
              const Color(0xFF007BFF),
            ),
            _buildProductionCard(
              'Efficiency Rate',
              '${summary['efficiency_rate']}%',
              'Target: 95%',
              summary['efficiency_rate'] / 100,
              Icons.speed,
              const Color(0xFF28A745),
            ),
            _buildProductionCard(
              'Quality Rate',
              '${summary['quality_rate']}%',
              'Target: 99%',
              summary['quality_rate'] / 100,
              Icons.verified,
              const Color(0xFF17A2B8),
            ),
            _buildProductionCard(
              'Active Orders',
              '${summary['active_orders']}',
              'In Progress',
              0.75,
              Icons.assignment,
              const Color(0xFF6F42C1),
            ),
            _buildProductionCard(
              'Downtime',
              '${summary['downtime_hours']}h',
              'This Shift',
              summary['downtime_hours'] / 8,
              Icons.pause_circle,
              const Color(0xFFFD7E14),
            ),
            _buildProductionCard(
              'OEE Score',
              '${(summary['efficiency_rate'] * summary['quality_rate'] / 100).toStringAsFixed(1)}%',
              'Overall Equipment',
              (summary['efficiency_rate'] * summary['quality_rate'] / 100) / 100,
              Icons.analytics,
              const Color(0xFFE83E8C),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductionCard(String title, String value, String subtitle, double progress, IconData icon, Color color) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, color.withOpacity(0.05)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    value: progress > 1 ? 1 : progress,
                    strokeWidth: 3,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceSection(bool isLandscape) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildTopPerformersCard(),
        ),
        if (isLandscape) ...[
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: _buildShiftPerformanceCard(),
          ),
        ],
      ],
    );
  }

  Widget _buildTopPerformersCard() {
    final performers = dashboardData['top_performers'] as List;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Performing Lines',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Live',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...performers.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> performer = entry.value;
              return _buildPerformerItem(performer, index + 1);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformerItem(Map<String, dynamic> performer, int rank) {
    Color rankColor;
    switch (rank) {
      case 1:
        rankColor = const Color(0xFFFFD700);
        break;
      case 2:
        rankColor = const Color(0xFFC0C0C0);
        break;
      case 3:
        rankColor = const Color(0xFFCD7F32);
        break;
      default:
        rankColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: rankColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  performer['line'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.speed, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      '${performer['efficiency']}% efficiency',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.production_quantity_limits, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      '${performer['output']} units',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${performer['efficiency']}%',
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftPerformanceCard() {
    final shifts = dashboardData['shift_performance'] as List;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shift Performance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ...shifts.map((shift) => _buildShiftItem(shift)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftItem(Map<String, dynamic> shift) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${shift['shift']} Shift',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '${(shift['output'] / 1000).toStringAsFixed(1)}K',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007BFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Efficiency: ${shift['efficiency']}%',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: shift['efficiency'] / 100,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF28A745)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Q: ${shift['quality']}%',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResourceUtilization(bool isLandscape) {
    final resources = dashboardData['resource_utilization'] as Map<String, dynamic>;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resource Utilization',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isLandscape ? 3 : 1,
              childAspectRatio: isLandscape ? 1.5 : 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildResourceItem('Workforce', resources['workforce'], Icons.people, const Color(0xFF007BFF)),
                _buildResourceItem('Machinery', resources['machinery'], Icons.precision_manufacturing, const Color(0xFF28A745)),
                _buildResourceItem('Materials', resources['materials'], Icons.inventory, const Color(0xFFFFC107)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem(String title, Map<String, dynamic> resource, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${resource['current']}/${resource['capacity']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: resource['percentage'] / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
                const SizedBox(height: 4),
                Text(
                  '${resource['percentage']}% utilized',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOperationalIntelligence(bool isLandscape) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildBottlenecksCard()),
        if (isLandscape) ...[
          const SizedBox(width: 16),
          Expanded(child: _buildPredictiveInsights()),
        ],
      ],
    );
  }

  Widget _buildBottlenecksCard() {
    final bottlenecks = dashboardData['bottlenecks'] as List;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.traffic, color: Colors.red.shade600, size: 24),
                const SizedBox(width: 12),
                const Text(
                  'Current Bottlenecks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...bottlenecks.map((bottleneck) => _buildBottleneckItem(bottleneck)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottleneckItem(Map<String, dynamic> bottleneck) {
    Color impactColor;
    switch (bottleneck['impact']) {
      case 'High':
        impactColor = Colors.red;
        break;
      case 'Medium':
        impactColor = Colors.orange;
        break;
      default:
        impactColor = Colors.yellow.shade700;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: impactColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: impactColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 40,
            decoration: BoxDecoration(
              color: impactColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bottleneck['process'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      'Delay: ${bottleneck['delay']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: impactColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              bottleneck['impact'],
              style: TextStyle(
                color: impactColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPredictiveInsights() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.psychology, color: Colors.purple.shade600, size: 24),
                const SizedBox(width: 12),
                const Text(
                  'AI Insights',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInsightItem(
              'Maintenance Alert',
              'Line 005 showing early wear patterns. Schedule maintenance within 48 hours.',
              Icons.build_circle,
              Colors.orange,
            ),
            _buildInsightItem(
              'Efficiency Opportunity',
              'Optimizing Line 002 parameters could increase output by 12%.',
              Icons.trending_up,
              Colors.green,
            ),
            _buildInsightItem(
              'Quality Prediction',
              'Material batch #4521 may cause quality issues. Consider inspection.',
              Icons.warning_amber,
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightItem(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}