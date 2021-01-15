import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget(this.list);

  final List<ExpansionTileItem> list;

  @override
  Widget build(BuildContext context) {
    /// the parent of this widget must be ListView. You can remove the ListView
    /// from here if you already have the ListView at where you will use this widget.
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        elevation: 0,
        expandedHeaderPadding: const EdgeInsets.all(0.0),
        children: list.map((item) {
          /// the child here must return ExpansionPanelRadio, if replace with
          /// other widget, this will give error
          return ExpansionPanelRadio(
            headerBuilder: (context, isExpanded) =>
                _buildPanelHeader(context, item),
            body: _buildPanelBody(context, item.children),
            value: item.header,
          );
        }).toList(),
      ),
    );
  }

  /// return any widget you want, this is not restricted.
  Widget _buildPanelHeader(BuildContext context, ExpansionTileItem item) {
    return ListTile(
      onTap: () {},
      title: Text(item.header),
    );
  }

  /// return any widget you want, this is not restricted.
  Widget _buildPanelBody(BuildContext context, List<String> body) {
    return (body ?? []).isEmpty
        ? const SizedBox()
        : Column(
            children: body
                .map((item) => ListTile(
                      onTap: () {},
                      title: Text(item),
                    ))
                .toList(),
          );
  }
}

class ExpansionTileItem {
  ExpansionTileItem({this.header, this.children});

  final String header;
  final List<String> children;
}
