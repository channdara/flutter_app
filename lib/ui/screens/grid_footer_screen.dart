import 'package:flutter/material.dart';

class GridFooterScreen extends StatefulWidget {
  const GridFooterScreen({Key? key}) : super(key: key);

  @override
  _GridFooterScreenState createState() => _GridFooterScreenState();
}

class _GridFooterScreenState extends State<GridFooterScreen> {
  final List<String> _items = [];
  bool _isOddItems = false;

  @override
  void initState() {
    List.generate(9, (index) => _items.add('Item number: $index'));
    _isOddItems = _items.length % 2 == 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toStringShort())),
      body: _isOddItems ? _buildOddGrid() : _buildGrid(),
    );
  }

  Widget _buildOddGrid() {
    print('${_items.length % 2}: build ODD');
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _items.length - 1,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.red : Colors.green,
                child: Text(_items.elementAt(index)),
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            color: Colors.yellow,
            child: Text(_items.last),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    print('${_items.length % 2}: build NORMAL');
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Container(
          color: index % 2 == 0 ? Colors.red : Colors.green,
          child: Text(_items.elementAt(index)),
        );
      },
    );
  }
}
