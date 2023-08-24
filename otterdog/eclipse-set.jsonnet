local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local custom_branch_protection_rule(pattern) = 
  orgs.newBranchProtectionRule(pattern) {
    required_approving_review_count: 0,
  };

orgs.newOrg('eclipse-set') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse SET",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('GITLAB_API_TOKEN') {
      value: "pass:bots/technology.set/gitlab.eclipse.org/api-token",
    },
    orgs.newOrgSecret('GITHUB_BOT_USERNAME') {
      value: "pass:bots/technology.set/github.com/username",
    },
    orgs.newOrgSecret('GITHUB_BOT_TOKEN') {
      value: "pass:bots/technology.set/github.com/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('browser') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
      ],
    },
    orgs.newRepo('build') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
      ],      
    },
    orgs.newRepo('model') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
      ],
    },
    orgs.newRepo('set') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_wiki: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
      ],
    },
    orgs.newRepo('toolboxmodel') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
      ],      
    },
  ],
}
