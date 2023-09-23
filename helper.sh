set -x

init() {
    make build-docker
    cd test
    make run
    return
}

probe() {
    exec >"$FUNCNAME.log" 2>&1
    # gh repo list -h
    # gh help formatting
    # return
    gh repo list 0xPolygonHermez \
        --limit 200
    # --json name
    # --jq '.'
}

recrClone() {
    # exec > "recrClone-$(date +%Y%m%d-%H%M%S).log" 2>&1
    # org=0xPolygonHermez
    # gh repo list $org --json name
    # repos=$(gh repo list $org --json nameWithOwner $flags | jq '.[].nameWithOwner' | tr -d '"')
    # return
    local repos=$(cat fail-clone.log)
    # return
    for repo in $repos; do
        # local repoDir=$(echo $repo | tr -s '/' '-')
        # gh repo clone $repo  $repoDir
        git clone https://github.com/${repo}.git
        # git clone git@github.com:${repo}.git
        if [ "$?" != "0" ]; then
            echo "$repo" >>fail-clone.log
        fi
        # echo "111 $repo,$repoDir"
        sleep 2s
    done
    return
}


$@
