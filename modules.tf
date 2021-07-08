resource "local_file" "index_file" {
  content  = "<h1> Hello </h1>"
  filename = "./index.html"
}

resource "local_file" "error_404" {
  content  = "<h1> 404 big error </h1>"
  filename = "./error.html"
}

module "s3_bucket" {
  source = "./modules/s3"

  depends_on = [local_file.error_404, local_file.index_file]
}
