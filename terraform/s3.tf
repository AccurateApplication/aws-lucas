resource "aws_s3_bucket" "bkt" {
  bucket = var.pub_s3_name
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "${var.pub_s3_name}"
    test        = "true"
    description = "Used to display static html files"
  }
}

resource "local_file" "html_file" {
  content  = "<h1> Hello </h1>"
  filename = "./index.html"
}

resource "local_file" "error_404" {
  content  = "<h1> 404 big error </h1>"
  filename = "./error.html"
}

resource "aws_s3_bucket_object" "object1" {
  bucket = aws_s3_bucket.bkt.id
  key    = "index.html"
  acl    = "public-read"
  source = "index.html"
  etag   = filemd5("index.html")
}

resource "aws_s3_bucket_object" "object2" {
  bucket = aws_s3_bucket.bkt.id
  key    = "error.html"
  acl    = "public-read"
  source = "error.html"
  etag   = filemd5("error.html")

}
