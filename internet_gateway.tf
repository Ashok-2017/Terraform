resource "aws_internet_gateway" "my_ig" {
  tags = {
     name = "MY_IGW" 
  }
  vpc_id = aws_vpc.my_vpc.id
  depends_on = [aws_vpc.my_vpc]
}	
