resource "aws_iam_role" "master" {
  name = "satish-eks-master"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-master-role"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_role" "worker" {
  name = "satish-eks-worker"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-worker-role"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_policy" "autoscaler" {
  name = "satish-eks-autoscaler-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeTags",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-autoscaler-policy"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_instance_profile" "worker" {
  depends_on = [aws_iam_role.worker]
  name       = "satish-eks-worker-profile"
  role       = aws_iam_role.worker.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-worker-profile"
    Environment = var.environment
    Project     = var.project_name
  }
}


# jump_host iam_policy

resource "aws_iam_role" "jump_host_role" {
  name               = var.iam_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-jump-role"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.jump_host_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" 
}

resource "aws_iam_instance_profile" "jump_host_profile" {
  name = "${var.project_name}-${var.environment}-jump-profile"
  role = aws_iam_role.jump_host_role.name

  tags = {
    Name        = "${var.project_name}-${var.environment}-jump-profile"
    Environment = var.environment
    Project     = var.project_name
  }
}
