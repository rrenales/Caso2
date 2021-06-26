En este fichero dejare cosas importantes documentadas.

-----------------------
pre-conf.yaml

La solucion de configurar el timezone + ntp, lo he encontrado aqui: https://github.com/lbischof/ansible-playbooks/blob/master/tasks/timedate.yml

-----------------------

-----------------------
el rol nfs, la idea la he tomado de esta web:

https://github.com/sbadia/ansible-nfs/blob/master/server/tasks/main.yml

no esta copiado ya se puede ver en el codigo.

El rol, instala y configura el servicio, el fichero /etc/exports, mi idea es aprobechar el fichero .j2 para usar las varaibles terraform y sacar la ip de la maquina, ya veremos si es posible.
-----------------------

-----------------------
k8s.yaml

este playbook se va a encargar de configurar tanto la resolucion dns como la instalación de kubernetes en el master y workers.

-----------------------