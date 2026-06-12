# Contributing Guide

This project trains you to work the way professional teams work. The rules below are strict on purpose. Maintainers on large open-source projects reject pull requests for sloppy commits and vague descriptions every day. Learn the habits here, where a rejection costs you ten minutes instead of a release cycle.

Read this whole document before you open your first pull request. Reviewers will close PRs that ignore it, with a link back to the section you skipped.

## Issues

Every change to this project starts as an issue. The issue is where scope gets agreed before anyone writes code, so a weak issue produces wasted work no matter how good the eventual PR is.

### Before you open one

1. Search open and closed issues for duplicates. If a match exists, add your information as a comment there instead of opening a new one. Duplicates get closed with a link to the original.
2. Confirm you can reproduce the problem on the latest `main`. Bugs that only appear on stale branches are not bugs.
3. One problem per issue. A bug report that also requests a feature gets sent back to be split.

### Bug reports

Fill in every section of the bug template. A complete report contains:

1. **Summary**: one sentence stating what breaks.
2. **Steps to reproduce**: a numbered list a stranger can follow exactly. "Log in and click around the cart" fails. "1. Log in as a standard user. 2. Add one item to the cart. 3. Click Remove." passes.
3. **Expected behavior**: what should have happened.
4. **Actual behavior**: what happened instead, with the exact error message or a screenshot.
5. **Environment**: OS, browser or runtime version, and the commit hash from `git rev-parse --short HEAD`.

A report a maintainer cannot reproduce from your steps gets labeled `needs-repro` and closes after 14 days without an update.

### Feature requests

Describe the problem before the solution. A complete request contains:

1. **Problem**: who is affected and what they cannot do today.
2. **Proposed solution**: your idea, sketched in a paragraph. Mockups welcome.
3. **Alternatives**: at least one other approach you considered and why you set it aside.

Requests that open with an implementation ("add a Redis cache") and never state the underlying problem get sent back. The maintainers may accept your problem and reject your solution; that counts as the issue working as designed.

### Issue titles

Write titles the way you write commit subjects: specific and under 70 characters. "Cart crashes when removing the last item" passes. "Bug in cart" and "URGENT please fix" fail.

### Claiming work

Comment on the issue asking for assignment before you start. A maintainer assigns it, confirming the scope is current and nobody else is mid-flight on it. Assigned issues with no linked branch or update after 14 days get unassigned so others can pick them up.



1. Find or open an issue describing the change.
2. Get the issue assigned to you. Do not start work on an unassigned issue.
3. Create a branch from `main` using the naming rules below.
4. Make your changes in small, focused commits.
5. Open a pull request that follows the PR rules below.
6. Respond to review feedback within 7 days, or the PR will be closed as stale.

Never commit directly to `main`. The branch is protected, and your push will fail.

## Branches

Name your branch with this pattern:

```
<type>/<issue-number>-<short-description>
```

Examples:

```
feat/42-user-login-form
fix/108-null-crash-on-empty-cart
docs/77-install-instructions
```

Use lowercase letters, digits, and hyphens only. Keep the description under five words. The type must match one of the commit types listed in the next section.

## Commits

### Format

Every commit message follows [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

A real example:

```
fix(cart): prevent crash when removing the last item

The remove handler assumed the cart array was non-empty and
indexed into it without a length check. Empty carts threw a
TypeError and blanked the page.

Add a guard clause and a regression test covering the empty case.

Fixes #108
```

### Allowed types

| Type | Use it for |
|------|-----------|
| `feat` | A new feature visible to users |
| `fix` | A bug fix |
| `docs` | Documentation only |
| `test` | Adding or correcting tests, no production code change |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `chore` | Build scripts, dependencies, tooling |

If your commit needs two types, you have two commits. Split them.

### Subject line rules

1. 50 characters or fewer.
2. Imperative mood: "add validation," never "added validation" or "adds validation." Test: the subject should complete the sentence "If applied, this commit will ___."
3. Lowercase after the type prefix. No period at the end.
4. Describe what the change does, not what you did. "fix(auth): reject expired tokens" passes. "fix(auth): fixed the bug from yesterday" fails.

### Body rules

1. Required for any commit touching more than 10 lines. Optional below that.
2. Wrap lines at 72 characters.
3. Explain why the change exists and what was wrong before. The diff already shows what changed; the body explains what the diff cannot.
4. Write in full sentences.

### Footer rules

1. Reference the issue: `Fixes #108` for bugs, `Closes #42` for features, `Refs #15` when the commit relates to an issue without resolving it.
2. Every commit on a PR branch must reference the PR's issue.

### One logical change per commit

A commit does one thing. Some failing examples and how to fix them:

- You fixed a bug and reformatted the file while you were in there. Two commits: the fix, then `chore: reformat cart.js`.
- You built a feature and fixed an unrelated typo you noticed. The typo goes in its own commit, or better, its own PR.
- You have commits named `wip`, `more fixes`, `asdf`. Squash and rewrite them with `git rebase -i` before opening the PR.

Reviewers read your branch commit by commit. If a single commit cannot be understood on its own, rewrite your history until each one can.

## Pull Requests

### Before you open one

Confirm each item. The PR template asks you to check these boxes, and reviewers verify them.

- [ ] The branch is rebased on the latest `main`.
- [ ] Every commit follows the commit rules above.
- [ ] All tests pass locally.
- [ ] You added tests for new behavior or fixed behavior.
- [ ] The linter reports zero warnings.
- [ ] The diff contains no commented-out code, no debug prints, no unrelated formatting changes.
- [ ] The diff is under 250 countable lines, or a maintainer approved the size on the issue.

### Size limit

A PR changes at most 250 lines (additions plus deletions). Reviewers catch fewer defects as a diff grows, and this is a production application, so the cap protects users as much as it protects reviewers. Larger changes get split into a sequence of PRs, each one reviewable and mergeable on its own. Reviewers will close oversized PRs unread.

**Exempt from the count:** lock files, generated code, and purely mechanical changes such as a rename across many call sites or a formatting-only pass. A mechanical change must live in its own commit containing nothing else, so the reviewer can verify it at a glance and move on. Mixing mechanical and behavioral changes in one commit voids the exemption.

**If you believe your change cannot fit:** stop before writing more code and explain your plan on the issue. A maintainer will either approve the larger size or point out where the change splits. Most changes that look irreducible have a seam, and learning to find it is part of what this project teaches. PRs that blow past the cap without prior approval get closed regardless of code quality.

### Title

The PR title follows the same format as a commit subject line:

```
feat(profile): add avatar upload
```

When your PR merges, this title becomes the squashed commit on `main`, so it must pass every subject-line rule.

### Description

Fill in every section of the template. A complete description contains:

1. **What**: one or two sentences stating the change.
2. **Why**: the problem this solves, with a link to the issue (`Closes #42`).
3. **How**: the approach you took and any alternatives you rejected.
4. **Testing**: the exact commands you ran and what you verified by hand. "Tests pass" is not enough; name the scenarios.
5. **Screenshots**: required for any visual change, showing before and after.

A description reading "see issue" or "small fix" gets the PR closed.

### Scope

A PR resolves exactly one issue. Do not bundle a second fix because "it was right there." Open another issue and another PR. Small, single-purpose PRs merge in days; grab-bag PRs sit in review for weeks and rot.

### Draft PRs

Open a draft if you want early feedback on direction. Drafts are exempt from the checklist but not from the commit rules. Mark the PR ready for review only when every checklist item passes.

## Code Review

### When your PR is reviewed

1. Respond to every comment. Either make the change or explain your reasoning. Never resolve a reviewer's comment yourself without replying.
2. Push review fixes as new commits named `fixup! <original subject>`, then squash them with `git rebase -i --autosquash` once the reviewer approves. This lets the reviewer see exactly what changed since their last pass.
3. Never force-push while a review is in progress, except for the final autosquash. Force-pushing mid-review destroys the reviewer's reference points.
4. Disagreement is fine. Arguing in circles is not. After two rounds on the same point, the maintainer decides and the PR moves on.

### When you review someone else

Reviewing is part of contributing, and students are expected to review each other.

1. Be specific. "This could be cleaner" helps no one. "Extract lines 40-55 into a `validateInput` helper" does.
2. Distinguish blocking comments from suggestions. Prefix optional ideas with `nit:`.
3. Review the code, not the person. "This function mutates its argument" passes. "You always mutate arguments" fails.
4. Approve only when you would be comfortable maintaining the code yourself.

## Merging

Maintainers merge approved PRs using squash-merge. Requirements before merge:

1. One approving review from a maintainer.
2. CI green on the latest commit.
3. Branch up to date with `main`.

Delete your branch after merge. Stale branches get pruned monthly.

## Getting Help

Stuck on the workflow rather than the code? Ask in the issue thread or the project discussion board. Questions about these rules are welcome; silent guessing produces the PRs this document exists to prevent. Nobody here expects you to know this already. We expect you to learn it, and that starts with asking.
