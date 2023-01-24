# CraftCMS GraphQL Authentication bug example

## Problem:

When querying the graphQL endpoint not as a logged-in user via GraphQL Authentication, but just using a Craft GraphQL schema token (via `Authorization: Bearer ....`), GraphQL Authentication is still applying the field rules but applying rules from the wrong Schema (seems to be always using Public).

## To reproduce:

- Create a GraphQL Schema that has access to entries with the field in question
- In GraphQL Authentication -> Settings -> Fields, set the field to Private with the Public Schema, but Query/Mutate in the new Schema
- Test that the query works in GraphiQL
- Make a request to the GraphQL endpoint querying that field with a `Authorization: Bearer {token}` (**not** the GraphQL Authentication JWT header)

You'll get an error response like this:

```json
{
  "errors": [
    {
      "message": "User doesn't have permission to access requested field(s)"
    }
  ]
}
```

## Reproduction Repo instructions:

### To install:

```sh
# Set up the DDEV environment:
ddev config --project-type=craftcms

# Boot the project and install Composer packages:
ddev start
ddev composer install

# Import a database backup and open the site in your browser:
ddev import-db --src=gql-bug-test--2023-01-24-154827--v4.3.6.1.sql
ddev launch
```

- Log in to the admin (https://craft-gql-bug.ddev.site/admin) with username/password `admin`/`craft-gql-bug`
- Add some data to the "Test Page" entry

### Testing requests:

If you use Postman, [here is a postman collection](https://raw.githubusercontent.com/danieltott/craft-gql-bug/main/craft-gql-bug.postman_collection.json)

Otherwise, make a request in whatever way you'd like, with the following setup:

<dl>
<dt>Url</dt>
<dd>https://craft-gql-bug.ddev.site/api</dd>
<dt>Headers<dt>
<dd>
  <ul>
    <li><code>Authorization: Bearer _AZL0f9hx95QXMNYDPxEzTSJBU2MnxMf</code></li>
    <li><code>Content-Type: application/json</code></li>
  </ul>
</dd>
<dt>Body</dt>
<dd>
<pre><code class="language-graphql">query MyQuery {
  entry(id: "2") {
    id
    ... on testPage_testPage_Entry {
      id
      testPublicField
      testPrivateField
    }
  }
}</code></pre>
</dd>
</dl>

Remove `testPrivateField` to confirm making this request will work in general.

### `cURL` Examples:

#### To make a request that fails:

```sh
curl --location --request POST 'https://craft-gql-bug.ddev.site/api' \
--header 'Authorization: Bearer _AZL0f9hx95QXMNYDPxEzTSJBU2MnxMf' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"query MyQuery {\n  entry(id: \"2\") {\n    id\n    ... on testPage_testPage_Entry {\n      id\n      testPublicField\n      testPrivateField\n    }\n  }\n}","variables":{}}'
```

#### To make a request that succeeds (doesn't request the private field):

```sh
curl --location --request POST 'https://craft-gql-bug.ddev.site/api' \
--header 'Authorization: Bearer _AZL0f9hx95QXMNYDPxEzTSJBU2MnxMf' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"query MyQuery {\n  entry(id: \"2\") {\n    id\n    ... on testPage_testPage_Entry {\n      id\n      testPublicField\n    }\n  }\n}","variables":{}}'
```
