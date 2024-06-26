import 'package:aero_weather_pro_max/widgets/map/map_tile.dart';
import 'package:aero_weather_pro_max/widgets/map/rasp_tile.dart';
import 'package:flutter/material.dart';
import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart' as api;
import 'package:aero_weather_pro_max/util/map_handler/map_tile_converter.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class MapTile extends StatelessWidget {
  final int zoom;
  final int x;
  final int y;
  final Function clickCallback;
  final Function clickCallbackDown;
  final TableVicinity vicinity;

   MapTile({
    Key? key,
    required dZoom,
    required dX,
    required dY,
    required this.clickCallback,
    required this.clickCallbackDown,
    required this.vicinity
  }) 
  :
    x = dX < 0 ? (dX % MapTileConverter.maxTile(dZoom)) + MapTileConverter.maxTile(dZoom) : dX % MapTileConverter.maxTile(dZoom),
    y = dY < 0 ? (dY % MapTileConverter.maxTile(dZoom)) + MapTileConverter.maxTile(dZoom) : dY % MapTileConverter.maxTile(dZoom),
    zoom = dZoom.clamp(api.Api.minZoom, api.Api.maxZoom),
    super(key: key);
  

  @override
  TableViewCell build(BuildContext context) {
    return TableViewCell(
      child:  GestureDetector(
      onDoubleTapDown: (TapDownDetails details){
        clickCallbackDown(details, x, y);
      },
      onDoubleTap: () => {clickCallback()},
      child: GridTile(
      child: Stack(
        children: [
          FutureTileBuilder(
            zoom: zoom,
            x: x,
            y: y,
          ),
          FutureRaspTileBuilder(
            zoom: zoom,
            x: x,
            y: y,
          )
        ]
      ))));
  }
}

