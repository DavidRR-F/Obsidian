


```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Networking",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```
