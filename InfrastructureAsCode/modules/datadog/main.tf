resource "datadog_dashboard" "iot_dashboard" {
  title        = "IoT Dashboard"
  description  = "Dashboard for monitoring IoT metrics"
  layout_type  = "ordered"

  widget {
    title = "IoT Data Over Time"
    timeseries {
      requests {
        query = "avg:aws.iot.messages {*}"
      }
    }
  }

  // Add more widgets as needed
}
