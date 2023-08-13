#!/bin/bash

echo "This is main script"
sh ../ShellScripts/1_download-packages.sh
sh ../ShellScripts/2_configure_network.sh
sh ../ShellScripts/3-configure_firealld_selinux.sh
sh ../ShellScripts/4_config_crictl.sh
sh ../ShellScripts/kubernetes_images.sh
sh ../ShellScripts/5_install_helm.sh