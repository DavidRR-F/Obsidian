


# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "{{title}}",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```

## Questions

