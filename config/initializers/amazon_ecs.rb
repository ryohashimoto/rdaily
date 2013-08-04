Amazon::Ecs.options = {
  associate_tag: ENV['RDAILY_AMAZON_ECS_ASSOCIATE_TAG'],
  AWS_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  AWS_secret_key: ENV['AWS_SECRET_ACCESS_KEY']
}