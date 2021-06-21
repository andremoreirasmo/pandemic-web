import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/functions.dart';
import 'package:pandemicweb/ui/features/statistics_page/statistics_page.store.dart';
import 'package:pandemicweb/ui/features/statistics_page/widgets/total_cases_card.widget.dart';
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
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    _loadingList() {
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

    // _brazilDashboard() {
    //   return Container(
    //     decoration: const BoxDecoration(
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(18),
    //         ),
    //         color: Color(0xff232d37)),
    //     child: Padding(
    //       padding: const EdgeInsets.all(50),
    //       child: LineChart(
    //         LineChartSample2(),
    //       ),
    //     ),
    //   );
    // }

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
                  Container(
                    margin:
                        EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.white.withOpacity(0.3), width: 1),
                      ),
                    ),
                    child: SelectableText(
                      'Mundo',
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
                                    color: Colors.amber,
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
                            : _loadingList()),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.white.withOpacity(0.3), width: 1),
                      ),
                    ),
                    child: SelectableText(
                      'Brasil',
                      style: AppTextStyles.titleBold,
                    ),
                  ),
                  // _brazilDashboard()
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: LineChartSample2(
                      availableMonths: store.lastMonths,
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}

class LineChartSample2 extends StatefulWidget {
  List<int> availableMonths;

  LineChartSample2({
    Key key,
    this.availableMonths,
  }) : super(key: key);
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: ColorsModel.primaryBlueColorDark),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          // reservedSize: 6,
          // interval: 3,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            if (widget.availableMonths.contains(value.toInt())) {
              return Functions.getFormatedMonthString(value);
            }
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
