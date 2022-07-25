output "iam_role" {
    value = aws_iam_role.assume_role
}

output "aws_iam_policy_document_assume_role_trust_policy" {
    value = data.aws_iam_policy_document.assume_role_trust_policy
}

output "iam_target_policy" {
    value = aws_iam_policy.target_policy
}

output "aws_iam_policy_document_assume_role_group_policy" {
    value = data.aws_iam_policy_document.assume_role_group_policy
}

output "aws_iam_group" {
    value = aws_iam_group.iam_group
}

output "aws_iam_group_policy" {
    value = aws_iam_group_policy.iam_group_policy
}