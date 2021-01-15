import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/expansion_tile_widget.dart';

class ExpansionTileScreen extends StatefulWidget {
  @override
  _ExpansionTileScreenState createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
  final List<ExpansionTileItem> _list = [
    ExpansionTileItem(header: '1', children: ['a', 'b', 'c']),
    ExpansionTileItem(header: '2', children: ['d', 'e', 'f']),
    ExpansionTileItem(header: '3', children: ['a', 'b', 'c']),
    ExpansionTileItem(header: '4', children: ['d', 'e', 'f']),
    ExpansionTileItem(header: '5', children: ['a', 'b', 'c']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toStringShort())),
      body: ExpansionTileWidget(_list),
    );
  }
}
