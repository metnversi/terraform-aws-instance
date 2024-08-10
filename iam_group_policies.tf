resource "aws_iam_user" "metn2" {
    name = "metn2"
    path = "/system/"

    tags = {
        tag-key = "tag-value"
    }
}

resource "aws_iam_access_key" "metn2" {
    user = aws_iam_user.metn2.name
}

resource "aws_iam_user_policy_attachment" "metn2_admin_access" {
    user       = aws_iam_user.metn2.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_account_password_policy" "strict" {
    minimum_password_length        = 8
    require_lowercase_characters   = true
    require_numbers                = true
    require_uppercase_characters   = true
    require_symbols                = true
    allow_users_to_change_password = false
    max_password_age               = 30
}

resource "aws_iam_group" "queue" {
    name = "queue"
    path = "/system/"
}

resource "aws_iam_group_policy_attachment" "queue_read_only" {
    group      = aws_iam_group.queue.name
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


resource "aws_iam_user" "new_user" {
    name = "new_user"
    path = "/system/"
}

resource "aws_iam_user_group_membership" "new_user_membership" {
    user = aws_iam_user.new_user.name

    groups = [
        aws_iam_group.queue.name,
    ]
}
