---
id: Review
aliases: 
tags:
---

### Domains

| Domain                                    | Percentage |     |
| :---------------------------------------- | :--------- | --- |
| General Security Concepts                 | 12%        |     |
| Theats, Vulnerabilities, and Midigations  | 22%        |     |
| Security Architecture                     | 18%        |     |
| Security Operations                       | 28%        |     |
| Security Program Management and Oversight | 20%        |     |


### Test Structure

- 90 minutes up to 90 questions
- 3-5 Performance based questions at the beginning
- other questions are multiple choice
- 750/900 points to pass
- Exam Fee $400 (Dion voucher 10%)

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Security",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```