---
description: Release the RedLemon Application (Strict Protocol)
---

# RedLemon Release Workflow (Satellite Protocol)

This workflow ensures a safe, verified release of RedLemon. Adhere to it strictly to prevent regressions.

## 1. Documentation & Prep
1.  **AI Bible**: Read **Part 19** of `AI_BIBLE.md` to refresh memory on current Release Rules.
2.  **Versioning**:
    - Determine next Version (e.g. `1.1.0`) and Build Number (e.g. `118`).
    - Build Number MUST be strictly greater than the current one in `README.md`.
    - Check the current build number: `grep "Current Version" README.md`

## 2. Execute Release Script
Run the automated release script. This will perform Safety Checks -> Build -> Sign -> Deploy.

```bash
./scripts/release.sh "[VERSION]" "[BUILD_NUMBER]" "<li>[Note 1]</li><li>[Note 2]</li>"
```

*Example*:
`./scripts/release.sh "1.0.118" "118" "<li>Fixed Font Weight (Landmine #12)</li><li>Added Sleep Assertion Safety (Landmine #56)</li>"`

## 3. Post-Release Git Operations
If the script succeeds (Green "Deployed Successfully" message):

1.  **Check Status**: Verify `appcast.xml`, `README.md`, and `build-app-debug.sh` are modified.
    ```bash
    git status
    ```

2.  **Commit Artifacts**:
    ```bash
    git add appcast.xml README.md build-app-debug.sh RedLemon-Installer.sha256
    git commit -m "Release v[VERSION] build [BUILD_NUMBER]"
    ```
    *(Note: Do not commit the .dmg itself to git)*

3.  **Create GitHub Release**:
    - Go to GitHub -> Releases -> Draft a new release.
    - Tag: `v[VERSION]`.
    - Title: `v[VERSION]`.
    - Content: Paste the Release Notes.
    - **Upload**: `RedLemon-Installer.dmg` (Required).


3.  **Tag & Merge**:
    ```bash
    git tag v[VERSION]
    git push origin v[VERSION]

    # Merge into main (if on feature branch)
    git checkout main
    git merge [CURRENT_BRANCH]
    git push origin main
    git checkout [CURRENT_BRANCH]
    ```

## 4. Verification
1.  Launch **Production RedLemon** (Old Version).
2.  Go to `Settings -> Check for Updates`.
3.  Verify the new update is detected and Release Notes are visible.
