import 'package:digischool/Components/query_dropdown_menu.dart';
import 'package:digischool/Pages/StudentPages/Attendance/Components/bar_graph_monthly.dart';
import 'package:digischool/Pages/StudentPages/Attendance/Components/bar_graph_weekly.dart';
//import 'package:digischool/Pages/StudentPages/HomePage/Components/menu_card.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/PaymentPages/FeesDetails/FeesPageComponents/qr_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({super.key});

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int averageAttendance = 90;
  final List<double> attendancePercentages = [85, 78, 92, 80];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Attendance",
          style: TextStyle(fontFamily: "Roboto", color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {
              // Add your QR scanner logic here
              // For example, you can navigate to a QR scanner page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRScannerPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MyDropdownMenu(),
                ),
                const AnnualAttendanceBarChart(),
                WeeklyAttendanceBarChart(),
                /*SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom: 10),
                    child: BarChart(
                      
                      BarChartData( 
                        gridData: const FlGridData(show: false),
                        titlesData: const FlTitlesData(
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
                          ),
                        borderData: FlBorderData(
                          show: false,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        barGroups: _buildBarChartGroups()
                      ),
                    ),
                  ),
                ),*/
                const SizedBox(height: 20),
                const SizedBox(
                  height: 280,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //MenuCard(title: "Mathematics", icon: Icons.article, onTap: (){},numericalFigure: 20,),
                          //MenuCard(title: "Science", icon: Icons.science, onTap: (){},numericalFigure: 30,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<BarChartGroupData> _buildBarChartGroups() {
    return List.generate(
      attendancePercentages.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: attendancePercentages[index],
            width: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

}
