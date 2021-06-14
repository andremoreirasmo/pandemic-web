import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/ui/pages/statistics_page/statistics_page.store.dart';
import 'package:pandemicweb/ui/pages/statistics_page/widgets/total_cases_card.widget.dart';
import 'package:skeleton_text/skeleton_text.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final store = StatisticsPageStore();

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(4),
        child: Center(
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
                    margin:
                        EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                    child: SelectableText(
                      'Monitoramento de casos COVID-19',
                      style: AppTextStyles.titleBold,
                    ),
                  ),
                  Observer(
                    builder: (_) => Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 200.0,
                        // width: MediaQuery.of(context).size.width * 0.62,
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
                            : _loadingList(size)),
                  )
                ],
              )
            ],
          ),
        )));
  }

  _loadingList(size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [0, 0, 0]
          .map((e) => SkeletonAnimation(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: (size.height * 0.15),
                  width: (size.width * 0.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorsModel.primaryBlueColorDark,
                    boxShadow: [
                      BoxShadow(
                          color: ColorsModel.primaryBlueColorDark,
                          blurRadius: 1)
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
