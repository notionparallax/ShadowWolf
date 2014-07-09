remove IDs:

`^.*\"_id\": \{.*$`

remove created and updated:
`^.*\"created_at\": .*$`
`^.*\"updated_at\": .*$`

pull out blank lines:
`\n(\n)    to   $1`

truncate long lines:
`": "([^"]{0,100})[^"]*    to   ": "$1`