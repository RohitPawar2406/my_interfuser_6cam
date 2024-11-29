#!/bin/bash
export DATA_ROOT=dataset
export YAML_ROOT=data_collection/yamls
export CARLA_ROOT=/scratch/rohit.pawar/new_interfuser/my_interfuser_6cam/carla
export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:leaderboard
export PYTHONPATH=$PYTHONPATH:leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:scenario_runner

export LEADERBOARD_ROOT=leaderboard

export CHECKPOINT_ENDPOINT=${DATA_ROOT}/weather-2/results/routes_town02_short.json
export SAVE_PATH=${DATA_ROOT}/weather-2/data
export TEAM_CONFIG=${YAML_ROOT}/weather-2.yaml
export TRAFFIC_SEED=20004
export CARLA_SEED=20004
export SCENARIOS=${LEADERBOARD_ROOT}/data/scenarios/town02_all_scenarios.json
export ROUTES=${LEADERBOARD_ROOT}/data/training_routes/routes_town02_short.xml
export TM_PORT=20504
export PORT=20004
export HOST=localhost
export CHALLENGE_TRACK_CODENAME=SENSORS
export DEBUG_CHALLENGE=0
export REPETITIONS=1 # multiple evaluation runs
export TEAM_AGENT=${LEADERBOARD_ROOT}/team_code/auto_pilot.py # agent
export RESUME=True

python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
--scenarios=${SCENARIOS}  \
--routes=${ROUTES} \
--repetitions=${REPETITIONS} \
--track=${CHALLENGE_TRACK_CODENAME} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--debug=${DEBUG_CHALLENGE} \
--record=${RECORD_PATH} \
--resume=${RESUME} \
--port=${PORT} \
--host=${HOST} \
--trafficManagerPort=${TM_PORT} \
--carlaProviderSeed=${CARLA_SEED} \
--trafficManagerSeed=${TRAFFIC_SEED}
