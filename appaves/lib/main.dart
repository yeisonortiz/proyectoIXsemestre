import 'package:appaves/src/Vistas/Imagenes.dart';
import 'package:appaves/src/Vistas/Inicio.dart';
import 'package:appaves/src/Vistas/SubirArchivo.dart';
import 'package:appaves/src/Vistas/videos.dart';
import 'package:extended_navbar_scaffold/extended_navbar_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primaryColor: Colors.green,
        brightness: Brightness.light,
        accentColor: Colors.green,
      ),
      home: ExtendedNavBar(),
    );
  }
}

class ExtendedNavBar extends StatefulWidget {
  ExtendedNavBar({Key key}) : super(key: key);

  _ExtendedNavBarState createState() => _ExtendedNavBarState();
}

class _ExtendedNavBarState extends State<ExtendedNavBar> {
  @override
  Widget build(BuildContext context) {
    return ExtendedNavigationBarScaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/src/assets/imgInicio.jpg'),
            ),
          ),
        ),
        color: Colors.blue[50],
      ),
      elevation: 0,
      floatingAppBar: true,
      appBar: AppBar(
        shape: kAppbarShape,
        title: Text(
          'Avistamiento de aves',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      moreButtons: [
        MoreButtonModel(
          icon: MaterialCommunityIcons.home,
          label: 'Inicio',
          onTap: () {
            mapa();
          },
        ),
        MoreButtonModel(
          icon: MaterialCommunityIcons.image,
          label: 'Imagenes',
          onTap: () {
            images();
          },
        ),
        MoreButtonModel(
          icon: FontAwesome.file_movie_o,
          label: 'VIdeos',
          onTap: () {
            video();
          },
        ),
        MoreButtonModel(
          icon: MaterialCommunityIcons.upload_multiple,
          label: 'Subir Archivo',
          onTap: () {
            subirArchivo();
          },
        ),
        null,
        null,
        null,
        null,
        null
      ],
      searchWidget: Container(
        height: 50,
        color: Colors.greenAccent,
      ),
      parallexCardPageTransformer: PageTransformer(
        pageViewBuilder: (context, visibilityResolver) {
          return PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            pageSnapping: true,
            controller: PageController(viewportFraction: 0.9),
            itemCount: parallaxCardItemsList.length,
            itemBuilder: (context, index) {
              final item = parallaxCardItemsList[index];
              final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);
              return ParallaxCardsWidget(
                item: item,
                pageVisibility: pageVisibility,
              );
            },
          );
        },
      ),
    );
  }

  final parallaxCardItemsList = <ParallaxCardItem>[
    ParallaxCardItem(
      title: 'Ruta 1',
      body: 'Caney Alto',
      background: Container(
          child: ElevatedButton(
              child: Image(
                image: AssetImage('lib/src/assets/caneyAltoMapa.png'),
              ),
              onPressed: () {
                print('hola');
              })),
    ),
    ParallaxCardItem(
        title: 'Ruta 2',
        body: 'Salinas',
        background: Container(
            child: ElevatedButton(
                child: Image(
                  image: AssetImage('lib/src/assets/salinasMapa.png'),
                ),
                onPressed: () {
                  print('hola');
                }))),
    ParallaxCardItem(
        title: 'Ruta 3',
        body: 'Marayal',
        background: Container(
            child: ElevatedButton(
                child: Image(
                  image: AssetImage('lib/src/assets/marayalMapa.png'),
                ),
                onPressed: () {
                  print('hola');
                }))),
  ];
}
