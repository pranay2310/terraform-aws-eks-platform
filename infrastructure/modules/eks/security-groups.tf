resource "aws_security_group" "cluster" {

  name = "${var.cluster_name}-cluster-sg"

  description = "EKS Cluster Security Group"

  vpc_id = var.vpc_id

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(

    var.tags,

    {

      Name = "${var.cluster_name}-cluster-sg"

    }

  )
}

resource "aws_security_group" "node" {

  name = "${var.cluster_name}-node-sg"

  description = "EKS Worker Node Security Group"

  vpc_id = var.vpc_id

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(

    var.tags,

    {

      Name = "${var.cluster_name}-node-sg"

    }

  )
}

#####Cluster → Node communication ##############

resource "aws_security_group_rule" "cluster_to_node" {

  type = "ingress"

  from_port = 443

  to_port = 443

  protocol = "tcp"

  security_group_id = aws_security_group.node.id

  source_security_group_id = aws_security_group.cluster.id
}

######## Node → Node ###############

resource "aws_security_group_rule" "node_to_node" {

  type = "ingress"

  from_port = 0

  to_port = 65535

  protocol = "-1"

  security_group_id = aws_security_group.node.id

  source_security_group_id = aws_security_group.node.id
}

############# Node → Cluster ############

resource "aws_security_group_rule" "node_to_cluster" {

  type = "ingress"

  from_port = 443

  to_port = 443

  protocol = "tcp"

  security_group_id = aws_security_group.cluster.id

  source_security_group_id = aws_security_group.node.id
}