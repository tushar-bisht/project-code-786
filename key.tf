module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "project-code-786-key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDv2Ps6h6Fag7WowtIcYQBU9LqAvrbxwADsXtQ5BtKaDH7yXvduLoXacQTmb4C48u/fUr/+iIvAubNK1RXWxyQaDcvKf8BmTjuEgnIg6Zv+l7bgMuajN+/jFoWDGG1IvtLmFwzJj+StAuYHPRIRBvAbakliugqSjqCEt/31D1KERI9MRd5r5stFsHkIV+xQMk6UxFaZ0B+H7Wf5lQUxFHuutbeeyk8sjF1vpJCRq9HjykgVdEbAH6fQq5DssUMx1Fe3g5qt8aEqkw+6t1Z6E2SX6po6G5yteVDGOOZVHo/rum6QxSCOfelMAii+kmVIQK1VB8SePv7TwbyjNYOEJdjt Tushar_upgradKP"
}
