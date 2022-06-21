resource "aws_route_table_association" "app_route_association" {
  subnet_id = aws_subnet.my_app-subnet.id
  route_table_id = aws_route_table.my_route-table.id
} 
