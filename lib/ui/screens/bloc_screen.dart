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
    _cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toStringShort())),
      body: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: _cubit.decrement,
            ),
            title: BlocBuilder(
              cubit: _cubit,
              builder: (context, state) => Text(
                'Count: ${_cubit.count}',
                textAlign: TextAlign.center,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.blue),
              onPressed: _cubit.increment,
            ),
          ),
        ],
      ),
    );
  }
}
