data "null_data_source" "null_data_source_override_instance_types" {
  count = "${length(var.override_instance_types)}"

  inputs = "${map(
    "instance_type", trimspace(element(var.override_instance_types, count.index))
  )}"
}

data "null_data_source" "null_data_source_asg_tags" {
  count  = "${length("${keys(var.tags)}")}"
  inputs = "${map(
    "key", "${element("${keys(var.tags)}", count.index)}",
    "value", "${element("${values(var.tags)}", count.index)}",
    "propagate_at_launch", true
  )}"
}