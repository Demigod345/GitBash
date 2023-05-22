# Level 1 (master)

`git verify`
- First level is quite simple. we just have to run this one command.

# Level 2 (commit-one-file)
`git add A.txt`
`git commit -m "Commit A.txt file"`
- `git add A.txt` adds only A.txt file to the staging area.
- After that we commit teh files from the staging area.


# Level 3 (commit-one-file-staged)
`git reset A.txt`
`git commit -m "Commit B.txt file"`
- Here we have two files staged in the staging area. We first reset one of the files and them commit  the files in staging area.


# Level 4 (ignore-them)

`nano .gitignore`
- Now edit this files and type `*.o`  `*.exe` `*.jar`  `libraries/` in four different lines.

`git add .gitignore`
`git commit -m "ignore-them"`
- This adds .gitignore to staging area, which is then commited.


# Level 5 (chase-branch)
`git checkout chase-branch`
`git merge escaped`
- The first command makes sure we are on chase-branch. Second command merges chase-branch  with escaped branch.


# Level 6 (merge-conflict)
`git merge another-piece-of-work`
- This merges another-piece-of-work branch to merge-conflict branch. When we try to merge them, we see a merge conlfict.

`nano equation.txt`
- Open text editor and resolve the merge conflict by deleting the conflicting items.

`git add equation.txt`
`git commit --amend --no-edit `
- Add and commit the file to complete the level.


# Level 7 (save-your-work)
`git stash`
- This command stashes messy working directory.

`nano bug.txt`
- Resolve the bug

`git commmit -am "resolve bug.txt"`
- Commit changes in bug.txt

`git stash apply`
- This takes us back to the previous directory, where we can continue our work.

`nano bug.txt`
- Finish work by editing the file last time

`git commit -am "finish work"`
# Level 8 (change-branch-history)
`git rebase hot-bugfix`
- This rebases hot-bugfix branch with change-branch-history branch and the commits are also merged.


# Level 9 (remove-ignored)
`git rm ignored.txt`
`git commit -am "remove-ignored"`
- This removes ignored.txt, so that changes in it are not tracked further.


# Level 10 (case-sensitive-filename)
`mv File.txt file.txt`
`git commit  -am "case-sensitive-filename"`
- mv command changes file name from File.txt to file.txt.


# Level 11 (fix-typo)
`nano file.txt`
- Open file in text editor and 

`git commit -a --amend`
`#fix typo in commit message`
- Commit the changes made and edit the commit message.


# Level 12 (forge-date)
`git commit --amend --no-edit --date=""1987-06-09`
- Now commit date has been changed.


# Level 13 (fix-old-typo)
`git rebase -i HEAD^^`
- Interractive rebase command help us to rebase on a single branch and edit any commit. Now we are two commits behind the lastest one.

`#mark first commit with 'edit' command`
`# fix the typo in the file`
- Fix typo in file.txt by the  buildin text editor which opens up when we rebase.

`git add file.txt`
- Adds the file to staging area.

`git rebase --continue`
- With this we can finally edit the commit message 
