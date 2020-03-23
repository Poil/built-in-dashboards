# signalfx_single_value_chart.sfx_aws_opsworks_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_opsworks_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "CPU %"
  program_text            = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='A', enable=False)
        B = (100-A).publish(label='B')
    EOF
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_opsworks_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_1_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU % by Category"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='A')
        B = data('cpu_nice', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='B')
        C = data('cpu_waitio', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='C')
        D = data('cpu_user', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='D')
        E = data('cpu_system', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='E')
        F = data('cpu_steal', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='F')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "%"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "cpu_nice"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "cpu_steal"
    label        = "F"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "cpu_idle"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "cpu_system"
    label        = "E"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "cpu_user"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "cpu_waitio"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_1_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU % 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).publish(label='A', enable=False)
        B = (100-A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
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
    axis  = "left"
    label = "A"
  }
  viz_options {
    axis  = "left"
    label = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "24h change %"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    display_name = "B - Timeshift 1d"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_1_3:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_1_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Memory"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('memory_free', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean'), extrapolation='zero').scale(1024).publish(label='A')
        B = data('memory_used', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean')).scale(1024).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "memory_used - Scale:1024"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "memory_free - Scale:1024"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_1_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Load"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('load_1', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean'), extrapolation='zero').publish(label='A')
        B = data('load_5', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean'), extrapolation='zero').publish(label='B')
        C = data('load_15', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean'), extrapolation='zero').publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "load"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "load_1"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "load_15"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "load_5"
    label        = "B"
  }
}
# signalfx_single_value_chart.sfx_aws_opsworks_dash_1_5:
resource "signalfx_single_value_chart" "sfx_aws_opsworks_dash_1_5" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 4
  name                    = "# Processes"
  program_text            = "A = data('procs', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'upper'), extrapolation='zero').publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_opsworks_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_1_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Processes"
  plot_type          = "AreaChart"
  program_text       = "A = data('procs', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'upper'), extrapolation='zero').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "processes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "# procs"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_1_7:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_1_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Processes 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('procs', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'upper'), extrapolation='zero').mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "% change"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "# procs"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "24h Change %"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1d"
    label        = "B"
  }
}
# signalfx_dashboard.sfx_aws_opsworks_dash_1:
resource "signalfx_dashboard" "sfx_aws_opsworks_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_opsworks.id
  description             = "Default dashboard."
  discovery_options_query = "namespace:\"AWS/OpsWorks\""
  discovery_options_selectors = [
    "_exists_:InstanceId",
    "_exists_:LayerId",
    "_exists_:StackId",
  ]
  name = "OpsWorks"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_1_4.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_opsworks_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_opsworks_dash_1_5.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_1_7.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_1_6.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
}
