# signalfx_time_chart.sfx_aws_ebs_dash_1_0:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_0" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Ops/Min"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean().publish(label='A')
        B = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean().publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 3600
  unit_prefix        = "Metric"

  axis_left {
    label     = "writes - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "reads - RED"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "VolumeWriteOps"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "VolumeReadOps"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Bytes/Min"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('VolumeWriteBytes', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean().publish(label='A')
        B = data('VolumeReadBytes', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean().publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 3600
  unit_prefix        = "Binary"

  axis_left {
    label     = "writes - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "reads - RED"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "VolumeWriteBytes"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "VolumeReadBytes"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Latency/Op (ms)"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).publish(label='A')
        B = data('VolumeTotalWriteTime', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).publish(label='B', enable=False)
        C = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).publish(label='C')
        D = data('VolumeTotalReadTime', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).publish(label='D', enable=False)
        E = (B/A).scale(1000).publish(label='E')
        F = (D/C).scale(1000).publish(label='F')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "ms/write - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "ms/read - RED"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeReadOps - Scale:60"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeTotalReadTime - Scale:60"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeTotalWriteTime - Scale:60"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeWriteOps - Scale:60"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "millisec/write"
    label        = "E"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "millisec/read"
    label        = "F"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_3:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Write Ops 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "change %"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1d"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeWriteOps - Scale:60 - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "24h change %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Write Bytes 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeWriteBytes', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "change %"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1d"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeWriteBytes - Scale:60 - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "24h change %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_5:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_5" {
  axes_include_zero  = false
  axes_precision     = 4
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Avg Queue Length"
  plot_type          = "AreaChart"
  program_text       = "A = data('VolumeQueueLength', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeQueueLength"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read Ops 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "change %"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1d"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeReadOps - Scale:60 - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "24h change %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_7:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read Bytes 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeReadBytes', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), extrapolation='zero', rollup='rate').scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "change %"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1d"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "VolumeReadBytes - Scale:60 - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "24h change %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_1_8:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_1_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Idle Time/Min (sec)"
  plot_type          = "AreaChart"
  program_text       = "A = data('VolumeIdleTime', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'sum'), rollup='rate', extrapolation='last_value', maxExtrapolations=5).scale(60).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 3600
  unit_prefix        = "Metric"

  axis_left {
    label     = "seconds"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeIdleTime - Scale:60"
    label        = "A"
  }
}
# signalfx_text_chart.sfx_aws_ebs_dash_1_9:
resource "signalfx_text_chart" "sfx_aws_ebs_dash_1_9" {
  markdown = <<-EOF
        Empty charts indicate no activity of that category (e.g. Reads or Writes)

        Docs for [EBS CloudWatch metrics](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/ebs-metricscollected.html)
    EOF
  name     = "Notes"
}
# signalfx_single_value_chart.sfx_aws_ebs_dash_1_10:
resource "signalfx_single_value_chart" "sfx_aws_ebs_dash_1_10" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "Avg Bytes/Write Op"
  program_text            = <<-EOF
        A = data('VolumeWriteBytes', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'mean'), extrapolation='zero').mean(by=['VolumeId']).mean(over='1h').publish(label='A')
        B = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'mean'), extrapolation='zero').mean(by=['VolumeId']).mean(over='1h').publish(label='B', enable=False)
        C = (A/B).publish(label='C', enable=False)
    EOF
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "VolumeWriteBytes - Mean by VolumeId - Mean(1h)"
    label        = "A"
  }
  viz_options {
    display_name = "VolumeWriteOps - Mean by VolumeId - Mean(1h)"
    label        = "B"
  }
  viz_options {
    color        = "blue"
    display_name = "bytes"
    label        = "C"
  }
}
# signalfx_single_value_chart.sfx_aws_ebs_dash_1_11:
resource "signalfx_single_value_chart" "sfx_aws_ebs_dash_1_11" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "Avg Bytes/Read Op"
  program_text            = <<-EOF
        A = data('VolumeReadBytes', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'mean'), extrapolation='zero').mean(by=['VolumeId']).mean(over='1h').publish(label='A')
        B = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('VolumeId', 'vol-46dcc55f') and filter('stat', 'mean'), extrapolation='zero').mean(by=['VolumeId']).mean(over='1h').publish(label='B', enable=False)
        C = (A/B).publish(label='C', enable=False)
    EOF
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "VolumeReadBytes - Mean by VolumeId - Mean(1h)"
    label        = "A"
  }
  viz_options {
    display_name = "VolumeReadOps - Mean by VolumeId - Mean(1h)"
    label        = "B"
  }
  viz_options {
    color        = "brown"
    display_name = "bytes"
    label        = "C"
  }
}
# signalfx_dashboard.sfx_aws_ebs_dash_1:
resource "signalfx_dashboard" "sfx_aws_ebs_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_ebs.id
  discovery_options_query = "namespace:\"AWS/EBS\" AND _exists_:VolumeId"
  discovery_options_selectors = [
    "_exists_:VolumeId",
  ]
  name = "EBS Volume"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ebs_dash_1_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ebs_dash_1_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_text_chart.sfx_aws_ebs_dash_1_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }

  variable {
    alias                  = "volume"
    apply_if_exist         = false
    description            = "EBS volume"
    property               = "VolumeId"
    replace_only           = false
    restricted_suggestions = false
    value_required         = true
    values = [
      "Choose volume",
    ]
    values_suggested = []
  }
}
