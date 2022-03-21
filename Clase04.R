# Elaborado por: Fabian Vergel Ojeda
# Colaboradores:
# Fecha elaboracion: 19/03/2022
# Fecha ultima modificacion: 19/03/2022


# intial configuration
rm(list = ls()) # limpia el entorno de R
pacman::p_load(tidyverse,readxl,haven) # cargar y/o instalar paquetes a usar

# tydyverse
browseURL(url = "https://www.tidyverse.org", browser = getOption("browser"))


#----------------#
# 1. Data Tyding #
#----------------#

#### 1.1 Cargar bases de datos
browseURL(url = "https://www.dane.gov.co/index.php/estadisticas-por-tema/demografia-y-poblacion/proyecciones-de-poblacion", browser = getOption("browser")) # Fuente: DANE
dane = readRDS(file = 'data4/input/proyecciones DANE.rds') %>% 
       dplyr::select(.,name_codigo , year , total_poblacion , codigo) # Le estoy diciendo que solo me extraiga esos elementos de la tabla


#### 1.2 Generar variables en un dataframe
dane = mutate(dane , colombia = 1 ) #voy agregar un columna que se llamara colombia que en todas las filas va a tener el numero "1"
dane$dummy = 1 # cumple la misma funcion de "mutate"
dane$codigo = 2 # En este caso como ya existe la variable codigo entonces me sobrescribe los elementos con el nuevo que es "2"

#### 1.2.1 Generar variable usando el codigo dane
nchar('hola mundo')

dane = mutate(dane , depto = ifelse(test = nchar(codigo) == 2 , yes = 1 , no = 0)) # Crear variable usando mutate

dane$codigo # vector 
dane$mpio = ifelse(test =  dane$depto == 0 & nchar(dane$codigo) > 2 , yes = 1, no = 0) # Crear variable usando vector

#### 1.2.2 Rellenar con el nombre del municipio
dane_mpio = subset(dane , mpio == 1) # Crear otra dataframe tomando la base que es"dane"

substr(x = 'Hola' , start = 2, stop = 4) # cuando se corre ese comando, le voy a decir que me devuelva desde la letra #2, es decir, desde la letra “o” hasta la letra #4 que es la letra “a”
substr(x = 'Hola' , start = 1, stop = 3)
str_locate(string = "Hola - todos" ,pattern = '-') # Veamos la funcion str_locate()

dane_mpio = mutate(dane_mpio , name = substr(x =  name_codigo ,start = 1 , stop =  str_locate(string = name_codigo,pattern = '-')))  #Crear nueva variable que me devuelve los caracteres de los municipios hasta el guion medio

#### 1.2.3 Limpiar el nombre del municipio
gsub(pattern = "ol",replacement = "-",x = "Hola") # Es una función que se utiliza para reemplazar algunos caracteres, cadenas o vectores.

dane_mpio = mutate(dane_mpio , name = gsub(pattern = " -",replacement = "" ,x = name)) # Reemplazar el caracter del guion medio que acompaña a medellin y colocar un caracter vacio



#### 1.3 Exportar la base de datos
dane_mpio = dane_mpio[,c('codigo','name','year','total_poblacion')] # Tomar del dataframe solo las varaibles mencionada en la funcion
saveRDS(object = dane_mpio , file = "data4/output/proyecciones DANE.rds") # Guardar o exportar este script en la ubicacion seleccionada, tiene que coincidir con la que me base al incio


#--------------------------------#
# 2.Filtrar (filas y/o columnas) # 
#--------------------------------#

#### 2.0. cargar bases de datos
browseURL(url = "https://www.policia.gov.co/grupo-información-criminalidad/estadistica-delictiva", browser = getOption("browser")) # Fuente: DANE
data = read_excel("data4/input/homicidios-2020.xlsx")

#### 2.1 Seleccionar columnas de un dataframe usando los nombre de las variables
colnames(data) # Inspeccionar los nombres de las variables, verificar los nombres de un dataframe

