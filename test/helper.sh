set -x

run(){
    # make run
    make run-explorer
}
containers() {
    exec > "$FUNCNAME.log" 2>&1
    # docker-compose ps --all --format json >tmp-containers.json
    docker-compose ps --all
}
probe(){
    grep -irE 'STATEDB.*:|POOLDB.*:|EVENTDB.*:|NETWORK'  Makefile
}
probeL1() {
    # exec > "$FUNCNAME.log" 2>&1

    # docker-compose exec -T zkevm-mock-l1-network uname -a
    # docker-compose exec -T zkevm-mock-l1-network geth --help
    # docker-compose exec -T zkevm-mock-l1-network geth version
    # docker-compose exec -T zkevm-mock-l1-network geth license
    # docker-compose logs --help
    docker-compose logs \
        --no-log-prefix \
        --no-color \
        zkevm-mock-l1-network
    # --tail 10 \
}

probeStateDB(){
    NAME=zkevm-state-db
    CONN="--pset pager=0 --host localhost --port 5432 state_db  state_user"
    # CONN="--list --host localhost --port 5432 --no-password state_db  state_user"
    cd test
    # exec > "$FUNCNAME.log" 2>&1
    # docker-compose exec -T $NAME psql --help
    # docker-compose exec -T $NAME psql --version
    # docker-compose exec -it $NAME psql --command '\pset pager 0' $CONN 
    docker-compose exec -it $NAME psql --command '\?' $CONN 
    # docker-compose exec -it $NAME psql $CONN  < psqldb.sql
    # docker-compose exec -T $NAME psql --host localhost --port 5432 state_db  state_user
    # docker-compose exec -T $NAME psql --version
    return
    docker-compose logs \
        --no-log-prefix \
        --no-color \
        $NAME
}

$@
