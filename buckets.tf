
# Read the local file
data "local_file" "my_bucket_names" {
  filename = "${path.module}/my_bucket_names.txt"
}


# Create the Space Storage Bucket 
# Split file into individual names
locals {
  bucket_names = toset(split("\n", trimspace(data.local_file.my_bucket_names.content)))
}

# Create a bucket for each name
resource "digitalocean_spaces_bucket" "main" {
  for_each = local.bucket_names

 name   = each.value
  region = "sfo3"
}

