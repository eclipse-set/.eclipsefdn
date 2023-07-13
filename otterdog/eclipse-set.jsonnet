local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-set') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_repo_visibility: true,
    members_can_create_teams: true,
    members_can_delete_repositories: true,
    name: "Eclipse SET",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('browser') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('build') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('model') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('set') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('toolboxmodel') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
  ],
}
