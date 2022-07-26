data "aws_caller_identity" "source" {}

resource "aws_iam_role" "assume_role" {
    name                            = "ucsb-role-${var.role_name}"
    assume_role_policy              = data.aws_iam_policy_document.assume_role_trust_policy.json
    managed_policy_arns             = [aws_iam_policy.target_policy.arn]
}

data "aws_iam_policy_document" "assume_role_trust_policy" {
  statement {
    actions                         = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
    principals {
      type                          = "AWS"
      identifiers                   = ["arn:aws:iam::${data.aws_caller_identity.source.account_id}:root"]
    }
  }
}

resource "aws_iam_policy" "target_policy" {
    name                            = "ucsb-policy-role-${var.role_name}"
    policy                          = file("${var.policy_relative_directory}/${var.role_name}.json")
}

resource "aws_iam_group_policy" "iam_group_policy" {
    name                            = "ucsb-policy-group-role-${var.role_name}"
    group                           = aws_iam_group.iam_group.name
    policy                          = data.aws_iam_policy_document.assume_role_group_policy.json
}

resource "aws_iam_group" "iam_group" {
    name                            = "ucsb-group-role-${var.role_name}"
}

data "aws_iam_policy_document" "assume_role_group_policy" {
    statement {
      actions = [
        "sts:AssumeRole",
        "sts:TagSession"
      ]
      resources = [
        aws_iam_role.assume_role.arn
      ]
    }
}



