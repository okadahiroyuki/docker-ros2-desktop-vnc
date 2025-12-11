#! /bin/bash
# Copyright (c) 2022 Hiroyuki Okada
# All rights reserved.
USER_NAME:=$(shell id -un)
GROUP_NAME:=$(shell id -gn)
UID:=$(shell id -u)
GID:=$(shell id -g) 

# If the first argument is ...
ifneq (,$(findstring tools_,$(firstword $(MAKECMDGOALS))))
	# use the rest as arguments
	RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
	# ...and turn them into do-nothing targets
	#$(eval $(RUN_ARGS):;@:)
endif

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[\.0-9a-zA-Z_-]+:.*?## / {printf "\033[36m%-42s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build All 
	docker compose -f compose.build.yaml build
	@printf "\n\033[92mBuild Docker Image: all\033[0m\n"


build_cpu: ## Build HSR Humble [CPU] Container
	docker compose  -f compose.build.yaml build hsr
	@printf "\n\033[92mBuild Docker Image: okdhryk/ros:humble-hsr\033[0m\n"

build_gpu: ## Build HSR Humble [GPU] Container
	docker compose  -f compose.build.yaml build hsr-gpu
	@printf "\n\033[92mBuild Docker Image: okdhryk/cuda:12.9.1-cudnn-devel-humble-hsr\033[0m\n"

run_cpu:  ## Run HSR Humble [CPU] Container
	docker compose up -d hsr && docker compose exec -ti hsr tmux
	@printf "\n\033[92mRun HSR Humble CPU : okdhryk/ros:humble-hsr\033[0m\n"

run_gpu:  ## Run HSR Humble [GPU] Container
	docker compose up -d hsr-gpu && docker compose exec -ti hsr-gpu tmux
	@printf "\n\033[92mRun HSR Humble GPU : okdhryk/cuda:12.9.1-cudnn-devel-humble-hsr\033[0m\n"
