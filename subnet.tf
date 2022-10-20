# Publuc
resource "aws_subnet" "public" {
  count                   = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.PUBLIC_SUBNET_CIDR, count.index)
  availability_zone       = element(var.AZ, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ENV}-pub-subnet-${element(var.AZ, count.index)}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.PRIVATE_SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index)

  tags = {
    Name = "${var.ENV}-prv-subnet-${element(var.AZ, count.index)}"
  }
}




#### The number of subnets to be created will be based on the numbers of SUBNET_CIDR's that we provide in the env.tfvars

# my logic to solve the above challene is 
# 1) Count the length of the variable and based on the length , run a loop.
# 2) How to run the loop then : In tf, we have something called as COUNT.

# Count, always works work with cound.index ( value of the particular iteration )
# count.index is the iteration number
# element retrieves a single element from a list