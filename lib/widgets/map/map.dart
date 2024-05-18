

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
  static const int initZoom = 2;
  final ScrollController _verticalController = ScrollController(
    initialScrollOffset: (MapTileConverter.maxTile(initZoom)) * Api.tileSize,
    keepScrollOffset: false
  );
  final ScrollController _horisontalController = ScrollController(
    initialScrollOffset: (MapTileConverter.maxTile(initZoom)) * Api.tileSize,
    keepScrollOffset: false
  );

  int zoom = initZoom;
  double cur_lat = Api.cambridgeLatitude;
  double cur_lon = Api.cambridgeLongitude;

  double deltaX = 0.0;
  double deltaY = 0.0;


  int yOffset = 0;
  int xOffset = 0;
  int? lastX;
  int? lastY;

  double? addScrollX;
  double? addScrollY;

  TapDownDetails? _doubleTapDetails;

  double get offsetToSecondMap  {
    return (MapTileConverter.maxTile(zoom) +1) * Api.tileSize;
  }

  @override
  void initState() {
    super.initState();
    updateOffset();
    updateScroll();
  }

  void incZoom() {
    zoom = zoom < Api.maxZoom ? zoom + 1 : zoom;
  }

  void decZoom() {
    zoom = zoom > Api.minZoom ? zoom - 1 : zoom;
  }

  void updateOffsetByDelta() {
    int closestY = yOffset + (deltaY / Api.tileSize).floor();
    int closestX = xOffset + (deltaX / Api.tileSize).floor();
    double lat = MapTileConverter.tileYToLat(closestY, zoom);
    double lon = MapTileConverter.tileXToLon(closestX, zoom);
    double nextLat = MapTileConverter.tileYToLat(closestY + 1, zoom);
    double nextLon = MapTileConverter.tileXToLon(closestX + 1, zoom);

    cur_lat = (nextLat - lat) * ((deltaY % Api.tileSize) / Api.tileSize) + lat;
    cur_lon = (nextLon - lon) * ((deltaY % Api.tileSize) / Api.tileSize) + lon;
    deltaX = 0;
    deltaY = 0;
  }

  void doubleClickOnTile() {
    setState(() {
      double _lat = MapTileConverter.tileYToLat(lastY!, zoom);
      double _lon = MapTileConverter.tileXToLon(lastX!, zoom);
      double next_lat = MapTileConverter.tileYToLat(lastY! + 1, zoom);
      double next_lon = MapTileConverter.tileXToLon(lastX! + 1, zoom);

      cur_lat = (next_lat - _lat) * ((_doubleTapDetails!.localPosition.dy / Api.tileSize)) + _lat;
      cur_lon = (next_lon - _lon) * ((_doubleTapDetails!.localPosition.dx / Api.tileSize)) + _lon;

      incZoom();
      updateOffset();
      

      addScrollX = null;
      addScrollY = null;
      final RenderObject? renderBox = context.findRenderObject();
      if (renderBox is RenderBox) {
        final position = renderBox.localToGlobal(Offset.zero);
        final dx = (_doubleTapDetails!.globalPosition.dx - position.dx) / Api.tileSize;
        final dy = (_doubleTapDetails!.globalPosition.dy - position.dy) / Api.tileSize;

        addScrollX = (-dx) * Api.tileSize;
        addScrollY = (-dy) * Api.tileSize;
      }
      updateScroll();
    });
  }

  void doubleClickOnTileDown(details, x, y) {
    _doubleTapDetails = details;
    lastX = x;
    lastY = y;
  }

  void updateOffset() {
    xOffset = MapTileConverter.lonToTileX(cur_lon, zoom);
    yOffset = MapTileConverter.latToTileY(cur_lat, zoom);
  }

  void updateScroll() {
    if (_verticalController.hasClients && _horisontalController.hasClients) {
      _verticalController.jumpTo(offsetToSecondMap.toDouble() + (addScrollY ?? 0));
      _horisontalController.jumpTo(offsetToSecondMap.toDouble() + (addScrollX ?? 0));
      addScrollX = null;
      addScrollY = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GestureDetector(
      onDoubleTap: doubleClickOnTile,
      onPanUpdate: (details) => {
        deltaX += details.delta.dx,
        deltaY += details.delta.dy,
      },
      child: TableView.builder(
        verticalDetails: ScrollableDetails.vertical(
          controller: _verticalController
        ),
        horizontalDetails: ScrollableDetails.horizontal(
          controller: _horisontalController
        ),
        diagonalDragBehavior: DiagonalDragBehavior.free,

        cellBuilder: (context, vicinity) => MapTile(dX: vicinity.xIndex + xOffset, dY: vicinity.yIndex + yOffset, dZoom: zoom, clickCallbackDown: doubleClickOnTileDown, clickCallback: doubleClickOnTile, vicinity: vicinity).build(context),
        columnBuilder: _buildColumnSpan,
        rowBuilder: _buildRowSpan,
        clipBehavior: Clip.none,      
        )),
        Positioned(
          top: 10,
          right: 10,
          child: Tooltip(
          message: 'To zoom in double tap',
          child: ElevatedButton(
            onPressed: () {setState(() {
              updateOffsetByDelta();
              decZoom();
              updateOffset();
              addScrollX = -Api.tileSize;
              addScrollY = -Api.tileSize;
              updateScroll();
            });},
            child: const Text('-'),
          ),
        )),
       
    ]);
  }

  TableSpan _buildColumnSpan(int index) {
    return const TableSpan(
      extent: FixedTableSpanExtent(Api.tileSize),
    );
  }

  TableSpan _buildRowSpan(int index) {
    return const TableSpan(
      extent: FixedTableSpanExtent(Api.tileSize),
    );
  }
}

