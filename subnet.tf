resource "aws_subnet" "my-app-subnet" {
   tags = {
       Name = "APP_Subnet"
   }
   vpc_id = aws_vpc.my_vpc.id
   cidr_block = "10.0.1.0/24"
   map_public_ip_on_launch = true
   depends_on = [aws_vpc.my_vpc]
} 
