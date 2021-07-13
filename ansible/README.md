El Orden de ejecución de los playboks es el siguiente:

1- Se ejecuta en todos los hosts pre.yaml. Con las tareas comunes en todos los hosts.

2- En el host master el nfs.yaml. Configuramos el servidor nfs.

3- En el master i el worker pre-k8s.yaml. Donde instalamos i configuramos kub8s.

4- En el master k8s.yaml. Donde configuramos k8s e instalamos los paquetes necesarios además de iniciar la redi crear el token para añadir los workers.

5- En el worker ejecutamos workers.yaml. Configuramos las reglas de fw e añadimos el worker al nodo.

6- En el master k8s-master.yaml. configuración  de ingress i creacion usuario kubeadmin en el master

7- En el master deploy-app.yaml. Lanzamos la aplicación Powerdns en el slave.
