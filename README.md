Git Commit
git commit creates a commit, which is like a snapshot of your repository. These commits are snapshots of your entire repository at specific times. You should make new commits often, based around logical units of change. Over time, commits should tell a story of the history of your repository and how it came to be the way that it currently is. Commits include lots of metadata in addition to the contents and message, like the author, timestamp, and more.

How Git Commit Works
Commits are the building blocks of "save points" within Git's version control.

git commit -m "update the README.md with link to contributing guide"

Commits shape history
By using commits, you're able to craft history intentionally and safely. You can make commits to different branches, and specify exactly what changes you want to include. Commits are created on the branch that you're currently checked out to (wherever HEAD is pointing) so it's always a good idea to run git status before making a commit, to check that you're checked-out to the branch that you intend to be. Before you commit, you will need to stage any new changes that you'd like to include in the commit using git add [file].

Commits are lightweight SHA hashes, objects within Git. As long as you're working with text files, you won't need to worry about how many files you have, how big they are, or how many commits you make. Git can handle it!

Committing in two phases
Commits have two phases to help you craft commits properly. Commits should be logical, atomic units of change that represent a specific idea. But, not all humans work that way. You may get carried away and end up solving two or three problems before you remember to commit! That's OK - Git can handle that. Once you're ready to craft your commits, you'll use git add <FILENAME> to specify the files that you'd like to "stage" for commit. Without adding any files, the command git commit won't work. Git only looks to the staging area to find out what to commit. Staging, or adding, files, is possible through the command line, and also possible with most Git interfaces like GitHub Desktop by selecting the lines or files that you'd like to stage.

You can also use a handy command, git add -p, to walk through the changes and separate them out, even if they're in the same file.

How to Use Git Commit
Common usages and options for Git Commit
git commit: This starts the commit process, but since it doesn't include a -m flag for the message, your default text editor will be opened for you to create the commit message. If you haven't configured anything, there's a good chance this will be VI or Vim. (To get out, press esc, then :w, and then Enter. :wink:)
git commit -m "descriptive commit message": This starts the commit process, and allows you to include the commit message at the same time.
git commit -am "descriptive commit message": In addition to including the commit message, this option allows you to skip the staging phase. The addition of -a will automatically stage any files that are already being tracked by Git (changes to files that you've committed before).
git commit --amend: Replaces the most recent commit with a new commit. (More on this later!)
To see all of the possible options you have with git commit, check out Git's documentation.

How to Undo Commits in Git
Sometimes, you may need to change history. You may need to undo a commit. If you find yourself in this situation, there are a few very important things to remember:

If you are "undoing" a commit that exists on the remote, you could create big problems for your collaborators
Undoing a commit on work that you only have locally is much safer
What can go wrong while changing history?
Changing history for collaborators can be problematic in a few ways. Imagine - You and another collaborator have the same repository, with the same history. But, they make a change that deletes the most recent commit. They continue new commits from the commit directly before that. Meanwhile, you keep working with the commit that the collaborator tried to delete. When they push, they'll have to 'force push', which should show to them that they're changing history. What do you think will happen when you try to push?

In dramatic cases, Git may decide that the histories are too different and the projects are no longer related. This is uncommon, but a big problem.

The most common result is that your git push would return the "deleted" commit to shared history. (First, you would git pull if you were working on the same branch, and then merge, but the results would be the same.) This means that whatever was so important to delete is now back in the repository. A password, token, or large binary file may return without ever alerting you.
