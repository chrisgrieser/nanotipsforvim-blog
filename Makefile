.PHONY: new_from_template publish_most_recent publish_meta help

publish_most_recent:
	most_recent="./articles/$$(ls -t "./articles/" | head -n1)" && \
	url=$$(scp "$$most_recent" prose.sh:/ 2>&1 | sed 's/[[:space:]]*$$//') && \
	echo "$$url" | pbcopy ; \
	open "$$url"

new_from_template:
	iso_today=$$(date +"%Y-%m-%d") && \
	cat template.md | sed "s/ISO_DATE/$$iso_today/" >"./articles/Untitled.md" && \
	open "./articles/Untitled.md"

publish_meta:
	scp ./_*.{md,css} prose.sh:/

help:
	open "https://pico.sh/prose"
