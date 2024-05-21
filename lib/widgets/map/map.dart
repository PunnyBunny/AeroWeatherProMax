

import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart';
import 'package:aero_weather_pro_max/util/map_handler/map_tile_converter.dart';
import 'package:aero_weather_pro_max/widgets/map/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
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
  double curLat = Api.cambridgeLatitude;
  double curLon = Api.cambridgeLongitude;

  double deltaX = 0.0;
  double deltaY = 0.0;

  int? lastX;
  int? lastY;

  double addScrollX = 0;
  double addScrollY = 0;

  TapDownDetails? _doubleTapDetails;

  double get offsetToSecondMap  {
    return (MapTileConverter.maxTile(zoom)) * Api.tileSize;
  }

  @override
  void initState() {
    super.initState();
    createScrollFromCurrent();
    updateScroll();
  }

  void incZoom() {
    zoom = zoom < Api.maxZoom ? zoom + 1 : zoom;
  }

  void decZoom() {
    zoom = zoom > Api.minZoom ? zoom - 1 : zoom;
  }

  void updateOffsetByDelta() {
    int closestY = (deltaY / Api.tileSize).floor();
    int closestX = (deltaX / Api.tileSize).floor();
    double lat = MapTileConverter.tileYToLat(closestY, zoom);
    double lon = MapTileConverter.tileXToLon(closestX, zoom);
    double nextLat = MapTileConverter.tileYToLat(closestY + 1, zoom);
    double nextLon = MapTileConverter.tileXToLon(closestX + 1, zoom);

    curLat = ((nextLat - lat) * ((deltaY % Api.tileSize) / Api.tileSize)) + curLat;
    curLon = ((nextLon - lon) * ((deltaX % Api.tileSize) / Api.tileSize)) + curLon;

    decZoom();
    createScrollFromCurrent();

    final RenderObject? renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      final dx = (renderBox.paintBounds.bottomRight.dx - renderBox.paintBounds.topLeft.dx)/2;
      final dy = (renderBox.paintBounds.bottomRight.dy - renderBox.paintBounds.topLeft.dy)/2;

      // second div by 2 due to the decrease in zoom
      addScrollX += (-dx);
      addScrollY += (-dy);
    }
    updateScroll();

  }

  void updateOffsetByDeltaInc() {
    int closestY = (deltaY / Api.tileSize).floor();
    int closestX = (deltaX / Api.tileSize).floor();
    double lat = MapTileConverter.tileYToLat(closestY, zoom);
    double lon = MapTileConverter.tileXToLon(closestX, zoom);
    double nextLat = MapTileConverter.tileYToLat(closestY + 1, zoom);
    double nextLon = MapTileConverter.tileXToLon(closestX + 1, zoom);

    curLat = ((nextLat - lat) * ((deltaY % Api.tileSize) / Api.tileSize)) + curLat;
    curLon = ((nextLon - lon) * ((deltaX % Api.tileSize) / Api.tileSize)) + curLon;

    incZoom();
    createScrollFromCurrent();

    final RenderObject? renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      final dx = (renderBox.paintBounds.bottomRight.dx - renderBox.paintBounds.topLeft.dx)/2;
      final dy = (renderBox.paintBounds.bottomRight.dy - renderBox.paintBounds.topLeft.dy)/2;

      // second div by 2 due to the decrease in zoom
      addScrollX += (-dx);
      addScrollY += (-dy);
    }
    updateScroll();

  }

  void doubleClickOnTile() {
    setState(() {
      double _lat = MapTileConverter.tileYToLat(lastY!, zoom);
      double _lon = MapTileConverter.tileXToLon(lastX!, zoom);
      double next_lat = MapTileConverter.tileYToLat(lastY! + 1, zoom);
      double next_lon = MapTileConverter.tileXToLon(lastX! + 1, zoom);

      curLat = (next_lat - _lat) * ((_doubleTapDetails!.localPosition.dy / Api.tileSize)) + _lat;
      curLon = (next_lon - _lon) * ((_doubleTapDetails!.localPosition.dx / Api.tileSize)) + _lon;

      incZoom();
      createScrollFromCurrent();

      final RenderObject? renderBox = context.findRenderObject();
      if (renderBox is RenderBox) {
        final position = renderBox.localToGlobal(Offset.zero);
        final dx = (_doubleTapDetails!.globalPosition.dx - position.dx) / Api.tileSize;
        final dy = (_doubleTapDetails!.globalPosition.dy - position.dy) / Api.tileSize;

        addScrollX += (-dx) * Api.tileSize;
        addScrollY += (-dy) * Api.tileSize;
      }
      updateScroll();
    });
  }

  void createScrollFromCurrent() {
    addScrollX = offsetToSecondMap.toDouble() + (MapTileConverter.lonToX(curLon, zoom) * Api.tileSize);
    addScrollY = offsetToSecondMap.toDouble() + (MapTileConverter.latToY(curLat, zoom) * Api.tileSize);
  }

  void doubleClickOnTileDown(details, x, y) {
    _doubleTapDetails = details;
    lastX = x;
    lastY = y;
  }

  void updateScroll() {
    if (_verticalController.hasClients && _horisontalController.hasClients) {
      _verticalController.jumpTo(addScrollY);
      _horisontalController.jumpTo(addScrollX);
      addScrollX = 0;
      addScrollY = 0;
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

        cellBuilder: (context, vicinity) => MapTile(dX: vicinity.xIndex, dY: vicinity.yIndex, dZoom: zoom, clickCallbackDown: doubleClickOnTileDown, clickCallback: doubleClickOnTile, vicinity: vicinity).build(context),
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
            });},
            child: const Text('-'),
          ),
        )),
        Positioned(
          top: 50,
          right: 10,
          child: Tooltip(
          message: 'To zoom in double tap',
          child: ElevatedButton(
            onPressed: () {setState(() {
              updateOffsetByDeltaInc();
            });},
            child: const Text('+'),
          ),
        )),
        const Positioned(
          bottom: 10,
          right: 10,
          child: Text('Map tiles © MapTiles API | Map data © OpenStreetMap contributors.')
        ),
        Positioned(
          bottom: 40,
          right: 10,
          child: Card(
          margin: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 60,
            width: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(120, 255, 0, 0)
                          ),
                    ),
                    SizedBox(width: 10),
                    Text("Top RASP Rating"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(120, 0, 0, 255),
                    )),
                    SizedBox(width: 10),
                    Text("Bottom RASP Rating"),
                 ],
                ),
              ],
            ),
          ),
        ),
        )
       
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

