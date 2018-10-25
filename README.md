# README : Allsdoctors

Bonjour! L'équipe est composée de Fred (FredS), Axel Pélerin et Juliette Audema. 

Ce programme est une app Ruby on Rails qui contient beaucoup de fichiers dont ceux sur lesquels nous avons travaillé, à savoir : les models, les fichiers de migration, le seed ainsi que le fichier de base de données (developpement.sqlite3).

Le but de l'appli sera d'être une plateforme pour concurrencer Doctolib. Donc une plateforme où des patients peuvent prendre rdv avec des doctors.


## Les Models et tables créés et leurs liens entre eux

- Un model Doctor, qui a comme attributs : un first_name, qui est un string ; un last_name, qui est un string ; un postal_code, qui est un integer
- Un model Patient, qui a comme attributs : un first_name, qui est un string ; un last_name, qui est un string
- Un model Appointment, qui a comme attributs : une date, qui est un datetime
- Un model City, qui a comme attribut: un name, qui est un string
- Un model Specialty, qui a comme attribut: un name, qui est un string

Bien entendu chaque Model a été créé avec sa table correspondante.

Les liens entre ces Models: 
- Un appointment ne peut avoir qu'un seul doctor, mais un doctor peut avoir plusieurs appointment.
- Un appointment ne peut avoir qu'un seul patient, mais un patient peut avoir plusieurs appointment.
- Un doctor peut avoir plusieurs patients, au travers des appointments, et vice versa.
- Un doctor, un patient, et un rendez-vous appartiennent tous à une city. Une city peut avoir plusieurs docteurs, patients, et rendez-vous.
- Un docteur a plusieurs specialty, et une specialty peut concerner plusieurs doctors.



## Comment se servir du programme 

Pour faire marcher ce programme, il vous faut d'abord faire ```$ bundle install``` ensuite ```$ rails db:migrate``` et pour terminer ```$ rails db:seed```

## L'arborescence du dossier et les programmes

Dans ce dossier vous allez trouver l'arborescence classique des apps Ruby on Rails.


## Ce qui a été fait:

1) Nous avons créé les models et les tables associés pour les objets "Doctor", "Patient", "Appointment", "City" et "Specialty".

2) Nous les avons réliés selon les liens suivants:
- Apointment:  belongs_to :doctor, belongs_to :patient, belongs_to :city ;
- City : has_many :patients, has_many :doctors, has_many :appointments ;  
- Doctor : has_many :appointments et has_many :patients, through: :appointments et has_and_belongs_to_many :specialties et  belongs_to :city
- Patient :  has_many :appointments et has_many :doctors, through: :appointments et belongs_to :city
- Specialty :   has_and_belongs_to_many :doctors

Nous avons créé une JoinTable entre Specialty et Doctor


3) Nous avons aussi injecté directement des données dans la base de données à partir du fichier seeds.rb tout en utilisant la Gem Faker afin d'avoir des données plus réalistes.
