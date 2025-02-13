# SecurityIAM-S3
Se buscar configurar permisos en un bucket de S3 utilizando IAM, asegurando accesos adecuados de lectura y escritura según el tipo de usuario, habilitar seguridad con cifrado y bloqueo público, y auditar las actividades con CloudTrail.

### Procedimiento

1. Se generaró un bucket en S3 con dos carpetas: una pública y otra privada.
           Se habilitó el cifrado SSE-S3
		   Se cargaron archivos prueba en cada una de las carpetas
2.  Se crearon políticas específicas para cada carpeta.
		- `s3:ListBucket` sobre `arn:aws:s3:::bucket-lab-iam`
		- `s3:GetObject` sobre `arn:aws:s3:::bucket-lab-iam/public/*`
		- **No** permitir acceso a `bucket-lab-iam/private/*`
3.  Se creó un grupo, se le asociaron dos usuarios de prueba y se le asignaron las políticas previamente creadas.
4.  Se creo un rol específico para EC2 y se creó una instancia en EC2 para probar el rol y los permisos de las carpetas den el bucket.

------------

### Pruebas de Validación

- Usuario 1:
		Listar el Bucket:

    ![list_usuario_1](https://github.com/user-attachments/assets/21badb2e-faef-4269-9961-7a3fccc3a258)

		 Descargar de la carpeta public:

    ![Descarga_usuario1](https://github.com/user-attachments/assets/b6808f6a-7a9a-489d-ae31-f3d25907d66e)

		 Subir objeto a la carpeta public:

    ![cargar_archivo_usuario_1](https://github.com/user-attachments/assets/28a1c591-0179-4a8d-9fce-c47974c8d7e1)

		 Borrar objeto a la carpeta public:

    ![borrar_usuario1](https://github.com/user-attachments/assets/7f33df9c-e119-4ed2-8e01-092cfe820a2b)

     Leer archivo de la carpeta private:

    ![leer_usuario1](https://github.com/user-attachments/assets/da2caf4c-3a65-4427-b39f-e8076d9427ad)

------------

- Usuario 2:
		Listar el Bucket:

    ![list_usuario_2](https://github.com/user-attachments/assets/3b801809-6b72-47eb-9e92-79716ec78603)
  
		 Leer de la carpeta private:

    ![leer_usuario2](https://github.com/user-attachments/assets/48d5bb0a-b590-4759-baca-3214cdd62e1d)

		 Descargar de la carpeta public:
  
    ![Descarga_usuario2](https://github.com/user-attachments/assets/d62abaec-baa3-48d7-9768-4e178b71c386)

		 Subir objeto a la carpeta public:

    ![cargar_archivo_usuario_2](https://github.com/user-attachments/assets/e772fde3-bed8-4e4f-bcc7-4ab2dd019649)

		 Borra objeto a la carpeta public:

    ![borrar_usuario2](https://github.com/user-attachments/assets/ff867eab-6dae-43ad-af24-56b68f75b0e2)

------------


- Usuario Admin
		Listar el Bucket:

    ![listar_admin](https://github.com/user-attachments/assets/e9aff651-14d2-4392-99e7-12a9e34258a7)

		 Leer archivos:

  ![leer_admin1](https://github.com/user-attachments/assets/b046798d-f8d5-497b-bb58-65ca00941432)

  ![leer_admin2](https://github.com/user-attachments/assets/1e8bc300-ce6d-4bb4-9abe-e63f6415cb36)

		 Subir objeto a la carpeta public:

  ![cargar_archivo_admin](https://github.com/user-attachments/assets/4815c689-c452-48ce-9ec8-6f76c49f57e3)

		 Borra objeto a la carpeta public:

  ![borrar_admin](https://github.com/user-attachments/assets/39d4f729-d080-4e65-8459-2c2b4781df18)

------------

- EC2
		Listado y lectura:
  ![listado_liectura_ec2](https://github.com/user-attachments/assets/ad27d4f6-ade3-4c41-bac1-82d8a6be745e)

		 Carga y descarga:
![carga y descarga ec2](https://github.com/user-attachments/assets/b46d5537-22b4-4b4f-b5a7-056d8c6d23d6)
  
------------
- Rol IAM asociado a EC2:

![Rol de IAM asociado a EC2](https://github.com/user-attachments/assets/60dd75bf-d608-4c92-acc9-11194242dca2)
  
- Configuración EC2:

  ![configuracion_EC2S3ReadOnlyRole](https://github.com/user-attachments/assets/e8682f02-03b8-4bb5-81c4-ec5fc5010791)


