import 'package:flutter/material.dart';
import 'package:aero_weather_pro_max/util/map_handler/map_tiles_api_handler.dart' as map_handler;
import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart' as api;


class FutureTileBuilder extends StatefulWidget {

  final int zoom;
  final int x;
  final int y;

  const FutureTileBuilder(
    {Key? key,
    required this.zoom,
    required this.x,
    required this.y}
    ) : super(key: key);

  @override
  State<FutureTileBuilder> createState() => _FutureTileBuilderState();


}

class _FutureTileBuilderState extends State<FutureTileBuilder> {

  _FutureTileBuilderState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: map_handler.MapTilesApiHandler.getMapTile(zoom: widget.zoom, x: widget.x, y: widget.y),
      builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error: Unable to load map tile');
          }
          return
              Image(
                image: snapshot.data!.image,
                width: api.Api.tileSize,
                height: api.Api.tileSize,
                fit: BoxFit.fill,
              );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}