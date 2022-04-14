import 'package:intl/intl.dart' as intl;
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class Sample14 extends StatefulWidget {
  @override
  _Sample14State createState() => _Sample14State();
}

class _Sample14State extends State<Sample14> {
  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    super.initState();
    fromDate = DateTime(2019, 09, 1);
    toDate = DateTime(2019, 09, 30);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic date range"),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          //height: MediaQuery.of(context).size.height / 2,
          //width: MediaQuery.of(context).size.width,
          child: BezierChart(
            fromDate: fromDate,
            bezierChartScale: BezierChartScale.WEEKLY,
            toDate: toDate,
            onIndicatorVisible: (val) {
              print("Indicator Visible :$val");
            },
            onDateTimeSelected: (datetime) {
              print("selected datetime: $datetime");
            },
            selectedDate: toDate,
            //this is optional
            footerDateTimeBuilder:
                (DateTime value, BezierChartScale? scaleType) {
              final newFormat = intl.DateFormat('dd/MMM');
              return newFormat.format(value);
            },
            bubbleLabelDateTimeBuilder:
                (DateTime value, BezierChartScale? scaleType) {
              final newFormat = intl.DateFormat('dd MMM yyyy HH:mm:ss');
              return "${newFormat.format(value)}\n";
            },
            series: [
              BezierLine(
                label: "Duty",
                onMissingValue: (dateTime) {
                  return 3120.5;
                },
                data: <DataPoint<DateTime>>[
                  DataPoint<DateTime>(
                      value: 3235.9, xAxis: DateTime(2019, 9, 24)),
                  DataPoint<DateTime>(
                      value: 2340.5, xAxis: DateTime(2019, 9, 25)),
                  DataPoint<DateTime>(
                      value: 2115.21, xAxis: DateTime(2019, 9, 26)),
                  DataPoint<DateTime>(
                      value: 3120.5, xAxis: DateTime(2019, 9, 27)),
                  DataPoint<DateTime>(
                      value: 3235.9, xAxis: DateTime(2019, 9, 30)),
                ],
              ),
              BezierLine(
                label: "Data2",
                lineColor: Colors.orange,
                onMissingValue: (dateTime) {
                  return 1250.5;
                },
                data: <DataPoint<DateTime>>[
                  DataPoint<DateTime>(
                      value: 1500.9, xAxis: DateTime(2019, 9, 24)),
                  DataPoint<DateTime>(
                      value: 1600.5, xAxis: DateTime(2019, 9, 25)),
                  DataPoint<DateTime>(
                      value: 1700.21, xAxis: DateTime(2019, 9, 26)),
                  DataPoint<DateTime>(
                      value: 1800.5, xAxis: DateTime(2019, 9, 27)),
                  DataPoint<DateTime>(
                      value: 1900.9, xAxis: DateTime(2019, 9, 30)),
                ],
              ),
            ],
            config: BezierChartConfig(
              updatePositionOnTap: true,
              bubbleIndicatorValueFormat:
                  intl.NumberFormat("###,##0.00", "en_US"),
              verticalIndicatorStrokeWidth: 1.0,
              verticalIndicatorColor: Colors.green,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              backgroundColor: Colors.blueGrey,
              footerHeight: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
