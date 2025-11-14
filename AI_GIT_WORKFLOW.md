# AI Agent Git Workflow Instructions

## Mandatory Git Commit Policy

**ALL AI AGENTS MUST COMMIT CHANGES AFTER MAKING ANY MODIFICATIONS TO THE CODEBASE.**

### Required Workflow

1. **BEFORE making changes**: Check git status to understand current state
2. **AFTER making changes**: IMMEDIATELY commit all changes with descriptive commit messages

### Mandatory Commands to Execute

#### Before Making Changes:
```bash
git status
```

#### After Making Changes:
```bash
git add .
git commit -m "feat: [brief description of changes]

- [specific change 1]
- [specific change 2]
- [specific change 3]

Closes: [issue number if applicable]
Fixes: [problem description if applicable]"
```

### Commit Message Format

Use conventional commit format:
- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation changes
- `style:` for formatting changes
- `refactor:` for code refactoring
- `test:` for test additions/changes
- `chore:` for maintenance tasks

### Examples

**Feature Addition:**
```bash
git add .
git commit -m "feat: add user authentication system

- implement JWT token validation
- add login/logout endpoints
- create user session management

Fixes: #123"
```

**Bug Fix:**
```bash
git add .
git commit -m "fix: resolve memory leak in video player

- fix MPV player memory management
- add proper cleanup on view disposal
- prevent memory accumulation during playback"
```

**Code Refactoring:**
```bash
git add .
git commit -m "refactor: improve networking layer architecture

- extract API client to separate service
- implement proper error handling
- add request/response caching"
```

### Enforcement Rules

- **NEVER** leave changes uncommitted
- **ALWAYS** use descriptive commit messages
- **IMMEDIATELY** commit after each logical change set
- **INCLUDE** affected file names in commit message when relevant
- **REFERENCE** relevant issues or tickets when applicable

### Verification Checklist

After committing, verify:
- [ ] All changes are staged (`git add .`)
- [ ] Commit message follows conventional format
- [ ] Commit message clearly describes what changed
- [ ] No uncommitted changes remain (`git status` shows clean)

### Emergency Command

If unsure what changed, use:
```bash
git diff --name-only
git add .
git commit -m "chore: commit pending changes

Files modified:
$(git diff --cached --name-only)"
```

## ⚠️ CRITICAL REMINDER

**FAILURE TO COMMIT CHANGES IS UNACCEPTABLE AND MAY CAUSE WORK LOSS.**

Every AI agent MUST treat git commits as a mandatory part of their workflow, not an optional step.
