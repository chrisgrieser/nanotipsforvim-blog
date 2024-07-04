set quiet := true

#───────────────────────────────────────────────────────────────────────────────

publish_most_recent:
    #!/usr/bin/env zsh
    most_recent="./articles/$(ls -t "./articles/" | head -n1)"
    url=$(scp "$most_recent" prose.sh:/ 2>&1 | sed 's/[[:space:]]*$//')
    echo "$url" | pbcopy
    open "$url"

new_from_template:
    #!/usr/bin/env zsh
    iso_today=$(date +"%Y-%m-%d")
    cat template.md | sed "s/ISO_DATE/$iso_today/" >"./articles/Untitled.md"
    open "./articles/Untitled.md"

update_blog_config:
    scp ./_*.{md,css} prose.sh:/

show_help:
    open "https://pico.sh/prose"
