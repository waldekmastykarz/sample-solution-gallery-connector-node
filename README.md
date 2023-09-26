# Sample Solution Gallery Microsoft Graph connector

Microsoft Graph connector that allows you to ingest samples from the Sample Solution Gallery into your Microsoft 365 tenant.

<!-- Image -->

This connector is meant to be run from your local machine.

## Prerequisites

- Microsoft 365 tenant
- Sufficient quota for ingesting external items
- Node@18

## First-time setup

```sh
# clone the repo
# make the setup script executable
chmod +x ./setup.sh
# execute setup script to create Entra ID app
./setup.sh
# restore dependencies
npm i
# create Microsoft Graph connector and provision schema
npm run createConnector
# load content
npm run loadContent
```

## Configuration options

`--no-fromCache`: specify to retrieve the latest content from the API. By default, the connector will load the content stored in the `cache.json` file, to avoid unnecessary API calls in case you'll want to load the same content multiple times, eg. `npm run loadContent -- --no-fromCache`.

## How it works

Each time you load content using the `loadContent` script, the connector will store in the `latestChange.txt` the date of the most recently updated sample that it loaded. The next time you load content, the connector will only extract content newer than the date stored in the `latestChange.txt` file. If you want to reload all content, either clear the contents of the `latestChange.txt` file or delete it altogether.
