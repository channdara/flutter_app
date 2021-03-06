import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/bloc_screen.dart';
import 'package:flutter_app/ui/screens/chart_screen.dart';
import 'package:flutter_app/ui/screens/expansion_tile_screen.dart';
import 'package:flutter_app/ui/screens/grid_footer_screen.dart';
import 'package:flutter_app/ui/screens/star_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _allScreens = [
    const GridFooterScreen(),
    StarScreen(),
    BlocScreen(),
    ExpansionTileScreen(),
    ChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toStringShort())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Column(
          children: _allScreens.map((screen) => _buildButton(screen)).toList(),
        ),
      ),
    );
  }

  Widget _buildButton(Widget screen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        child: Text(screen.toStringShort()),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        onPressed: () => _push(screen),
      ),
    );
  }

  void _push(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}
