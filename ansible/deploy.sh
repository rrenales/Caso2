#!/bin/bash

#Script para lanzar todos los palybooks de ansible.

# Lanzamos el playbook de tareas previas de configuración para todos los hosts 
ansible-playbook -i hosts pre.yml

# Lanzamos el playbook de configuración e instalación del servidor nfs.
ansible-playbook -i hosts -l nfs nfs.yml

# Lanzamos el playbook de configuración e instalación de kubernetes para todos los hosts excepto nfs.
ansible-playbook -i hosts -l workers,master k8s.yaml pre.yml