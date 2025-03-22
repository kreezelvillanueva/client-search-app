# Client Search App

## Overview

This is a minimalist command-line application built using Ruby. The application allows you to:
1. Search through all clients and return those with names or other fields partially matching a given search query.
2. Find out if there are any clients with the same email in the dataset and show those duplicates if any are found.

## Requirements

- Ruby 3.3.0
- Bundler

## Setup

1. **Install dependencies**:
   ```sh
   bundle install
   ```

2. Make the script executable:
   ```sh
   chmod +x bin/client_search
   ```

3. Ensure the clients.json file is in the data directory:

   ```json

   [
   { "id": 1, "full_name": "John Doe", "email": "john.doe@gmail.com" },
   { "id": 2, "full_name": "Jane Smith", "email": "jane.smith@yahoo.com" },
   { "id": 3, "full_name": "Alex Johnson", "email": "alex.johnson@hotmail.com" },
   { "id": 4, "full_name": "Michael Williams", "email": "michael.williams@outlook.com" },
   { "id": 5, "full_name": "Emily Brown", "email": "emily.brown@aol.com" },
   { "id": 6, "full_name": "William Davis", "email": "william.davis@icloud.com" },
   { "id": 7, "full_name": "Olivia Miller", "email": "olivia.miller@protonmail.com" },
   { "id": 8, "full_name": "James Wilson", "email": "james.wilson@yandex.com" },
   { "id": 9, "full_name": "Ava Taylor", "email": "ava.taylor@mail.com" },
   { "id": 10, "full_name": "Michael Brown", "email": "michael.brown@inbox.com" },
   { "id": 11, "full_name": "Sophia Garcia", "email": "sophia.garcia@zoho.com" },
   { "id": 12, "full_name": "Emma Lopez", "email": "emma.lopez@protonmail.ch" },
   { "id": 13, "full_name": "Liam Martinez", "email": "liam.martinez@fastmail.fm" },
   { "id": 14, "full_name": "Isabella Rodriguez", "email": "isabella.rodriguez@me.com" },
   { "id": 15, "full_name": "Another Jane Smith", "email": "jane.smith@yahoo.com" }
   ]

   ```

## Usage

### Search clients by name
```sh
./bin/client_search search -q "full_name:John"
```

### Search clients by a specified field and value:
```sh
./bin/client_search search -q "full_name:John"
```


### Search clients by multiple fields with AND condition:
```sh
./bin/client_search search -q "full_name:John AND email:gmail.com"
```

### Search clients by multiple fields with OR condition:
```sh
./bin/client_search search -q "email:john.doe@gmail.com OR full_name:Smith"
```

### Search clients by default field (full_name) and value:
```sh
./bin/client_search search -q "John"
```

### Specify a custom data file path:
```sh
./bin/client_search search -q "full_name:John" -d "path/to/your/clients.json"
```

### Find duplicate emails
```sh
./bin/client_search duplicates
```

### Specify a custom data file path:
```sh
./bin/client_search duplicates -d "path/to/your/clients.json"
```

## Running Tests
```sh
rspec
```
