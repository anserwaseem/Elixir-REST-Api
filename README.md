# Elixir-rest_api

## Installation

### [Elixir](https://elixir-lang.org/install.html)

- Go to documentation and install latest version of elixir
- Set [PATH variable](https://elixir-lang.org/install.html#setting-path-environment-variable)
- Restart your system
- Try `elixir -v` command

### [Phoenix](https://hexdocs.pm/phoenix/installation.html)

- Install Hex package manager using `mix local.hex` command
- Install Phoenix application generator using `mix archive.install hex phx_new` command
- Install [docker](https://docs.docker.com/get-docker/) and follow the isntalltion instructions
  > I'm on Windows 10 so i had to enable [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) feature by running `wsl --install` command, downloading [linux kernal update package](https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package), enabling Hyper-V feature from settings and rebooting the system
- Run `docker pull postgress` to install latest image of postgres in docker
- Spin up the docker container using command `docker run --name bs_db -p 5432:5432 -e POSTGRES_USER=postgresUser -e POSTGRES_PASSWORD=postgresPassword -d postgres`
  > **--name** specify container name,
  > **-p** specify port (using default port),
  > **-e** set up environment variables (username and password for postgres),
  > **-d** running the container in detached mode (background)
- You can either use docker desktop GUI or run `docker ps` command to see available containers and their state, and `docker inspect containerNameOrId` to inspect its configurations and variables

## Set up

> You can run `mix phx.new projectName` to create a project but I'm gonna use more subcommands to make the project suited to my needs.

- `mix phx.new rest_api --no-install --app rest_api --database postgres --no-live --no-assets --no-html --no-dashboard --no-mailer --binary-id`

> **--no-install** won't run mix deps.git, we'll be installing dependencies ourselves,
> **--app** name of our OTP application,
> **--database** specify database adatpter for [Ecto](https://hexdocs.pm/phoenix/ecto.html),
> **--no-live** don't require live view sockets,
> **--no-assets** don't require assets (css, js),
> **--no-html** don't require html views,
> **--no-dashboard** no need of phoenix live dashboard,
> **--no-mailer** no need of [swoosh](https://hexdocs.pm/swoosh/Swoosh.html) mailer files,
> **--binary-id** this uses binary ids instead of integres in database

- Move to your project folder by doing `cd rest_api`
- Change your username and password in _config/dev.exs_ file to what you set while configuring postgres
- Run `mix ecto.create` to create the database (and compiling the project as well)
- Run `mix phx.server` to run the project
- Go to _localhost:4000_ in your browser and you'll see _Phoenix.Router.NoRouteError at GET /_

## Migration

- Hit `mix phx.gen.json Accounts Account accounts email:string hash_password:string`
- Hit `mix phx.gen.json Users User users account_id:references:accounts full_name:string gender:string biography:text`
- Hit `mix ecto.migrate`

## Hit Api

- Run `iex` to spin up the Elixir shell
- Enter `RestApi.Accounts.create_account(%{email: "myfirst@email.com, hash_password: "thisishashed"})` to create first record in accounts table
