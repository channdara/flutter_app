import 'package:flutter/material.dart';

class StarScreen extends StatefulWidget {
  @override
  _StarScreenState createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  List<double> _list = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toStringShort())),
      body: Column(
        children: _list
            .map((e) => Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(e.toString()),
                        const SizedBox(width: 16.0),
                        _buildStar(e),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildStar(double rating) {
    return Wrap(
      children: List.generate(rating.ceil(), (index) {
        if (index.toDouble() <= rating - 1.0) return const Icon(Icons.star);
        if (index.toDouble() <= rating - 0.5)
          return const Icon(Icons.star_half);
        return const Icon(Icons.star_border_outlined);
      }),
    );
  }
}
