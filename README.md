# Papertrail Insights Webhook

A simple webhook to send log messages to New Relic Insights for later analysis.

See [Insert custom events with the Insights API](https://docs.newrelic.com/docs/insights/explore-data/custom-events/insert-custom-events-insights-api) for background.

## Deploying

### Step 1: Create a heroku app

    $ heroku create -s cedar

### Step 2: Follow the steps in the Insights documentation to get your account ID and create an Insert API key.

### Step 3: Add the account ID and API key to your heroku app

    $ heroku config:add NEWRELIC_ACCOUNT_ID=123456
    $ heroku config:add INSIGHTS_API_KEY='892389d47hs_qn-tshnoe'

### Step 4: Create a Papertrail saved search

1. Create a saved search for an interesting term in the logs.
2. Create a webhook search alert pointing to `https://your-heroku-app-name.herokuapp.com/submit`

See more about search alerts and webhooks here: http://help.papertrailapp.com/kb/how-it-works/web-hooks

## Using

Once you've created a saved search in Papertrail and configured the search
alert, you can watch for or specifically send log messages that match that message.

For example, if your saved search matches `ops-alert`, you could use this 
to alert you when a big transfer has completed:

    $ rsync -R /backup backup:/backup ; logger -t ops-alert The transfer has completed
