

import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart';
import 'package:aero_weather_pro_max/util/map_handler/map_tile_converter.dart';
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

  int zoom = 2;
  double cur_lat = Api.cambridgeLatitude;
  double cur_lon = Api.cambridgeLongitude;

  int yOffset = 0;
  int xOffset = 0;

  void doubleClickOnTile(x, y) {
    setState(() {
      cur_lat = MapTileConverter.tileYToLat(y, zoom);
      cur_lon = MapTileConverter.tileXToLon(x, zoom);
      zoom =  zoom < Api.maxZoom ? zoom + 1 : zoom;
      updateOffset();
    });
  }

  void updateOffset() {
    xOffset = MapTileConverter.lonToTileX(cur_lon, zoom);
    yOffset = MapTileConverter.latToTileY(cur_lat, zoom);
  }

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

        cellBuilder: (context, vicinity) => MapTile(dX: vicinity.xIndex + xOffset, dY: vicinity.yIndex + yOffset, dZoom: zoom, clickCallback: doubleClickOnTile).build(context),
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