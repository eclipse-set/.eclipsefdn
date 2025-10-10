local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local custom_branch_protection_rule(pattern) = 
  orgs.newBranchProtectionRule(pattern) {
    required_approving_review_count: 0,
  };

local release_branch_protection_rule() = 
  orgs.newBranchProtectionRule('release/*') {
    required_approving_review_count: 0,
  };

orgs.newOrg('technology.set', 'eclipse-set') {
  settings+: {
    description: "",
    name: "Eclipse SET",
    packages_containers_internal: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('GH_BOT_TOKEN') {
      value: "pass:bots/technology.set/github.com/api-token",
    },
    orgs.newOrgSecret('GH_BOT_USERNAME') {
      value: "pass:bots/technology.set/github.com/username",
    },
    orgs.newOrgSecret('GITLAB_API_TOKEN') {
      value: "pass:bots/technology.set/gitlab.eclipse.org/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('browser') {
      allow_update_branch: false,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
        release_branch_protection_rule(),
      ],
    },
    orgs.newRepo('build') {
      allow_update_branch: false,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
      ],      
    },
    orgs.newRepo('model') {
      allow_update_branch: false,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
        release_branch_protection_rule(),
      ],
    },
    orgs.newRepo('set') {
      allow_update_branch: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
        release_branch_protection_rule(),
      ],
    },
    orgs.newRepo('toolboxmodel') {
      allow_update_branch: false,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        custom_branch_protection_rule('main'),
        release_branch_protection_rule(),
      ],      
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
