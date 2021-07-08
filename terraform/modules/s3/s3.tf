resource "aws_s3_bucket" "bkt" {
  bucket = var.pub_s3_name
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "${var.pub_s3_name}"
    Test        = "true"
    Description = "Used to display static html files"
  }
}

resource "aws_s3_bucket_object" "object1" {
  bucket = aws_s3_bucket.bkt.id
  key    = "index.html"
  acl    = "public-read"
  source = "index.html"
  # etag   = filemd5("index.html")
}

resource "aws_s3_bucket_object" "object2" {
  bucket = aws_s3_bucket.bkt.id
  key    = "error.html"
  acl    = "public-read"
  source = "error.html"
  # etag   = filemd5("error.html")
}


resource "aws_s3_bucket" "log_bkt" {
  bucket = var.priv_s3_name
  acl    = "private"

  tags = {
    Name        = "${var.priv_s3_name}"
    Test        = "true"
    Description = "Bucket which will receive logs"
  }
}
