import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

/// Applies a theme to descendant Syncfusion chart widgets.
///
/// To obtain the current theme, use [SfChartTheme.of].
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     body: SfChartTheme(
///       data: SfChartThemeData(
///         brightness: Brightness.dark,
///         backgroundColor: Colors.grey
///       ),
///       child: SfCartesianChart()
///     ),
///   );
/// }
/// ```
///
/// See also:
///
/// * [SfTheme](https://pub.dev/documentation/syncfusion_flutter_core/latest/theme/SfTheme-class.html)
/// and [SfThemeData](https://pub.dev/documentation/syncfusion_flutter_core/latest/theme/SfThemeData-class.html),
/// for customizing the visual appearance of the chart widgets.
///
class SfChartTheme extends InheritedTheme {
  /// Creating an argument constructor of SfChartTheme class.
  const SfChartTheme({Key? key, required this.data, required this.child})
    : super(key: key, child: child);

  /// Specifies the color and typography values for descendant chart widgets.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: SfChartTheme(
  ///       data: SfChartThemeData(
  ///         brightness: Brightness.dark,
  ///         backgroundColor: Colors.grey
  ///       ),
  ///       child: SfCartesianChart()
  ///     ),
  ///   );
  /// }
  /// ```
  final SfChartThemeData data;

  /// Specifies a widget that can hold single child.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: SfChartTheme(
  ///       data: SfChartThemeData(
  ///         brightness: Brightness.dark,
  ///         backgroundColor: Colors.grey
  ///       ),
  ///       child: SfCartesianChart()
  ///     ),
  ///   );
  /// }
  /// ```
  @override
  final Widget child;

  /// The data from the closest [SfChartTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to [SfThemeData.chartThemeData] if there is no [SfChartTheme]
  /// in the given build context.
  ///
  static SfChartThemeData of(BuildContext context) {
    final SfChartTheme? sfChartTheme =
        context.dependOnInheritedWidgetOfExactType<SfChartTheme>();
    return sfChartTheme?.data ?? SfTheme.of(context).chartThemeData;
  }

  @override
  bool updateShouldNotify(SfChartTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final SfChartTheme? ancestorTheme =
        context.findAncestorWidgetOfExactType<SfChartTheme>();
    return identical(this, ancestorTheme)
        ? child
        : SfChartTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for a [SfChartTheme]. Use
///  this class to configure a [SfChartTheme] widget.
///
/// To obtain the current theme, use [SfChartTheme.of].
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     body: SfChartTheme(
///       data: SfChartThemeData(
///         brightness: Brightness.dark,
///         backgroundColor: Colors.blue[300]
///       ),
///       child: SfCartesianChart()
///     )
///   );
/// }
/// ```
///
/// See also:
///
/// * [SfTheme](https://pub.dev/documentation/syncfusion_flutter_core/latest/theme/SfTheme-class.html)
/// and [SfThemeData](https://pub.dev/documentation/syncfusion_flutter_core/latest/theme/SfThemeData-class.html),
/// for customizing the visual appearance of the chart widget.
///
@immutable
class SfChartThemeData with Diagnosticable {
  /// Creating an argument constructor of SfChartThemeData class.
  const SfChartThemeData({
    this.axisLabelColor,
    this.axisLineColor,
    this.axisTitleColor,
    this.backgroundColor,
    this.titleTextColor,
    this.crosshairBackgroundColor,
    this.crosshairLabelColor,
    this.crosshairLineColor,
    this.legendBackgroundColor,
    this.legendTextColor,
    this.legendTitleColor,
    this.majorGridLineColor,
    this.majorTickLineColor,
    this.minorGridLineColor,
    this.minorTickLineColor,
    this.plotAreaBackgroundColor,
    this.plotAreaBorderColor,
    this.selectionRectColor,
    this.selectionRectBorderColor,
    this.selectionTooltipConnectorLineColor,
    this.titleBackgroundColor,
    this.tooltipColor,
    this.tooltipSeparatorColor,
    this.tooltipLabelColor,
    this.waterfallConnectorLineColor,
    this.titleTextStyle,
    this.axisTitleTextStyle,
    this.axisLabelTextStyle,
    this.axisMultiLevelLabelTextStyle,
    this.plotBandLabelTextStyle,
    this.legendTitleTextStyle,
    this.legendTextStyle,
    this.dataLabelTextStyle,
    this.tooltipTextStyle,
    this.trackballTextStyle,
    this.crosshairTextStyle,
    this.selectionZoomingTooltipTextStyle,
  });

  /// Create a [SfChartThemeData] given a set of exact values.
  /// All the values must be specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [SfChartThemeData] constructor.
  ///
  factory SfChartThemeData.raw({
    Brightness? brightness,
    Color? backgroundColor,
    Color? axisLabelColor,
    Color? axisTitleColor,
    Color? axisLineColor,
    Color? majorGridLineColor,
    Color? minorGridLineColor,
    Color? majorTickLineColor,
    Color? minorTickLineColor,
    Color? titleTextColor,
    Color? titleBackgroundColor,
    Color? legendTextColor,
    Color? legendTitleColor,
    Color? legendBackgroundColor,
    Color? plotAreaBackgroundColor,
    Color? plotAreaBorderColor,
    Color? crosshairLineColor,
    Color? crosshairBackgroundColor,
    Color? crosshairLabelColor,
    Color? tooltipColor,
    Color? tooltipLabelColor,
    Color? tooltipSeparatorColor,
    Color? selectionRectColor,
    Color? selectionRectBorderColor,
    Color? selectionTooltipConnectorLineColor,
    Color? waterfallConnectorLineColor,
    TextStyle? titleTextStyle,
    TextStyle? axisTitleTextStyle,
    TextStyle? axisLabelTextStyle,
    TextStyle? axisMultiLevelLabelTextStyle,
    TextStyle? plotBandLabelTextStyle,
    TextStyle? legendTitleTextStyle,
    TextStyle? legendTextStyle,
    TextStyle? dataLabelTextStyle,
    TextStyle? tooltipTextStyle,
    TextStyle? trackballTextStyle,
    TextStyle? crosshairTextStyle,
    TextStyle? selectionZoomingTooltipTextStyle,
  }) {
    brightness = brightness ?? Brightness.light;

    return SfChartThemeData(
      axisLabelColor: axisLabelColor,
      axisLineColor: axisLineColor,
      axisTitleColor: axisTitleColor,
      backgroundColor: backgroundColor,
      titleTextColor: titleTextColor,
      crosshairBackgroundColor: crosshairBackgroundColor,
      crosshairLabelColor: crosshairLabelColor,
      crosshairLineColor: crosshairLineColor,
      legendBackgroundColor: legendBackgroundColor,
      legendTextColor: legendTextColor,
      legendTitleColor: legendTitleColor,
      majorGridLineColor: majorGridLineColor,
      majorTickLineColor: majorTickLineColor,
      minorGridLineColor: minorGridLineColor,
      minorTickLineColor: minorTickLineColor,
      plotAreaBackgroundColor: plotAreaBackgroundColor,
      plotAreaBorderColor: plotAreaBorderColor,
      selectionRectColor: selectionRectColor,
      selectionRectBorderColor: selectionRectBorderColor,
      selectionTooltipConnectorLineColor: selectionTooltipConnectorLineColor,
      titleBackgroundColor: titleBackgroundColor,
      tooltipColor: tooltipColor,
      tooltipSeparatorColor: tooltipSeparatorColor,
      tooltipLabelColor: tooltipLabelColor,
      waterfallConnectorLineColor: waterfallConnectorLineColor,
      titleTextStyle: titleTextStyle,
      axisTitleTextStyle: axisTitleTextStyle,
      axisLabelTextStyle: axisLabelTextStyle,
      axisMultiLevelLabelTextStyle: axisMultiLevelLabelTextStyle,
      plotBandLabelTextStyle: plotBandLabelTextStyle,
      legendTitleTextStyle: legendTitleTextStyle,
      legendTextStyle: legendTextStyle,
      dataLabelTextStyle: dataLabelTextStyle,
      tooltipTextStyle: tooltipTextStyle,
      trackballTextStyle: trackballTextStyle,
      crosshairTextStyle: crosshairTextStyle,
      selectionZoomingTooltipTextStyle: selectionZoomingTooltipTextStyle,
    );
  }

  /// Specifies the background color of chart widgets.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              backgroundColor: Colors.blue
  ///            )
  ///          ),
  ///          child: SfCartesianChart()
  ///        ),
  ///      )
  ///   );
  /// }
  ///```
  final Color? backgroundColor;

  /// Specifies the color for axis labels.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             axisLabelColor: Colors.red
  ///           )
  ///         ),
  ///         child: SfCartesianChart()
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? axisLabelColor;

  /// Specifies the color for axis title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             axisTitleColor: Colors.blue
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           primaryXAxis: NumericAxis(
  ///             title: AxisTitle(text: 'X-Axis')
  ///           ),
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? axisTitleColor;

  /// Specifies the color for axis line.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             axisLineColor: Colors.blue
  ///           )
  ///         ),
  ///         child: SfCartesianChart()
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? axisLineColor;

  /// Specifies the color for major grid line of an axis.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             majorGridLineColor: Colors.red
  ///           )
  ///         ),
  ///         child: SfCartesianChart()
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? majorGridLineColor;

  /// Specifies the color for minor grid line of an axis.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             minorGridLineColor: Colors.red[300]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           primaryXAxis: NumericAxis(minorTicksPerInterval: 5),
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? minorGridLineColor;

  /// Specifies the color for major tick line of an axis.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             majorTickLineColor: Colors.red
  ///           )
  ///         ),
  ///         child: SfCartesianChart()
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? majorTickLineColor;

  /// Specifies the color for minor tick line of an axis.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             minorTickLineColor: Colors.red[300]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           primaryXAxis: NumericAxis(minorTicksPerInterval: 5),
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? minorTickLineColor;

  /// Specifies the color of the chart title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             titleTextColor: Colors.blue
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           title: ChartTitle(text: 'Chart'),
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```
  final Color? titleTextColor;

  /// Specifies the background color for title of the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             titleBackgroundColor: Colors.grey[400]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           title: ChartTitle(text: 'Chart'),
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? titleBackgroundColor;

  /// Specifies the text color of the legend.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             legendTextColor: Colors.blue[300]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           legend: Legend(isVisible: true),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? legendTextColor;

  /// Specifies the title color of the legend.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             legendTitleColor: Colors.brown
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           legend: Legend(isVisible: true,
  ///             title: LegendTitle(text: 'Legend Title')),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? legendTitleColor;

  /// Specifies the background color of the legend.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             legendBackgroundColor: Colors.grey[400]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           legend: Legend(isVisible: true),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? legendBackgroundColor;

  /// Specifies the background color of the plot area of the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             plotAreaBackgroundColor: Colors.grey[400]
  ///           )
  ///         ),
  ///         child: SfCartesianChart()
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? plotAreaBackgroundColor;

  /// Specifies the border color of the plot area of the chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             plotAreaBorderColor: Colors.grey[400]
  ///           )
  ///         ),
  ///         child: SfCartesianChart()
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? plotAreaBorderColor;

  /// Specifies the crosshair line color.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             crosshairLineColor: Colors.red
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           crosshairBehavior: CrosshairBehavior(enable: true),
  ///           primaryXAxis: NumericAxis(),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? crosshairLineColor;

  /// Specifies the background color of the crosshair.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             crosshairBackgroundColor: Colors.teal
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           crosshairBehavior: CrosshairBehavior(enable: true),
  ///           primaryXAxis: NumericAxis(),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? crosshairBackgroundColor;

  /// Specifies the color of the crosshair text.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             crosshairLabelColor: Colors.yellow
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           crosshairBehavior: CrosshairBehavior(enable: true),
  ///           primaryXAxis: NumericAxis(),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? crosshairLabelColor;

  /// Specifies the color of the tooltip.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             tooltipColor: Colors.teal
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? tooltipColor;

  /// Specifies the text color of the tooltip.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             tooltipLabelColor: Colors.amber
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? tooltipLabelColor;

  /// Specifies the line color of the tooltip
  /// which separates the header and values.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             tooltipSeparatorColor: Colors.black
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? tooltipSeparatorColor;

  /// Specifies the color of an rectangle which is used for selection zooming.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             selectionRectColor: Colors.red[300]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           zoomPanBehavior: ZoomPanBehavior(
  ///              enableSelectionZooming: true
  ///           ),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? selectionRectColor;

  /// Specifies the stroke color of an rectangle
  /// which is used for selection zooming.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             selectionRectBorderColor: Colors.red
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           zoomPanBehavior: ZoomPanBehavior(
  ///              enableSelectionZooming: true
  ///           ),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? selectionRectBorderColor;

  /// Specifies the connector line color which is used in selection zooming.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             selectionTooltipConnectorLineColor: Colors.red
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           zoomPanBehavior: ZoomPanBehavior(
  ///              enableSelectionZooming: true
  ///           ),
  ///           series: <ChartSeries<Sample,num>>[
  ///             LineSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? selectionTooltipConnectorLineColor;

  /// Specifies the connector line color for the waterfall chart.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             waterfallConnectorLineColor: Colors.grey[400]
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///           series: <ChartSeries<Sample,num>>[
  ///             WaterfallSeries(
  ///               dataSource: chartData,
  ///               xValueMapper: (Sample data, _) => data.x,
  ///               yValueMapper: (Sample data, _) => data.y
  ///             )
  ///           ],
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  ///```

  final Color? waterfallConnectorLineColor;

  /// Specifies the text style for title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              titleTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? titleTextStyle;

  /// Specifies the text style for axis title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              axisTitleTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? axisTitleTextStyle;

  /// Specifies the text style for axis label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              axisLabelTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? axisLabelTextStyle;

  /// Specifies the text style for axis multi-level label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              axisMultiLevelLabelTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? axisMultiLevelLabelTextStyle;

  /// Specifies the text style for plot band label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              plotBandLabelTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? plotBandLabelTextStyle;

  /// Specifies the text style for legend title.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              legendTitleTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? legendTitleTextStyle;

  /// Specifies the text style for legend text.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              legendTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? legendTextStyle;

  /// Specifies the text style for data label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              dataLabelTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? dataLabelTextStyle;

  /// Specifies the text style for tooltip label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              tooltipTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? tooltipTextStyle;

  /// Specifies the text style for trackball label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              trackballTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? trackballTextStyle;

  /// Specifies the text style for crosshair label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              crosshairTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? crosshairTextStyle;

  /// Specifies the text style for selection zooming interactive label.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            chartThemeData: SfChartThemeData(
  ///              selectionZoomingTooltipTextStyle:
  ///                 TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```

  final TextStyle? selectionZoomingTooltipTextStyle;

  /// Creates a copy of this chart theme data object with the matching fields
  /// replaced with the non-null parameter values.
  SfChartThemeData copyWith({
    Brightness? brightness,
    Color? axisLabelColor,
    Color? axisLineColor,
    Color? axisTitleColor,
    Color? backgroundColor,
    Color? titleTextColor,
    Color? crosshairBackgroundColor,
    Color? crosshairLabelColor,
    Color? crosshairLineColor,
    Color? legendBackgroundColor,
    Color? legendTextColor,
    Color? legendTitleColor,
    Color? majorGridLineColor,
    Color? majorTickLineColor,
    Color? minorGridLineColor,
    Color? minorTickLineColor,
    Color? plotAreaBackgroundColor,
    Color? plotAreaBorderColor,
    Color? selectionRectColor,
    Color? selectionRectBorderColor,
    Color? selectionTooltipConnectorLineColor,
    Color? titleBackgroundColor,
    Color? tooltipColor,
    Color? tooltipSeparatorColor,
    Color? tooltipLabelColor,
    Color? waterfallConnectorLineColor,
    TextStyle? titleTextStyle,
    TextStyle? axisTitleTextStyle,
    TextStyle? axisLabelTextStyle,
    TextStyle? axisMultiLevelLabelTextStyle,
    TextStyle? plotBandLabelTextStyle,
    TextStyle? legendTitleTextStyle,
    TextStyle? legendTextStyle,
    TextStyle? dataLabelTextStyle,
    TextStyle? tooltipTextStyle,
    TextStyle? trackballTextStyle,
    TextStyle? crosshairTextStyle,
    TextStyle? selectionZoomingTooltipTextStyle,
  }) {
    return SfChartThemeData.raw(
      brightness: brightness,
      axisLabelColor: axisLabelColor ?? this.axisLabelColor,
      axisLineColor: axisLineColor ?? this.axisLineColor,
      axisTitleColor: axisTitleColor ?? this.axisTitleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      crosshairBackgroundColor:
          crosshairBackgroundColor ?? this.crosshairBackgroundColor,
      crosshairLabelColor: crosshairLabelColor ?? this.crosshairLabelColor,
      crosshairLineColor: crosshairLineColor ?? this.crosshairLineColor,
      legendBackgroundColor:
          legendBackgroundColor ?? this.legendBackgroundColor,
      legendTextColor: legendTextColor ?? this.legendTextColor,
      legendTitleColor: legendTitleColor ?? this.legendTitleColor,
      majorGridLineColor: majorGridLineColor ?? this.majorGridLineColor,
      majorTickLineColor: majorTickLineColor ?? this.majorTickLineColor,
      minorGridLineColor: minorGridLineColor ?? this.minorGridLineColor,
      minorTickLineColor: minorTickLineColor ?? this.minorTickLineColor,
      plotAreaBackgroundColor:
          plotAreaBackgroundColor ?? this.plotAreaBackgroundColor,
      plotAreaBorderColor: plotAreaBorderColor ?? this.plotAreaBackgroundColor,
      selectionRectColor: selectionRectColor ?? this.selectionRectColor,
      selectionRectBorderColor:
          selectionRectBorderColor ?? this.selectionRectBorderColor,
      selectionTooltipConnectorLineColor:
          selectionTooltipConnectorLineColor ??
          this.selectionTooltipConnectorLineColor,
      titleBackgroundColor: titleBackgroundColor ?? this.titleBackgroundColor,
      tooltipColor: tooltipColor ?? this.tooltipColor,
      tooltipSeparatorColor:
          tooltipSeparatorColor ?? this.tooltipSeparatorColor,
      tooltipLabelColor: tooltipLabelColor ?? this.tooltipLabelColor,
      waterfallConnectorLineColor:
          waterfallConnectorLineColor ?? this.waterfallConnectorLineColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      axisTitleTextStyle: axisTitleTextStyle ?? this.axisTitleTextStyle,
      axisLabelTextStyle: axisLabelTextStyle ?? this.axisLabelTextStyle,
      axisMultiLevelLabelTextStyle:
          axisMultiLevelLabelTextStyle ?? this.axisMultiLevelLabelTextStyle,
      plotBandLabelTextStyle:
          plotBandLabelTextStyle ?? this.plotBandLabelTextStyle,
      legendTitleTextStyle: legendTitleTextStyle ?? this.legendTitleTextStyle,
      legendTextStyle: legendTextStyle ?? this.legendTextStyle,
      dataLabelTextStyle: dataLabelTextStyle ?? this.dataLabelTextStyle,
      tooltipTextStyle: tooltipTextStyle ?? this.tooltipTextStyle,
      trackballTextStyle: trackballTextStyle ?? this.trackballTextStyle,
      crosshairTextStyle: crosshairTextStyle ?? this.crosshairTextStyle,
      selectionZoomingTooltipTextStyle:
          selectionZoomingTooltipTextStyle ??
          this.selectionZoomingTooltipTextStyle,
    );
  }

  /// Linearly interpolate between two themes.
  static SfChartThemeData? lerp(
    SfChartThemeData? a,
    SfChartThemeData? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }
    return SfChartThemeData(
      axisLabelColor: Color.lerp(a!.axisLabelColor, b!.axisLabelColor, t),
      axisLineColor: Color.lerp(a.axisLineColor, b.axisLineColor, t),
      axisTitleColor: Color.lerp(a.axisTitleColor, b.axisTitleColor, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      titleTextColor: Color.lerp(a.titleTextColor, b.titleTextColor, t),
      crosshairBackgroundColor: Color.lerp(
        a.crosshairBackgroundColor,
        b.crosshairBackgroundColor,
        t,
      ),
      crosshairLabelColor: Color.lerp(
        a.crosshairLabelColor,
        b.crosshairLabelColor,
        t,
      ),
      crosshairLineColor: Color.lerp(
        a.crosshairLineColor,
        b.crosshairLineColor,
        t,
      ),
      legendBackgroundColor: Color.lerp(
        a.legendBackgroundColor,
        b.legendBackgroundColor,
        t,
      ),
      legendTextColor: Color.lerp(a.legendTextColor, b.legendTextColor, t),
      legendTitleColor: Color.lerp(a.legendTitleColor, b.legendTitleColor, t),
      majorGridLineColor: Color.lerp(
        a.majorGridLineColor,
        b.majorGridLineColor,
        t,
      ),
      majorTickLineColor: Color.lerp(
        a.majorTickLineColor,
        b.majorTickLineColor,
        t,
      ),
      minorGridLineColor: Color.lerp(
        a.minorGridLineColor,
        b.minorGridLineColor,
        t,
      ),
      minorTickLineColor: Color.lerp(
        a.minorTickLineColor,
        b.minorTickLineColor,
        t,
      ),
      plotAreaBackgroundColor: Color.lerp(
        a.plotAreaBackgroundColor,
        b.plotAreaBackgroundColor,
        t,
      ),
      plotAreaBorderColor: Color.lerp(
        a.plotAreaBorderColor,
        b.plotAreaBorderColor,
        t,
      ),
      selectionRectColor: Color.lerp(
        a.selectionRectColor,
        b.selectionRectColor,
        t,
      ),
      selectionRectBorderColor: Color.lerp(
        a.selectionRectBorderColor,
        b.selectionRectBorderColor,
        t,
      ),
      selectionTooltipConnectorLineColor: Color.lerp(
        a.selectionTooltipConnectorLineColor,
        b.selectionTooltipConnectorLineColor,
        t,
      ),
      titleBackgroundColor: Color.lerp(
        a.titleBackgroundColor,
        b.titleBackgroundColor,
        t,
      ),
      tooltipColor: Color.lerp(a.tooltipColor, b.tooltipColor, t),
      tooltipSeparatorColor: Color.lerp(
        a.tooltipSeparatorColor,
        b.tooltipSeparatorColor,
        t,
      ),
      tooltipLabelColor: Color.lerp(
        a.tooltipLabelColor,
        b.tooltipLabelColor,
        t,
      ),
      waterfallConnectorLineColor: Color.lerp(
        a.waterfallConnectorLineColor,
        b.waterfallConnectorLineColor,
        t,
      ),
      titleTextStyle: TextStyle.lerp(a.titleTextStyle, b.titleTextStyle, t),
      axisTitleTextStyle: TextStyle.lerp(
        a.axisTitleTextStyle,
        b.axisTitleTextStyle,
        t,
      ),
      axisLabelTextStyle: TextStyle.lerp(
        a.axisLabelTextStyle,
        b.axisLabelTextStyle,
        t,
      ),
      axisMultiLevelLabelTextStyle: TextStyle.lerp(
        a.axisMultiLevelLabelTextStyle,
        b.axisMultiLevelLabelTextStyle,
        t,
      ),
      plotBandLabelTextStyle: TextStyle.lerp(
        a.plotBandLabelTextStyle,
        b.plotBandLabelTextStyle,
        t,
      ),
      legendTitleTextStyle: TextStyle.lerp(
        a.legendTitleTextStyle,
        b.legendTitleTextStyle,
        t,
      ),
      legendTextStyle: TextStyle.lerp(a.legendTextStyle, b.legendTextStyle, t),
      dataLabelTextStyle: TextStyle.lerp(
        a.dataLabelTextStyle,
        b.dataLabelTextStyle,
        t,
      ),
      tooltipTextStyle: TextStyle.lerp(
        a.tooltipTextStyle,
        b.tooltipTextStyle,
        t,
      ),
      trackballTextStyle: TextStyle.lerp(
        a.trackballTextStyle,
        b.trackballTextStyle,
        t,
      ),
      crosshairTextStyle: TextStyle.lerp(
        a.crosshairTextStyle,
        b.crosshairTextStyle,
        t,
      ),
      selectionZoomingTooltipTextStyle: TextStyle.lerp(
        a.selectionZoomingTooltipTextStyle,
        b.selectionZoomingTooltipTextStyle,
        t,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is SfChartThemeData &&
        other.axisLabelColor == axisLabelColor &&
        other.axisLineColor == axisLineColor &&
        other.axisTitleColor == axisTitleColor &&
        other.backgroundColor == backgroundColor &&
        other.titleTextColor == titleTextColor &&
        other.crosshairBackgroundColor == crosshairBackgroundColor &&
        other.crosshairLabelColor == crosshairLabelColor &&
        other.crosshairLineColor == crosshairLineColor &&
        other.legendBackgroundColor == legendBackgroundColor &&
        other.legendTextColor == legendTextColor &&
        other.legendTitleColor == legendTitleColor &&
        other.majorGridLineColor == majorGridLineColor &&
        other.majorTickLineColor == majorTickLineColor &&
        other.minorGridLineColor == minorGridLineColor &&
        other.minorTickLineColor == minorTickLineColor &&
        other.plotAreaBackgroundColor == plotAreaBackgroundColor &&
        other.plotAreaBorderColor == plotAreaBorderColor &&
        other.selectionRectColor == selectionRectColor &&
        other.selectionRectBorderColor == selectionRectBorderColor &&
        other.selectionTooltipConnectorLineColor ==
            selectionTooltipConnectorLineColor &&
        other.titleBackgroundColor == titleBackgroundColor &&
        other.tooltipColor == tooltipColor &&
        other.tooltipSeparatorColor == tooltipSeparatorColor &&
        other.tooltipLabelColor == tooltipLabelColor &&
        other.waterfallConnectorLineColor == waterfallConnectorLineColor &&
        other.titleTextStyle == titleTextStyle &&
        other.axisTitleTextStyle == axisTitleTextStyle &&
        other.axisLabelTextStyle == axisLabelTextStyle &&
        other.axisMultiLevelLabelTextStyle == axisMultiLevelLabelTextStyle &&
        other.plotBandLabelTextStyle == plotBandLabelTextStyle &&
        other.legendTitleTextStyle == legendTitleTextStyle &&
        other.legendTextStyle == legendTextStyle &&
        other.dataLabelTextStyle == dataLabelTextStyle &&
        other.tooltipTextStyle == tooltipTextStyle &&
        other.trackballTextStyle == trackballTextStyle &&
        other.crosshairTextStyle == crosshairTextStyle &&
        other.selectionZoomingTooltipTextStyle ==
            selectionZoomingTooltipTextStyle;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      axisLabelColor,
      axisLineColor,
      axisTitleColor,
      backgroundColor,
      titleTextColor,
      crosshairBackgroundColor,
      crosshairLabelColor,
      crosshairLineColor,
      legendBackgroundColor,
      legendTextColor,
      legendTitleColor,
      majorGridLineColor,
      majorTickLineColor,
      minorGridLineColor,
      minorTickLineColor,
      plotAreaBackgroundColor,
      plotAreaBorderColor,
      selectionRectColor,
      selectionRectBorderColor,
      selectionTooltipConnectorLineColor,
      titleBackgroundColor,
      tooltipColor,
      tooltipSeparatorColor,
      tooltipLabelColor,
      waterfallConnectorLineColor,
      titleTextStyle,
      axisTitleTextStyle,
      axisLabelTextStyle,
      axisMultiLevelLabelTextStyle,
      plotBandLabelTextStyle,
      legendTitleTextStyle,
      legendTextStyle,
      dataLabelTextStyle,
      tooltipTextStyle,
      trackballTextStyle,
      crosshairTextStyle,
      selectionZoomingTooltipTextStyle,
    ];
    return Object.hashAll(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    const SfChartThemeData defaultData = SfChartThemeData();
    properties.add(
      ColorProperty(
        'axisLabelColor',
        axisLabelColor,
        defaultValue: defaultData.axisLabelColor,
      ),
    );
    properties.add(
      ColorProperty(
        'axisLineColor',
        axisLineColor,
        defaultValue: defaultData.axisLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'axisTitleColor',
        axisTitleColor,
        defaultValue: defaultData.axisTitleColor,
      ),
    );
    properties.add(
      ColorProperty(
        'backgroundColor',
        backgroundColor,
        defaultValue: defaultData.backgroundColor,
      ),
    );
    properties.add(
      ColorProperty(
        'titleTextColor',
        titleTextColor,
        defaultValue: defaultData.titleTextColor,
      ),
    );
    properties.add(
      ColorProperty(
        'crosshairBackgroundColor',
        crosshairBackgroundColor,
        defaultValue: defaultData.crosshairBackgroundColor,
      ),
    );
    properties.add(
      ColorProperty(
        'crosshairLabelColor',
        crosshairLabelColor,
        defaultValue: defaultData.crosshairLabelColor,
      ),
    );
    properties.add(
      ColorProperty(
        'crosshairLineColor',
        crosshairLineColor,
        defaultValue: defaultData.crosshairLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'legendBackgroundColor',
        legendBackgroundColor,
        defaultValue: defaultData.legendBackgroundColor,
      ),
    );
    properties.add(
      ColorProperty(
        'legendTextColor',
        legendTextColor,
        defaultValue: defaultData.legendTextColor,
      ),
    );
    properties.add(
      ColorProperty(
        'legendTitleColor',
        legendTitleColor,
        defaultValue: defaultData.legendTitleColor,
      ),
    );
    properties.add(
      ColorProperty(
        'majorGridLineColor',
        majorGridLineColor,
        defaultValue: defaultData.majorGridLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'majorTickLineColor',
        majorTickLineColor,
        defaultValue: defaultData.majorTickLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'minorGridLineColor',
        minorGridLineColor,
        defaultValue: defaultData.minorGridLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'minorTickLineColor',
        minorTickLineColor,
        defaultValue: defaultData.minorTickLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'plotAreaBackgroundColor',
        plotAreaBackgroundColor,
        defaultValue: defaultData.plotAreaBackgroundColor,
      ),
    );
    properties.add(
      ColorProperty(
        'plotAreaBorderColor',
        plotAreaBorderColor,
        defaultValue: defaultData.plotAreaBorderColor,
      ),
    );
    properties.add(
      ColorProperty(
        'selectionRectColor',
        selectionRectColor,
        defaultValue: defaultData.selectionRectColor,
      ),
    );
    properties.add(
      ColorProperty(
        'selectionRectBorderColor',
        selectionRectBorderColor,
        defaultValue: defaultData.selectionRectBorderColor,
      ),
    );
    properties.add(
      ColorProperty(
        'selectionTooltipConnectorLineColor',
        selectionTooltipConnectorLineColor,
        defaultValue: defaultData.selectionTooltipConnectorLineColor,
      ),
    );
    properties.add(
      ColorProperty(
        'titleBackgroundColor',
        titleBackgroundColor,
        defaultValue: defaultData.titleBackgroundColor,
      ),
    );
    properties.add(
      ColorProperty(
        'tooltipColor',
        tooltipColor,
        defaultValue: defaultData.tooltipColor,
      ),
    );
    properties.add(
      ColorProperty(
        'tooltipSeparatorColor',
        tooltipSeparatorColor,
        defaultValue: defaultData.tooltipSeparatorColor,
      ),
    );
    properties.add(
      ColorProperty(
        'tooltipLabelColor',
        tooltipLabelColor,
        defaultValue: defaultData.tooltipLabelColor,
      ),
    );
    properties.add(
      ColorProperty(
        'waterfallConnectorLineColor',
        waterfallConnectorLineColor,
        defaultValue: defaultData.waterfallConnectorLineColor,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'titleTextStyle',
        titleTextStyle,
        defaultValue: defaultData.titleTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'axisTitleTextStyle',
        axisTitleTextStyle,
        defaultValue: defaultData.axisTitleTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'axisLabelTextStyle',
        axisLabelTextStyle,
        defaultValue: defaultData.axisLabelTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'axisMultiLevelLabelTextStyle',
        axisMultiLevelLabelTextStyle,
        defaultValue: defaultData.axisMultiLevelLabelTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'plotBandLabelTextStyle',
        plotBandLabelTextStyle,
        defaultValue: defaultData.plotBandLabelTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'legendTitleTextStyle',
        legendTitleTextStyle,
        defaultValue: defaultData.legendTitleTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'legendTextStyle',
        legendTextStyle,
        defaultValue: defaultData.legendTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'dataLabelTextStyle',
        dataLabelTextStyle,
        defaultValue: defaultData.dataLabelTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'tooltipTextStyle',
        tooltipTextStyle,
        defaultValue: defaultData.tooltipTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'trackballTextStyle',
        trackballTextStyle,
        defaultValue: defaultData.trackballTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'crosshairTextStyle',
        crosshairTextStyle,
        defaultValue: defaultData.crosshairTextStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'selectionZoomingTooltipTextStyle',
        selectionZoomingTooltipTextStyle,
        defaultValue: defaultData.selectionZoomingTooltipTextStyle,
      ),
    );
  }
}
