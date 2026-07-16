locals {
  image_tag = trimspace(file("${path.module}/../VERSION"))
}