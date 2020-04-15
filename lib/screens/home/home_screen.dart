import 'package:covid_alert/screens/home/components/denuncia_tile.dart';
import 'package:covid_alert/screens/home/components/drawer.dart';
import 'package:covid_alert/screens/home/components/screen_with_time_indicator.dart';
import 'package:covid_alert/screens/home/controllers/home_controller.dart';
import 'package:covid_alert/screens/new_denuncia/new_denuncia_screen.dart';
import 'package:covid_alert/shared/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = GetIt.I.get<HomeController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  ReactionDisposer _disposer;

  @override
  void initState() {
    _homeController.initialize();
    _disposer = autorun((_) {
      if (_homeController.denuncias.hasError)
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Erro"),
              content: Text("Algum erro ocorreu, tente novamente!"),
              actions: [
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text("Tente novamente"),
                  onPressed: () {
                    Navigator.pop(context);
                    _homeController.initialize();
                  },
                )
              ],
            ));
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: appBar(
          title: "Denúncias",
          leading: Leading.DRAWER,
          onLeadingPress: () {
            _key.currentState.openDrawer();
          }),
      drawer: CustomDrawer(
        isHomeScreen: true,
        isSobreScreen: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewDenunciaScreen()));
        },
        child: Icon(Icons.add),
        tooltip: "Fazer denúncia",
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Observer(
        builder: (_) {
          if (_homeController.denuncias == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return _homeController.denunciasAgrouped != null &&
                  _homeController.denunciasAgrouped.isNotEmpty
              ? ListView(
                  padding: EdgeInsets.all(16),
                  children: _homeController.denunciasAgrouped.keys
                      .map<Widget>((key) => ScreenDateIndicator(
                          hasNext: key !=
                              _homeController.denunciasAgrouped.keys.last,
                          headTime: key,
                          items: _homeController.denunciasAgrouped[key]
                              .map<Widget>((denuncia) =>
                                  DenunciaTile(denuncia: denuncia))
                              .toList()))
                      .toList(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Text(
                        "Ainda não existe nenhuma denúncia registrada.",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(0, 0, 0, 0.56)),
                      ),
                      Positioned(
                        bottom: 0.3 * MediaQuery.of(context).size.height,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Aperte o botão abaixo para fazer a primeira denúncia.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.88)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
