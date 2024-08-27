set quiet := true

publish_most_recent:
    #!/usr/bin/env zsh
    cd "./articles" || return 1
    most_recent=$(ls -t | head -n1)
    if [[ "$most_recent" == "Untitled.md" ]]; then
        slug_title=$(cat "$most_recent" | 
            grep --max-count=1 '^title: ' | 
            tr -d '?!' | 
            sed -e 's/title: //' -e 's/[^A-Za-z0-9]/-/g' | 
            tr "A-Z" "a-z")
        mv "$most_recent" "$slug_title.md"
        most_recent="$slug_title.md"
    fi
    url=$(scp "$most_recent" prose.sh:/ 2>&1 | sed 's/[[:space:]]*$//')
    echo "$url" | pbcopy
    open "$url"

    git add "$most_recent"
    git commit -m "publish: $most_recent"
    git push

new_from_template:
    #!/usr/bin/env zsh
    iso_today=$(date +"%Y-%m-%d")
    cat template.md | sed "s/ISO_DATE/$iso_today/" >"./articles/Untitled.md"
    open "./articles/Untitled.md"

update_blog_config:
    scp ./_*.{md,css} prose.sh:/

# https://pico.sh/ui#ssh-tui
prose_dashboard:
    ssh prose.sh

show_help:
    open "https://pico.sh/prose"
