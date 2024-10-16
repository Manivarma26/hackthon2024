terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      version = "3.46.0"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
}

