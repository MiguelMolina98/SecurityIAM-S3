resource "aws_iam_group" "lambda_readonly" {
  name = "LambdaReadOnlyGroup"
}

resource "aws_iam_group_policy" "lambda_readonly_policy" {
  name  = "LambdaReadOnlyPolicy"
  group = aws_iam_group.lambda_readonly.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["lambda:ListFunctions", "lambda:GetFunction", "lambda:GetFunctionConfiguration"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group" "lambda_write" {
  name = "LambdaWriteGroup"
}

resource "aws_iam_group_policy" "lambda_write_policy" {
  name  = "LambdaWritePolicy"
  group = aws_iam_group.lambda_write.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["lambda:CreateFunction", "lambda:UpdateFunctionCode", "lambda:UpdateFunctionConfiguration", "lambda:InvokeFunction"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user" "usuario1" {
  name = "usuario1"
}

resource "aws_iam_user_group_membership" "readonly_membership" {
  user  = aws_iam_user.usuario1.name
  groups = [aws_iam_group.lambda_readonly.name]
}

resource "aws_iam_user" "usuario2" {
  name = "usuario2"
}

resource "aws_iam_user_group_membership" "write_membership" {
  user  = aws_iam_user.usuario2.name
  groups = [aws_iam_group.lambda_write.name]
}
