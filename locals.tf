locals {
  instance_types  = ["${data.null_data_source.null_data_source_override_instance_types.*.outputs}"]
}