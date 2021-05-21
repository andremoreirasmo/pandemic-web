import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/ui/pages/home_page/home_page.store.dart';
import 'package:pandemicweb/ui/pages/home_page/widgets/total_cases.card.dart';

class HomePage extends StatelessWidget {
  final store = HomePageStore();
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        thickness: 10,
        child: ListView(
          controller: _scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                  child: SelectableText(
                    'Monitoramento de casos COVID-19',
                    style: AppTextStyles.titleBold,
                  ),
                ),
                Observer(
                    builder: (_) => Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 200.0,
                        width: MediaQuery.of(context).size.width * 0.62,
                        child: store.worldCases != null
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TotalCasesCard(
                                    color: Color(0xffFAAA1E),
                                    name: 'Infectados',
                                    icon: FeatherIcons.activity,
                                    data: store.worldCases?.totalConfirmed
                                            .toString() ??
                                        "",
                                  ),
                                  TotalCasesCard(
                                    color: Color(0xffFF4C60),
                                    name: 'Mortes',
                                    icon: FeatherIcons.frown,
                                    data: store.worldCases?.totalDeaths
                                            .toString() ??
                                        "",
                                  ),
                                  TotalCasesCard(
                                    color: Colors.greenAccent,
                                    name: 'Recuperados',
                                    icon: FeatherIcons.heart,
                                    data: store.worldCases?.totalRecovered
                                            .toString() ??
                                        "",
                                  ),
                                ],
                              )
                            : Center(child: CircularProgressIndicator())))
              ],
            )
          ],
        ),
      ),
    );
  }
}
