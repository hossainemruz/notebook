# Git History

**Goal:** 
Release multiple versions of an app simultaneously keeping git history as it was released one by one over time.

**Example App:**

We want to release the following versions:

| App Versions (Major.Minor) | Patches       |
| -------------------------- | ------------- |
| 5.7                        | 5.7.25        |
| 8.0                        | 8.0.3, 8.0.14 |



**Conditions:**

1. There will be  `release-M.M` branch for each Major.Minor version.
2. There will be a tag for each patch release.

**Release 5.7.25**

Make `5.7.25` specific changes in a temporary branch (i.e. `prep-5.7.23`). Then make PR against `master`. Then merge the PR in master. 
      OR
Directly push the changes in `master`.


Then, create a branch `release-5.7` from master. Tag this branch as `5.7.25`.

**Release 8.0.3**

Make `8.0.3` specific change to `master` (through a PR or directly). Then, create `release-8.0` branch from `master` and tag it as `8.0.3`.



**Release 0.8.14:**

Method-1: 
Make `8.0.14` specific change to `master` (through a PR or directly). Then, Pull the changes to `release-8.0` branch tag it as `8.0.14`.


Method-2: 
Make `8.0.14` specific change to `release-8.0` (through a PR or directly). Then tag it as `8.0.14`. In this case, `master` will not have `8.0.14`  specific changes.


## Different Cases

**Case-1:  Release `5.7.26` patch**

Make `5.7.26` specific changes in `release-5.7` (through a PR or directly). Then, tag it as `5.7.26`.

**Case-2: Release `8.0.3` had a bug**
Create a branch `release-8.0.3` from `8.0.3` and fix the bug in this branch. Then, re-tag it as `8.0.3`.

**Case-3: Bug of `8.0.3` has  propagated to other subsequent patches**

Create `release-<patch>`  branch from the respective tags. Fix bug there and re-tag it.

**Case-3: Release 9.0.0**

Make `9.0.0`specific changes in `master` (through PR or directly). Then, create `release-9.0` branch from `master` and tag it as `9.0.0`.

