import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/chart_widget.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ChartScreen().toStringShort())),
      body: Column(
        children: [
          Container(height: 200, width: double.infinity, color: Colors.blue),
          Container(height: 50, width: double.infinity, color: Colors.green),
          Expanded(
            child: ChartWidget(
              status: StudentStatus(attend: 12, absent: 30, late: 15),
            ),
          ),
        ],
      ),
    );
  }
}
