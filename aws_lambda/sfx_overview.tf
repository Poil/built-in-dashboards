# signalfx_single_value_chart.sfx_aws_lambda_dash_3_0:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_3_0" {
  color_by                = "Dimension"
  description             = "sum over 1m"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Active Functions"
  program_text            = "A = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "function.invocations - Sum(1m) - Sum by aws_function_name - Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_3_1:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_3_1" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  disable_sampling          = false
  name                      = "Active Functions by AWS AccountID"
  on_chart_legend_dimension = "aws_account_id"
  plot_type                 = "AreaChart"
  program_text              = "A = data('function.invocations', rollup='sum').sum(by=['aws_account_id']).count(by=['aws_account_id']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 3600
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_account_id"
  }

  viz_options {
    axis         = "left"
    display_name = "Active Function Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_3_2:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_3_2" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Active Functions by Region"
  plot_type         = "AreaChart"
  program_text      = "A = data('function.duration', rollup='sum').sum(by=['aws_region', 'aws_function_name']).count(by=['aws_region']).publish(label='A')"
  show_data_markers = false
  show_event_lines  = false
  stacked           = true
  time_range        = 3600
  timezone          = "UTC"
  unit_prefix       = "Metric"

  legend_options_fields {
    enabled  = true
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }

  viz_options {
    axis         = "left"
    display_name = "function.duration - Sum by aws_region,aws_function_name - Count by aws_region"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_3_3:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_3_3" {
  color_by                = "Dimension"
  description             = "sum over 1m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Invocations"
  program_text            = "A = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "green"
    display_name = "Invocations"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_3_4:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_3_4" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of times a function is invoked in response to an event or invocation API call."
  disable_sampling          = false
  name                      = "Invocations"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = <<-EOF
        A = data('function.invocations', rollup='sum').sum().publish(label='A')
        B = data('function.errors', rollup='sum').sum().publish(label='B')
        C = data('function.cold_starts', rollup='sum').sum().publish(label='C')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "Errors"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "Total Invocations"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "lilac"
    display_name = "Cold Starts"
    label        = "C"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_3_5:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_3_5" {
  color_by                = "Dimension"
  max_precision           = 4
  name                    = "Invocations by Function"
  program_text            = "A = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = false
    property = "lambda_arn"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_account_id"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }

  viz_options {
    display_name = "Invocations"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_3_6:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_3_6" {
  color_by                = "Dimension"
  description             = "sum over 1m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Invocation Errors"
  program_text            = "A = data('function.errors', rollup='sum', extrapolation='zero').sum(over='1m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "brown"
    display_name = "Errors"
    label        = "A"
  }
}
# signalfx_heatmap_chart.sfx_aws_lambda_dash_3_7:
resource "signalfx_heatmap_chart" "sfx_aws_lambda_dash_3_7" {
  description    = "% of Invocations erred (1m)"
  group_by       = []
  hide_timestamp = false
  name           = "Error Heatmap"
  program_text   = <<-EOF
        A = data('function.errors', rollup='sum', extrapolation='last_value', maxExtrapolations=2).sum(over='1m').publish(label='A', enable=False)
        B = data('function.invocations', rollup='sum', extrapolation='last_value', maxExtrapolations=2).sum(over='1m').publish(label='B', enable=False)
        C = (A/B).scale(100).publish(label='C')
    EOF
  unit_prefix    = "Metric"

  color_scale {
    color = "green"
    gt    = 340282346638528860000000000000000000000
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 0
  }
  color_scale {
    color = "red"
    gt    = 20
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 340282346638528860000000000000000000000
  }
  color_scale {
    color = "vivid_yellow"
    gt    = 0
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 5
  }
  color_scale {
    color = "yellow"
    gt    = 5
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 20
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_3_8:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_3_8" {
  color_by                = "Dimension"
  description             = "over 1m"
  max_precision           = 0
  name                    = "% of total errors by function"
  program_text            = <<-EOF
        A = data('function.errors', rollup='sum', extrapolation='zero').sum(over='1m').sum().publish(label='A', enable=False)
        B = data('function.errors', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='B', enable=False)
        C = (B/A).scale(100).publish(label='C')
    EOF
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_execution_env"
  }
  legend_options_fields {
    enabled  = true
    property = "function_wrapper_version"
  }
  legend_options_fields {
    enabled  = true
    property = "lambda_arn"
  }
  legend_options_fields {
    enabled  = true
    property = "metric_source"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_account_id"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_tag_service"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_qualifier"
  }

  viz_options {
    display_name = "B/A - Scale:100"
    label        = "C"
  }
  viz_options {
    display_name = "Total Errors"
    label        = "A"
  }
  viz_options {
    display_name = "function.errors - Sum(1m) - Sum by aws_function_name"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_3_9:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_3_9" {
  color_by                = "Dimension"
  description             = "over 1m"
  max_precision           = 0
  name                    = "Total Errors by Function"
  program_text            = "A = data('function.errors', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }

  viz_options {
    display_name = "function.errors - Sum(1m) - Sum by aws_function_name"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_3_10:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_3_10" {
  color_by                = "Dimension"
  description             = "mean over 1m (ms)"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Average Duration"
  program_text            = <<-EOF
        A = data('function.duration', rollup='sum', extrapolation='zero').sum(over='1m').sum().publish(label='A', enable=False)
        B = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1m').sum().publish(label='B', enable=False)
        C = (A/B).publish(label='C')
    EOF
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Average Duration"
    label        = "C"
  }
  viz_options {
    display_name = "function.duration - Sum(1m) - Sum"
    label        = "A"
  }
  viz_options {
    display_name = "function.invocations - Sum(1m) - Sum"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_3_11:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_3_11" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "percentile distribution"
  disable_sampling  = false
  name              = "Invocation Duration"
  plot_type         = "AreaChart"
  program_text      = <<-EOF
        A = data('function.duration', rollup='average').mean(by=['aws_function_name']).publish(label='A', enable=False)
        B = (A).max().publish(label='B')
        C = (A).min().publish(label='C')
        D = (A).percentile(pct=10).publish(label='D')
        E = (A).percentile(pct=50).publish(label='E')
        F = (A).percentile(pct=90).publish(label='F')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 3600
  timezone          = "UTC"
  unit_prefix       = "Metric"

  axis_left {
    label = "ms"
  }

  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }

  viz_options {
    axis         = "left"
    display_name = "Maximum"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "Minimum"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "P10"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    display_name = "P50"
    label        = "E"
  }
  viz_options {
    axis         = "left"
    display_name = "P90"
    label        = "F"
  }
  viz_options {
    axis         = "left"
    display_name = "function.duration - Mean by aws_function_name"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_3_12:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_3_12" {
  color_by                = "Dimension"
  description             = "mean over 1m (ms)"
  max_precision           = 4
  name                    = "Longest Average Durations"
  program_text            = <<-EOF
        A = data('function.duration', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='A', enable=False)
        B = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='B', enable=False)
        C = (A/B).top(count=10).publish(label='C')
    EOF
  refresh_interval        = 300
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }
  legend_options_fields {
    enabled  = true
    property = "lambda_arn"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_account_id"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_version"
  }

  viz_options {
    display_name = "A/B - Top 10"
    label        = "C"
  }
  viz_options {
    display_name = "Average Duration (ms)"
    label        = "A"
  }
  viz_options {
    display_name = "function.invocations - Sum(1m) - Sum by aws_function_name"
    label        = "B"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_3_13:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_3_13" {
  color_by                = "Dimension"
  description             = "sum over 1m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Cold Starts"
  program_text            = "A = data('function.cold_starts', rollup='sum', extrapolation='zero').sum(over='1m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "lilac"
    display_name = "Invocations"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_3_14:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_3_14" {
  color_by                = "Dimension"
  description             = "% of total invocations over 1m"
  max_precision           = 4
  name                    = "Cold Start % of Invocations by Function"
  program_text            = <<-EOF
        A = data('function.cold_starts', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='A', enable=False)
        B = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1m').sum(by=['aws_function_name']).publish(label='B', enable=False)
        C = (A/B).scale(100).publish(label='C')
    EOF
  refresh_interval        = 300
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "lambda_arn"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_account_id"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_execution_env"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_qualifier"
  }
  legend_options_fields {
    enabled  = false
    property = "function_wrapper_version"
  }
  legend_options_fields {
    enabled  = false
    property = "metric_source"
  }

  viz_options {
    display_name = "% Cold Starts"
    label        = "C"
  }
  viz_options {
    display_name = "function.cold_starts - Sum(1m) - Sum by aws_function_name"
    label        = "A"
  }
  viz_options {
    display_name = "function.invocations - Sum(1m) - Sum by aws_function_name"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_3_15:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_3_15" {
  color_by                = "Dimension"
  max_precision           = 0
  name                    = "Duration 1d % change for slowest 5"
  program_text            = <<-EOF
        A = data('function.duration', rollup='sum', extrapolation='zero').sum(over='1d').sum(by=['aws_function_name']).publish(label='A', enable=False)
        B = data('function.invocations', rollup='sum', extrapolation='zero').sum(over='1d').sum(by=['aws_function_name']).publish(label='B', enable=False)
        C = (A/B).top(by=['aws_function_name'], count=5).publish(label='C', enable=False)
        D = (C).timeshift('1d').publish(label='D', enable=False)
        E = (C/D - 1).scale(100).publish(label='E')
    EOF
  secondary_visualization = "None"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "lambda_arn"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_account_id"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_name"
  }

  viz_options {
    display_name = "1d Duration"
    label        = "A"
  }
  viz_options {
    display_name = "1d Invocations"
    label        = "B"
  }
  viz_options {
    display_name = "Duration 1d % change"
    label        = "E"
  }
  viz_options {
    display_name = "Slowest 5 Average Duration"
    label        = "C"
  }
  viz_options {
    display_name = "Timeshift 1d"
    label        = "D"
  }
}
# signalfx_dashboard.sfx_aws_lambda_dash_3:
resource "signalfx_dashboard" "sfx_aws_lambda_dash_3" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_lambda.id
  discovery_options_query = "metric_source:\"lambda_wrapper\""
  discovery_options_selectors = [
    "metric_source:lambda_wrapper",
  ]
  name = "Lambda (SignalFx) Overview"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_3_1.id
    column   = 3
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_3_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_3_10.id
    column   = 0
    height   = 1
    row      = 4
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_3_14.id
    column   = 3
    height   = 1
    row      = 5
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_3_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_3_12.id
    column   = 9
    height   = 2
    row      = 4
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_3_8.id
    column   = 9
    height   = 2
    row      = 2
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_3_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_3_4.id
    column   = 3
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_3_15.id
    column   = 6
    height   = 1
    row      = 5
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_3_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_3_11.id
    column   = 3
    height   = 1
    row      = 4
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_3_5.id
    column   = 9
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_heatmap_chart.sfx_aws_lambda_dash_3_7.id
    column   = 3
    height   = 2
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_3_13.id
    column   = 0
    height   = 1
    row      = 5
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_3_2.id
    column   = 9
    height   = 1
    row      = 0
    width    = 3
  }

  variable {
    alias                  = "AWS Account ID"
    apply_if_exist         = false
    description            = "null"
    property               = "aws_account_id"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
