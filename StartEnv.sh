#!/bin/bash

./1_SetupWSLForGitBash/Setup_14_RestartWSL_GitBash.sh
./1_SetupWSLForGitBash/Setup_13_SetupDockerCommandsForGitBash_GitBash.sh
wsl -e bash -c "echo muric | sudo -S ls | ./1_SetupWSLForGitBash/Setup_15_DockerToUseDaemonJsonConfig_WSL.sh"
wsl -e bash -c "echo muric | sudo -S ls | ./3_SetupWSLForKubernetes/Setup_2_Install_Kubectl_WSL.sh"
wsl -e bash -c "echo muric | sudo -S ls | ./3_SetupWSLForKubernetes/Setup_3_Configure_Kubeadm_WSL.sh"
wsl -e bash -c "echo muric | sudo -S ls | ./4_StartDockerRegistry/Setup_1_StartDockerRegistry_GitBash.sh"
wsl -e bash -c "echo muric | sudo -S ls | ./5_SetupWSLForDeploymentPipelines/Setup_1_InstallGrypeToFindCodeVulnerabilities_WSL.sh"