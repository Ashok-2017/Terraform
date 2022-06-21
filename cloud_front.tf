resource "aws_cloudfront_distribution" "terra-cloudfrotnt1" {
  depends_on = [ aws_s3_bucket_object.Object1]
  origin {
    domain_name = omain_name = aws_s3_bucket.specialbucket12345.bucket_regional_domain_name
        origin_id = local.s3_origin_id
    }   
  enabled = true
    default_cache_behaviour {
      allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = local.s3_origin_id
      
      forwarded_values {
        query_string = false
        
        cookies {
         forward = "none"
        }
   }
   viewer_protocol_policy = "allow-all"
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }

    restrictions {
        geo_restriction {
           restriction_type = "none"
        }
    }

     viewer_certificate {
        cloudfront_default_certificate = true

    } 
}
