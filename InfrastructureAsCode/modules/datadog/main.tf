resource "datadog_dashboard" "iot_dashboard" {
  title        = "IoT Dashboard"
  description  = "Dashboard for monitoring IoT metrics"
  layout_type  = "free"

  widget {
    alert_graph_definition {
      alert_id  = "895605"
      viz_type  = "timeseries"
      title     = "Widget Title"
      live_span = "1h"
    }
  }

  // Add more widgets as needed
}
