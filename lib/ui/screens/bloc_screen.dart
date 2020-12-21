import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/bloc_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatefulWidget {
  @override
  _BlocScreenState createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  BlocCubit _cubit;

  @override
  void initState() {
    _cubit = BlocCubit();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toStringShort())),
      body: Column(
        children: [
          BlocBuilder(
            cubit: _cubit,
            builder: (context, state) => ListTile(
              leading: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: _cubit.decrement,
              ),
              title: Text(
                'Count: ${_cubit.count}',
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: _cubit.increment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
