
import 'package:aero_weather_pro_max/util/rasp_generator/rasp_generator_section.dart';
import 'package:flutter/material.dart';
import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart' as api;

class FutureRaspTileBuilder extends StatefulWidget {

  final int zoom;
  final int x;
  final int y;
  final DateTime time = DateTime(1990, 1, 1, 0, 0, 0, 0, 0);

  FutureRaspTileBuilder(
    {Key? key,
    required this.zoom,
    required this.x,
    required this.y,
    }//required this.time}
    ) : super(key: key);

  @override
  State<FutureRaspTileBuilder> createState() => _FutureRaspTileBuilderState();


}

class _FutureRaspTileBuilderState extends State<FutureRaspTileBuilder> {

  _FutureRaspTileBuilderState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RaspGeneratorSection.generateRaspImage(widget.x, widget.y),
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
                opacity: const AlwaysStoppedAnimation(.5),
              );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
