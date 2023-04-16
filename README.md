## Usage

Clone the repository, run `npm install` and then run `npm start` which will open up a preview in your default browser, watch for changes to core template files, and live reload the browser when changes are saved.

You can view the `package.json` file to see which scripts are included.

## Configure for syncing fork

#### [Clone](https://github.com/StartBootstrap/startbootstrap-freelancer)

- `git clone https://github.com/Weping/portfolio.git`
- `cd portfolio`

#### [Configure remote repo](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-repository-for-a-fork)

- `git remote add upstream https://github.com/StartBootstrap/startbootstrap-freelancer.git`
- `git remote -v`

#### [Syncing fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork)

- `git fetch upstream`
- `git checkout master`
- `git merge upstream/master`
