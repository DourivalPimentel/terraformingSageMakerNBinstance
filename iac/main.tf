resource "aws_iam_role" "role" {
  name = "Sagemaker-role"

  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "sagemaker.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "Sagemaker-policy"
  description = "A Sagemaker policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "sagemaker:*"
        ],
        "NotResource": [
            "arn:aws:sagemaker:*:*:domain/*",
            "arn:aws:sagemaker:*:*:user-profile/*",
            "arn:aws:sagemaker:*:*:app/*",
            "arn:aws:sagemaker:*:*:flow-definition/*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "sagemaker:CreatePresignedDomainUrl",
            "sagemaker:DescribeDomain",
            "sagemaker:ListDomains",
            "sagemaker:DescribeUserProfile",
            "sagemaker:ListUserProfiles",
            "sagemaker:*App",
            "sagemaker:ListApps"
        ],
        "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Action": "sagemaker:*",
        "Resource": [
            "arn:aws:sagemaker:*:*:flow-definition/*"
        ],
        "Condition": {
            "StringEqualsIfExists": {
                "sagemaker:WorkteamType": [
                    "private-crowd",
                    "vendor-crowd"
                ]
            }
        }
    },
    {
        "Effect": "Allow",
        "Action": [
            "application-autoscaling:DeleteScalingPolicy",
            "application-autoscaling:DeleteScheduledAction",
            "application-autoscaling:DeregisterScalableTarget",
            "application-autoscaling:DescribeScalableTargets",
            "application-autoscaling:DescribeScalingActivities",
            "application-autoscaling:DescribeScalingPolicies",
            "application-autoscaling:DescribeScheduledActions",
            "application-autoscaling:PutScalingPolicy",
            "application-autoscaling:PutScheduledAction",
            "application-autoscaling:RegisterScalableTarget",
            "aws-marketplace:ViewSubscriptions",
            "cloudwatch:DeleteAlarms",
            "cloudwatch:DescribeAlarms",
            "cloudwatch:GetMetricData",
            "cloudwatch:GetMetricStatistics",
            "cloudwatch:ListMetrics",
            "cloudwatch:PutMetricAlarm",
            "cloudwatch:PutMetricData",
            "codecommit:BatchGetRepositories",
            "codecommit:CreateRepository",
            "codecommit:GetRepository",
            "codecommit:List*",
            "cognito-idp:AdminAddUserToGroup",
            "cognito-idp:AdminCreateUser",
            "cognito-idp:AdminDeleteUser",
            "cognito-idp:AdminDisableUser",
            "cognito-idp:AdminEnableUser",
            "cognito-idp:AdminRemoveUserFromGroup",
            "cognito-idp:CreateGroup",
            "cognito-idp:CreateUserPool",
            "cognito-idp:CreateUserPoolClient",
            "cognito-idp:CreateUserPoolDomain",
            "cognito-idp:DescribeUserPool",
            "cognito-idp:DescribeUserPoolClient",
            "cognito-idp:List*",
            "cognito-idp:UpdateUserPool",
            "cognito-idp:UpdateUserPoolClient",
            "ec2:CreateNetworkInterface",
            "ec2:CreateNetworkInterfacePermission",
            "ec2:CreateVpcEndpoint",
            "ec2:DeleteNetworkInterface",
            "ec2:DeleteNetworkInterfacePermission",
            "ec2:DescribeDhcpOptions",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribeRouteTables",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcEndpoints",
            "ec2:DescribeVpcs",
            "ecr:BatchCheckLayerAvailability",
            "ecr:BatchGetImage",
            "ecr:CreateRepository",
            "ecr:Describe*",
            "ecr:GetAuthorizationToken",
            "ecr:GetDownloadUrlForLayer",
            "ecr:StartImageScan",
            "elastic-inference:Connect",
            "elasticfilesystem:DescribeFileSystems",
            "elasticfilesystem:DescribeMountTargets",
            "fsx:DescribeFileSystems",
            "glue:CreateJob",
            "glue:DeleteJob",
            "glue:GetJob",
            "glue:GetJobRun",
            "glue:GetJobRuns",
            "glue:GetJobs",
            "glue:ResetJobBookmark",
            "glue:StartJobRun",
            "glue:UpdateJob",
            "groundtruthlabeling:*",
            "iam:ListRoles",
            "kms:DescribeKey",
            "kms:ListAliases",
            "lambda:ListFunctions",
            "logs:CreateLogDelivery",
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:DeleteLogDelivery",
            "logs:Describe*",
            "logs:GetLogDelivery",
            "logs:GetLogEvents",
            "logs:ListLogDeliveries",
            "logs:PutLogEvents",
            "logs:PutResourcePolicy",
            "logs:UpdateLogDelivery",
            "robomaker:CreateSimulationApplication",
            "robomaker:DescribeSimulationApplication",
            "robomaker:DeleteSimulationApplication",
            "robomaker:CreateSimulationJob",
            "robomaker:DescribeSimulationJob",
            "robomaker:CancelSimulationJob",
            "secretsmanager:ListSecrets",
            "sns:ListTopics"
        ],
        "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Action": [
            "ecr:SetRepositoryPolicy",
            "ecr:CompleteLayerUpload",
            "ecr:BatchDeleteImage",
            "ecr:UploadLayerPart",
            "ecr:DeleteRepositoryPolicy",
            "ecr:InitiateLayerUpload",
            "ecr:DeleteRepository",
            "ecr:PutImage"
        ],
        "Resource": "arn:aws:ecr:*:*:repository/*sagemaker*"
    },
    {
        "Effect": "Allow",
        "Action": [
            "codecommit:GitPull",
            "codecommit:GitPush"
        ],
        "Resource": [
            "arn:aws:codecommit:*:*:*sagemaker*",
            "arn:aws:codecommit:*:*:*SageMaker*",
            "arn:aws:codecommit:*:*:*Sagemaker*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "secretsmanager:DescribeSecret",
            "secretsmanager:GetSecretValue",
            "secretsmanager:CreateSecret"
        ],
        "Resource": [
            "arn:aws:secretsmanager:*:*:secret:AmazonSageMaker-*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "secretsmanager:DescribeSecret",
            "secretsmanager:GetSecretValue"
        ],
        "Resource": "*",
        "Condition": {
            "StringEquals": {
                "secretsmanager:ResourceTag/SageMaker": "true"
            }
        }
    },
    {
        "Effect": "Allow",
        "Action": [
            "s3:GetObject",
            "s3:PutObject",
            "s3:DeleteObject",
            "s3:AbortMultipartUpload"
        ],
        "Resource": [
            "arn:aws:s3:::*SageMaker*",
            "arn:aws:s3:::*Sagemaker*",
            "arn:aws:s3:::*sagemaker*",
            "arn:aws:s3:::*aws-glue*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "s3:GetObject"
        ],
        "Resource": "*",
        "Condition": {
            "StringEqualsIgnoreCase": {
                "s3:ExistingObjectTag/SageMaker": "true"
            }
        }
    },
    {
        "Effect": "Allow",
        "Action": [
            "s3:CreateBucket",
            "s3:GetBucketLocation",
            "s3:ListBucket",
            "s3:ListAllMyBuckets",
            "s3:GetBucketCors",
            "s3:PutBucketCors"
        ],
        "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Action": [
            "lambda:InvokeFunction"
        ],
        "Resource": [
            "arn:aws:lambda:*:*:function:*SageMaker*",
            "arn:aws:lambda:*:*:function:*sagemaker*",
            "arn:aws:lambda:*:*:function:*Sagemaker*",
            "arn:aws:lambda:*:*:function:*LabelingFunction*"
        ]
    },
    {
        "Action": "iam:CreateServiceLinkedRole",
        "Effect": "Allow",
        "Resource": "arn:aws:iam::*:role/aws-service-role/sagemaker.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_SageMakerEndpoint",
        "Condition": {
            "StringLike": {
                "iam:AWSServiceName": "sagemaker.application-autoscaling.amazonaws.com"
            }
        }
    },
    {
        "Effect": "Allow",
        "Action": "iam:CreateServiceLinkedRole",
        "Resource": "*",
        "Condition": {
            "StringEquals": {
                "iam:AWSServiceName": "robomaker.amazonaws.com"
            }
        }
    },
    {
        "Effect": "Allow",
        "Action": [
            "sns:Subscribe",
            "sns:CreateTopic"
        ],
        "Resource": [
            "arn:aws:sns:*:*:*SageMaker*",
            "arn:aws:sns:*:*:*Sagemaker*",
            "arn:aws:sns:*:*:*sagemaker*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "s3:GetObject",
            "s3:PutObject",
            "s3:DeleteObject",
            "s3:ListBucket"
        ],
        "Resource": [
            "arn:aws:s3:::${var.buckets_regexp}"
        ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "Sagemaker-attach" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}


resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "lc" {
  name      = var.lifecycle_config_name
  on_create = base64encode("
#!/bin/bash

set -e

sudo -u ec2-user -i <<'EOF'  
ln -s /home/ec2-user/SageMaker/envs/python_custom /home/ec2-user/anaconda3/envs/python_custom

EOF
  ")
  on_start  = base64encode("
#!/bin/bash

set -e

sudo -u ec2-user -i <<'EOF'  
ln -s /home/ec2-user/SageMaker/envs/python_custom /home/ec2-user/anaconda3/envs/python_custom

EOF
  ")
}

resource "aws_sagemaker_notebook_instance" "ni" {
  name                  = "my-notebook-instance"
  role_arn              = "${aws_iam_role.role.arn}"
  instance_type         = "ml.t2.medium"
  lifecycle_config_name = var.lifecycle_config_name

  tags = {
    Name = "foo"
  }
}

output "instance" {
  value = {
    id = aws_sagemaker_notebook_instance.ni.id
  }
}