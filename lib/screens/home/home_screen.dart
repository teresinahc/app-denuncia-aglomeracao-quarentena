import 'package:covid_alert/screens/home/components/denuncia_tile.dart';
import 'package:covid_alert/screens/home/components/screen_with_time_indicator.dart';
import 'package:covid_alert/screens/home/controllers/home_controller.dart';
import 'package:covid_alert/shared/enums/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    _homeController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Alert"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        tooltip: "Fazer denúncia",
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Observer(
        builder: (_) {
          switch (_homeController.stateLoadDenuncias) {
            case RequestState.SUCCESS:
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
                        // mainAxisAlignment: MainAxisAlignment.center,
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
            case RequestState.LOADING:
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
