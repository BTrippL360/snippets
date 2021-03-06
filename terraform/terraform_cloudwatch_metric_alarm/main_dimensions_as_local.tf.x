locals {
  dimensions = {
    BucketName  = "colinjohnson-billing"
    StorageType = "AllStorageTypes"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_cloudwatch_metric_alarm" "test_cloudwatch_metric_alarm" {
  alarm_name          = "test-cloudwatch-metric-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "NumberOfObjects"
  namespace           = "AWS/S3"
  period              = 1440
  statistic           = "Maximum"
  threshold           = 100

  # dimensions {
  #   BucketName  = "colinjohnson-billing"
  #   StorageType = "AllStorageTypes"
  # }
  dimensions = "${local.dimensions}"
}
