#include "github_rb.h"

VALUE rb_mGithubRb;

void
Init_github_rb(void)
{
  rb_mGithubRb = rb_define_module("GithubRb");
}
