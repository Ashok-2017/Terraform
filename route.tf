resource "aws_route_table" "my_route_table" {
  tags = {
     Name = "MY_route-table"
  }
  vpc_id = aws_vpc.my_vpc.id
}  
