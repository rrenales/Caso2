#!/bin/bash

#Script para lanzar todos los palybooks de ansible.

# Lanzamos el playbook de tareas previas de configuración para todos los hosts 
ansible-playbook -i hosts pre.yaml

# Lanzamos el playbook de configuración e instalación del servidor nfs.
ansible-playbook -i hosts -l nfs nfs.yaml

# Lanzamos el playbook de configuración e instalación de kubernetes para todos los hosts excepto nfs.
ansible-playbook -i hosts -l workers,master pre-k8s.yaml

# Lanzamos el playbook de configuración  de kubernetes para el nodo master.
ansible-playbook -i hosts -l master k8s.yaml 

# Lanzamos el playbook de configuración  de kubernetes para los workers.
ansible-playbook -i hosts -l master workers.yaml 