## Install

* Build the image if not done already
`docker-compose up -d`

* Run the new generator
`docker-compose exec web mix phoenix.new new_app`

* Move the files (in your host system) and delete the empty project folder
`sudo mv app_name/* ./`
`sudo mv app_name/.gitignore ./`
`rm -rf app_name`

* Edit database file `config/dev.exs`

In particular change the `hostname` key to the name of the postgres container in `docker-compose.yml`. (by default: `db`)

~~~ elixir
config/dev.exs
# Configure your database
config :hello_world, HelloWorld.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "app_name_dev",
  hostname: "db",
  pool_size: 10

~~~

You may need to change the permissions of the files created by the docker container with `sudo chown -R YOU_USER .`

* Create the db

`docker-compose exec web mix ecto.create`

* Restart the web container

`docker-compose restart web`