import 'package:covid_stats/Core/Controllers/StatsController.dart';
import 'package:covid_stats/Core/Model/CovidStatsPie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartScreen extends StatelessWidget {
  late final List<CovidStatsPie> chartdata;

  final StatsController controller = Get.find<StatsController>();

  final List<Color> colorList = [
    Color(0xff347BD2),
    Color(0xffF77280),
    Color(0xff74B49A),
    Color(0xff00A8B5),
    Color(0xffF8B195),
  ];

  @override
  Widget build(BuildContext context) {
    chartdata = controller.getDataForPie();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SfCircularChart(
          enableMultiSelection: true,
          palette: colorList,
          title: ChartTitle(text: 'Overall Covid-19 cases in Pakistan'),
          legend: Legend(
              toggleSeriesVisibility: true,
              position: LegendPosition.bottom,
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            PieSeries<CovidStatsPie, String>(
              legendIconType: LegendIconType.diamond,
              enableSmartLabels: true,
              dataSource: chartdata,
              xValueMapper: (CovidStatsPie data, _) => data.name,
              yValueMapper: (CovidStatsPie data, _) => data.value,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ),
          ],
        ),
      ),
    );
  }
}
