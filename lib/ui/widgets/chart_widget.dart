import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({@required this.status});

  final StudentStatus status;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final perObj = constraints.maxHeight / status.allItem.last;
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItem(
                status.attend,
                Colors.blue,
                status.isAttend
                    ? constraints.maxHeight
                    : perObj * status.attend,
              ),
              const SizedBox(width: 16.0),
              _buildItem(
                status.absent,
                Colors.deepOrangeAccent,
                status.isAbsent
                    ? constraints.maxHeight
                    : perObj * status.absent,
              ),
              const SizedBox(width: 16.0),
              _buildItem(
                status.late,
                Colors.grey,
                status.isLate ? constraints.maxHeight : perObj * status.late,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(int value, Color color, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(value.toString(), style: TextStyle(color: color)),
        Container(
          color: color,
          width: 50.0,
          height: height - 16.0 < 0.0 ? 0.0 : height - 16.0,
        ),
      ],
    );
  }
}

class StudentStatus {
  StudentStatus({this.absent, this.attend, this.late}) {
    allItem.add(attend);
    allItem.add(absent);
    allItem.add(late);
    allItem.sort((a, b) => a.compareTo(b));
  }

  final int attend;
  final int absent;
  final int late;
  List<int> allItem = [];

  bool get isAttend => attend >= absent && attend >= late;

  bool get isAbsent => absent >= attend && absent >= late;

  bool get isLate => late >= absent && late >= attend;
}
