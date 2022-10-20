resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.ENV}-igw"
  }
}


# Creates Elastic IP for the NGW
resource "aws_eip" "ngw-eip" {
  vpc      = true
}

# Nat gateway needs eip
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = aws_subnet.public.*.id[0]  # Attaches to the pubnet 1

  tags = {
    Name = "${var.ENV}-ngw"
  }

# NGW Will be creaeted only after the creation of IGW
  depends_on = [aws_internet_gateway.igw]  
}