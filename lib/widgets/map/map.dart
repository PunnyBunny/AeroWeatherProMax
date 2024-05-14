

import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart';
import 'package:aero_weather_pro_max/widgets/map/tile.dart';
import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final ScrollController _verticalController = ScrollController();
  final ScrollController _horisontalController = ScrollController();

  final int zoom = 2;

  @override
  Widget build(BuildContext context) {
    return TableView.builder(
        verticalDetails: ScrollableDetails.vertical(
          controller: _verticalController
        ),
        horizontalDetails: ScrollableDetails.horizontal(
          controller: _horisontalController
        ),
        diagonalDragBehavior: DiagonalDragBehavior.free,

        cellBuilder: (context, vicinity) => MapTile(x: vicinity.xIndex, y: vicinity.yIndex, zoom: zoom).build(context),
        columnBuilder: _buildColumnSpan,
        rowBuilder: _buildRowSpan,

        
      );
  }

  TableSpan _buildColumnSpan(int index) {
    return const TableSpan(
      extent: FixedSpanExtent(Api.tileSize),
    );
  }

  TableSpan _buildRowSpan(int index) {
    return const TableSpan(
      extent: FixedSpanExtent(Api.tileSize),
    );
  }
}