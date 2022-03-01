# pagerduty-migration-as-elixir-wizard

Pagerduty api example test, an implementation of data migration of a customer because new laws regulations at their country needed.
It was built with Elixir language programming, because I'm trying to become in an Elixir Wizard |D

## Getting Started

Pagerduty endpoints used

- https://developer.pagerduty.com/api-reference/b3A6Mjc0ODIzMw-list-users
- https://developer.pagerduty.com/api-reference/b3A6Mjc0ODIyNA-get-a-team
- https://developer.pagerduty.com/api-reference/b3A6Mjc0ODI0MQ-get-a-user-s-contact-method

## Instructions

### Update your Pagerduty API token at pargerduty_client.ex
```
@api_token = "YOUR_TOKEN"
```

### Run at console, it will dump a file named sample_data_collected.json

```
iex -S mix
TheMigrationProject.main

// or

mix run lib/the_migration_project.ex
```

## License

This project is licensed under the Apache License, Version 2.0 (the "License"); - see the [LICENSE.md](LICENSE.md) file for details