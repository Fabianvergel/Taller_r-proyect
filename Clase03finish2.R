# Elaborado por: Fabian Vergel Ojeda
# Colaborador:
# Fecha elaboracion: 18/03/2022
# Fecha ultima modificacion: 18/03/2022

#Initial configuration
rm(list = ls()) #limpiar entorno
pacman::p_load(tidyverse,haven,readxl,WriteXLS) #cargar paquetes


a=2
b='2'

vector_c = c("hola",'a') # podemos usar ' o " para caracteres
is.character(vector_c)
is.character('hola') #Verifica si es un caracter




char_vec = c("a","b","c","r","d","a","e","c","a","r","r")


vector2 = c(1,2,"c") #ojo ?Ojo! Los elementos no son homogeneos
vector3 = c(1,2)

is.numeric(vector2)
is.numeric(vector3)      
is.numeric(char_vec)

as.numeric(c(1,2,'c')) #Como la c no es un numero y no la puede convertir en un numero, entonces la convierte en un "na"
as.numeric(c(1,2,'3')) #Convierte el caracter '3' en un numero

a=c(1,2,'3')
c=as.numeric(a)

char_vec[5] #ya tengo creado el vector y solicito que solo quiero la posicion del elemento 5 del conjunto de elementos
char_vec[1:5] #asi solicito que quiero desde el elemento "1" hasta el "5"
char_vec = char_vec[-5] #Asi le digo que sobreescriba sobre el vector original y que me elimine el elemento "5" (" (tengo que copiar en el siguiente rengl?n nuevamente el vector "char_vec" para que se ejecute bien la funci?n))
char_vec


#Matrices
matriz_n = matrix(rnorm(n = 25,mean = 100 ,sd = 10) , nrow = 5, ncol = 5)

matriz_n[1,] #cuando digito la funcion en la consola puedo ver todo el cuadro de informacion

matriz_n[1,2] #filas y columnas


#Dataframes
1:10
seq(1,15,3)
nota_numerica = seq(0,10,2)
nota_numerica
nota_alfabetica = c("a","b","b","a","c","b")
nota_alfabetica
dfm = data.frame(nota_numerica,nota_alfabetica) # Creamos el dataframe

# elementos de un dataframe
dfm 
dfm[5,2]
dfm[,1]

Lista_1=list()
Lista_1[[1]]=dfm #tengo un elemento con una lista, dataframe
Lista_1[[2]]= matriz_n #tengos dos elementos, el segundo es una matriz de 5x5


Lista_1[[1]] #De esta manera solicito  el elemento [[1]] de la lista y puedo hacer cambios.
Lista_1[[1]][,1] #De esta manera le digo que me muestre solo la columna 1 de ese dataframe
Lista_1[[1]][1,] #De esta manera le digo que me muestre solo la fila 1 de ese dataframe



#Importar base de datos

