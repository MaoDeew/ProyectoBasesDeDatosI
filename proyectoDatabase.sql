CREATE TABLE Empresa (
  id_empresa int(30) NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  direccion varchar(255) NOT NULL,
  NIT varchar(15) NOT NULL,
  telefono varchar(15) NOT NULL,
  PRIMARY KEY (id_empresa)
);

CREATE TABLE Administrador (
  id_administrador int(11) NOT NULL AUTO_INCREMENT,
  id_empresa int(30) NOT NULL,
  nombre varchar(20) NOT NULL,
  usuario varchar(60) NOT NULL,
  password varchar(50) NOT NULL,
  cedula varchar(15) NOT NULL,
  PRIMARY KEY (id_administrador),
  FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE Vendedor(
  id_vendedor integer(11) NOT NULL AUTO_INCREMENT,
  id_administrador int(11) NOT NULL,
  nombre varchar(30) NOT NULL,
  usuario varchar(30) NOT NULL,
  password varchar(50) NOT NULL,
  direccion varchar(60) NOT NULL,
  telefono varchar(30) NOT NULL,
  cedula varchar(30) NOT NULL,
  apellido varchar(30) NOT NULL,
  fechaLogIn date NOT NULL DEFAULT "0000-00-00",
  PRIMARY KEY (id_vendedor),
  FOREIGN KEY (id_administrador) REFERENCES Administrador(id_administrador)
);

CREATE TABLE EstadisticaVendedor(

	id_estadistica_vendedor INTEGER(11) NOT NULL AUTO_INCREMENT,
	numero_contratos INTEGER(11) NOT NULL,
	numero_contratos_tramite INTEGER(11) NOT NULL,
	numero_contratos_completados INTEGER(11) NOT NULL,
	numero_contratos_favoritos INTEGER(11) NOT NULL,
	id_vendedor integer(11) NOT NULL,
	PRIMARY KEY (id_estadistica_vendedor),
	FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
	);

CREATE TABLE Agenda(

	id_agenda INTEGER(11) NOT NULL AUTO_INCREMENT,
	nombre_agenda VARCHAR(250) NOT NULL,
	id_vendedor integer(11) NOT NULL,
	PRIMARY KEY (id_agenda),
	FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
	);


CREATE TABLE Estado(
  id_estado int(11) NOT NULL,
  nombre_estado varchar(40) NOT NULL,
  PRIMARY KEY (id_estado)
);

CREATE TABLE Evento(

	id_evento INTEGER(11) NOT NULL AUTO_INCREMENT,
	id_agenda INTEGER(11) NOT NULL,
	fecha_evento DATE NOT NULL DEFAULT "0000-00-00",
	titulo VARCHAR(250) NOT NULL,
	ubicacion VARCHAR(250) NOT NULL,
	descripcion VARCHAR(400) NOT NULL,
	hora_evento TIME NOT NULL,
	PRIMARY KEY (id_evento),
	FOREIGN KEY (id_agenda) REFERENCES Agenda(id_agenda)
	);



CREATE TABLE Documento(

	id_documento INTEGER(11) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(250) NOT NULL,
	tipo_archivo VARCHAR(250) NOT NULL,
	id_vendedor INTEGER(11) NOT NULL,
	PRIMARY KEY (id_documento),
	FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
	);


CREATE TABLE categorias (

    id_categoria tinyint(3) NOT NULL AUTO_INCREMENT,
    categoria varchar(120) NOT NULL,
    PRIMARY KEY (id_categoria)
    );


CREATE TABLE deptos (

    id_depto tinyint(3) NOT NULL AUTO_INCREMENT,
    depto varchar(30) NOT NULL,
    PRIMARY KEY (id_depto)
    );

CREATE TABLE tipos (
  id_tipo tinyint(3) NOT NULL AUTO_INCREMENT,
  tipo varchar(60) NOT NULL,
  PRIMARY KEY (id_tipo)
);


  CREATE TABLE contratos (

    id_contrato int(8) NOT NULL AUTO_INCREMENT,
    id_tipo tinyint(3) NOT NULL DEFAULT '0',
    fecha_publicacion date NOT NULL DEFAULT '0000-00-00',
    hora_publicacion time NOT NULL,
    id_categoria tinyint(3) NOT NULL,
    id_entidad varchar(255) NOT NULL,
    numero_proceso varchar(100) NOT NULL,
    objeto varchar(3000) NOT NULL,
    id_depto tinyint(3) NOT NULL,
    presupuesto bigint(20) NOT NULL,
    pagina_web varchar(500) NOT NULL,
    descripcion varchar(500) NOT NULL,
    PRIMARY KEY (id_contrato),
    FOREIGN KEY (id_tipo) REFERENCES tipos(id_tipo),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_depto) REFERENCES deptos(id_depto)

    );

CREATE TABLE ContratoGuardado(

	id_contrato_guardado INTEGER(11) NOT NULL AUTO_INCREMENT,
	id_estado INTEGER(11) NOT NULL,
	id_vendedor INTEGER(11) NOT NULL,
	id_contrato int(8) NOT NULL,
	PRIMARY KEY (id_contrato_guardado),
	FOREIGN KEY (id_estado) REFERENCES Estado(id_estado),
	FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
	FOREIGN KEY (id_contrato) REFERENCES Contratos(id_contrato)
	);

-----------------------------------------------------------------------INSERTS---------------------------------------------------------------------------------
INSERT INTO Empresa VALUES (1,"SerFin","Calle 222 #54-88",8706879021,6987554);

INSERT INTO ContratoGuardado VALUES
(1,1,3,1001700),
(2,1,4,1001709),
(3,1,8,1001707);

INSERT INTO EstadisticaVendedor VALUES
(1,0,0,0,0,3),
(2,0,0,0,0,7),
(3,0,0,0,0,4),
(4,0,0,0,0,8);


INSERT INTO Administrador VALUES
(1,1,"Mauricio Sánchez","mauro",MD5("123mauro"),"1.019.128.936"),
(2,1,"Santiago Dorado","santi",MD5("123santi"),"1.019.128.936"),
(3,1,"David Gorricho","david",MD5("123david"),"1.019.128.936"),
(4,1,"Julian Pinzon","juli",MD5("123juli"),"1.019.128.936"),

INSERT INTO `vendedor` (`id_vendedor`, `id_administrador`, `nombre`, `usuario`, `password`, `direccion`, `telefono`, `cedula`, `apellido`, `fechaLogIn`) VALUES
(3, 1, 'Pedro', 'pedrito', 'c56f12c1bc0366b28af457ed844b6858', 'Cra 9 #167-87', '8974562', '58741258', 'Gutierrez', '2017-04-11'),
(4, 1, 'Daniel', 'dani', '666e8681000a451e5afd9a9d309b1d37', 'Calle 127 #43-05', '3658841', '1018789456', 'Santamaria', '2017-04-14'),
(7, 1, 'Andrea', 'andrea', 'a029b4e5b62a4805c3aa9cbd96b693eb', 'Avenida Esperanza #41-78', '8475566', '78963258', 'Torres', '2017-04-11');

INSERT INTO tipos (`id_tipo`, `tipo`) VALUES
(1, 'Licitación Pública'),
(2, 'Contratación Directa Menor Cuantía'),
(3, 'Subasta'),
(4, 'Concurso de Méritos abierto'),
(5, 'Selección Abreviada de Menor Cuantía (Ley 1150 de 2007)'),
(6, 'Contratación Directa (Ley 1150 de 2007)'),
(7, 'Contratación Mínima Cuantía'),
(8, 'Concurso de Méritos con Lista Corta'),
(9, 'Concurso de Méritos con Lista Multiusos'),
(10, 'Selección Abreviada del literal h del numeral 2 del artículo'),
(11, 'Selección Abreviada servicios de Salud'),
(12, 'Asociación Público Privada'),
(13, 'Invitación ofertas cooperativas o asociaciones de entidades '),
(14, 'Lista Multiusos'),
(15, 'Otras Formas de Contratación Directa'),
(16, 'Régimen Especial');


INSERT INTO `categorias` (`id_categoria`, `categoria`) VALUES
(1, 'Construcción - Edificaciones'),
(2, 'Construcción - Espacio público'),
(3, 'Construcción - Redes de servicios'),
(4, 'Construcción - Eléctricos y Telecomunicaciones'),
(5, 'Construcción - Vías y puentes'),
(11, 'Ingeniería Ambiental y Forestal'),
(12, 'Consultorías'),
(13, 'Interventorias'),
(14, 'Otros suministros de ingeniería'),
(15, 'Otros servicios de ingeniería'),
(16, 'Alimentos, Bebidas y Tabaco'),
(17, 'Artículos Aseo - Cafetería, Equipos y Suministros de Limpieza'),
(18, 'Artículos Domésticos, Suministros y Productos Electrónicos de Consumo'),
(19, 'Articulos Ferreteria, Maquinaria Menor y Herramienta en General.'),
(20, 'Combustibles, Aditivos para Combustibles, Lubricantes y Anticorrosivos'),
(21, 'Componentes y Suministros Electrónicos'),
(22, 'Dotaciones de Personal'),
(23, 'Equipo, Accesorios y Suministros Médicos'),
(24, 'Equipos de deporte y recreacion, Instrumentos Musicales'),
(25, 'Equipos Informáticos y Periféricos, vigilancia y Comunicaciones'),
(26, 'Equipos y Suministros de Laboratorio, de Medición, de Observación y de Pruebas'),
(27, 'Equipos y Suministros para Impresión, Fotografia y Audiovisuales'),
(28, 'Maquinaria y Accesorios para Construcciòn, Mineria, Agricultura e Industria'),
(29, 'Material Mineral, Textil y Vegetal y Animal No Comestible'),
(30, 'Material Químico incluyendo Bioquímicos y Materiales de Gas'),
(31, 'Material Vivo Vegetal y Animal, Accesorios y Suministros'),
(32, 'Materiales y Articulos educativos'),
(33, 'Materiales, Equipos, Suministros y Accesorios de Oficina.'),
(34, 'Medicamentos y Productos Farmacéuticos'),
(35, 'Muebles, Mobiliario y Decoración'),
(36, 'Otros Suministros'),
(37, 'Publicaciones Impresas, Servicios Editoriales, Artes Graficas, Señalización y Fotocopiado'),
(38, 'Servicios de Aseo, Limpieza, Descontaminación y Tratamiento de Residuos'),
(39, 'Servicios de Contratacion Agrícola, Pesquera, Forestal y de Fauna'),
(40, 'Servicios de Gestion, Servicios Profesionales de Empresa y Servicios Administrativos'),
(41, 'Servicios de Minería, Petróleo y Gas'),
(42, 'Servicios de Organizaciones y Eventos - Logistica.'),
(43, 'Servicios de Producción Industrial y Manufactura'),
(44, 'Servicios de Salud, Empleos, otros'),
(45, 'Servicios de Transporte, Almacenaje y Correo'),
(46, 'Servicios de Viajes, Alimentación, Alojamiento y Entretenimiento'),
(47, 'Servicios de Vigilancia, Defensa Nacional, Orden Publico y Seguridad'),
(48, 'Servicios Educativos y de Formación'),
(49, 'Servicios Financieros y de Seguros'),
(50, 'Servicios Medioambientales'),
(51, 'Servicios Políticos y de Asuntos Cívicos'),
(52, 'Servicios Públicos y Servicios Relacionados con el Sector Público'),
(53, 'Servicios y suministros de Sofware, internet y Tecnologias de la información'),
(54, 'Suministro de Personal Temporal'),
(55, 'Vehículos Comerciales, Militares y Particulares, Accesorios y Componentes'),
(70, 'Dotaciones Industriales');

INSERT INTO deptos (`id_depto`, `depto`) VALUES
(1, 'Amazonas'),
(2, 'Antioquia'),
(3, 'Arauca'),
(4, 'Atlántico'),
(5, 'Bogotá D.C.'),
(6, 'Bolívar'),
(7, 'Boyacá'),
(8, 'Caldas'),
(9, 'Caquetá'),
(10, 'Casanare'),
(11, 'Cauca'),
(12, 'Cesar'),
(13, 'Chocó'),
(14, 'Córdoba'),
(15, 'Cundinamarca'),
(16, 'Guainía'),
(17, 'Guaviare'),
(18, 'Huila'),
(19, 'La Guajira'),
(20, 'Magdalena'),
(21, 'Meta'),
(22, 'Nariño'),
(23, 'Norte de Santander'),
(24, 'Putumayo'),
(25, 'Quindío'),
(26, 'Risaralda'),
(27, 'San Andrés y Providencia'),
(28, 'Santander'),
(29, 'Sucre'),
(30, 'Tolima'),
(31, 'Valle del Cauca'),
(32, 'Vaupés'),
(33, 'Vichada'),
(34, 'Colombia');

INSERT INTO `contratos` (`id_contrato`, `id_tipo`, `fecha_publicacion`, `hora_publicacion`, `id_categoria`, `id_entidad`, `numero_proceso`, `objeto`, `id_depto`, `presupuesto`, `pagina_web`, `descripcion`) VALUES
(1001700, 3, '2017-04-01', '10:22:24', 47, 'DIRECCIÓN GENERAL DE LA POLICÍA NACIONAL (PONAL)', 'PN DIRAF SA 024 2017', 'ADQUISICIÓN DISPOSITIVO DE DISPARO ELECTRICO.', 5, 1996137000, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428434', ''),
(1001701, 1, '2017-04-01', '10:22:25', 1, 'VALLE DEL CAUCA - METROCALI', '915.108.2.03.2017', 'CONTRATAR BAJO LA MODALIDAD DE PRECIOS UNITARIOS FIJOS SIN AJUSTES, LAS ACTIVIDADES DE MANTENIMIENTO Y ADECUACION A COMPONENTES DE LA INFRAESTRUCTURA DEL SITM- MIO', 31, 5198933275, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171326', ''),
(1001702, 3, '2017-04-01', '10:22:25', 46, 'CORNARE - CORPORACIÓN AUTÓNOMA REGIONAL DE LAS CUENCAS DE RÍOS NEGRO Y NARE', '008-2017', 'SUMINISTRO DE TIQUETES AÉREOS NACIONALES E INTERNACIONALES', 2, 120000000, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428417', ''),
(1001703, 3, '2017-04-01', '10:22:25', 53, 'ANTIOQUIA - TECNOLÓGICO DE ANTIOQUIA - MEDELLÍN', '08 SA 2017', 'El Contratista suministrará al Tecnológico de Antioquia I.U., el licenciamiento, mantenimiento, actualización y soporte en el manejo de software en la modalidad Open Value Subscription y suscripción al programa MSDN Academic Alliance, acorde con las especificaciones técnicas descritas en el pliego de condiciones, ficha técnica y propuesta del adjudicatario..', 2, 130124911, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428420', ''),
(1001704, 3, '2017-04-01', '10:22:25', 33, 'ANTIOQUIA - INSTITUCIÓN UNIVERSITARIA COLEGIO MAYOR DE ANTIOQUIA - MEDELLÍN', 'SIP008-2017', 'LA INSTITUCIÓN UNIVERSITARIA COLEGIO MAYOR DE ANTIOQUIA, está interesada en recibir propuestas para el suministro de papelería, aseo y cafetería cada vez que se requiera de acuerdo a las necesidades presentadas por la Institución Universitaria Colegio Mayor de Antioquia en marco del contrato interadministrativo N° 4600069174 de 2017 suscrito entre el Municipio de Medellín - Secretaria de suministros y servicios, y La Institución Universitaria Colegio Mayor de Antioquia, de acuerdo a las especificaciones y a las condiciones comerciales que se detallan en el pliego de condiciones.', 2, 144004540, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428445', ''),
(1001705, 10, '2017-04-01', '10:22:25', 44, 'ANTIOQUIA - ALCALDÍA MUNICIPIO DE MEDELLÍN', '9011841', 'Atención Integral a personas mayores en modelo institucionalizado de larga estancia. Colonia Belencito', 2, 2864625032, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-18-6437607', ''),
(1001706, 3, '2017-04-01', '10:22:25', 19, 'DIRECCIÓN GENERAL DE LA POLICÍA NACIONAL (PONAL)', 'PN DECHO SA 001 2017', 'GRUPO 1. ¿ADQUISICION DE MATERIALES DE CONSTRUCCION, DESTINADOS PARA EL PERSONAL ADSCRITO A LA UNIPEP, UBICADOS EN EL MUNICIPIO DE VIGIA DEL FUERTE (VIDRI) ¿ CHOCO, PUNTO TRANSITORIO DE NORMALIZACION¿. GRUPO 2. ¿ADQUISICION DE EQUIPO AGRICOLA, MAQUINARIA INDUSTRIAL Y EQUIPO DE BOMBEO DESTINADOS PARA EL PERSONAL ADSCRITO A LA UNIPEP, UBICADOS EN EL MUNICIPIO DE VIGIA DEL FUERTE (VIDRI) ¿ CHOCO, PUNTO TRANSITORIO DE NORMALIZACION¿.', 13, 95828900, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428443', ''),
(1001707, 1, '2017-04-01', '10:22:25', 5, 'SANTANDER - INSTITUTO FINANCIERO PARA EL DESARROLLO DE SANTANDER - IDESAN', 'LP-01-2017', 'MANTENIMIENTO RUTINARIO DE LAS VIAS QUE SE ENCUENTRAN A CARGO DEL INSTITUTO FINANCIERO PARA EL DESARROLLO DE SANTANDER ¿ IDESAN', 28, 527850295, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171320', ''),
(1001708, 3, '2017-04-01', '10:22:25', 20, 'HUILA - ALCALDÍA MUNICIPIO DE PITALITO', 'SIP 006 DE 2017', 'SUMINISTRO DE COMBUSTIBLE PARA LOS VEHÍCULOS PERTENECIENTES A LOS ORGANISMOS DE SEGURIDAD DEL MUNICIPIO DE PITALITO', 18, 48000000, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428437', ''),
(1001709, 3, '2017-04-01', '10:22:25', 19, 'SERVICIO NACIONAL DE APRENDIZAJE (SENA)', 'SI CDATTG-004-2017', 'Contratar el suministro de materiales de ferretería, mecánica, eléctricos, veterinaria, agropecuaria y otros, para los diferentes programas de formación y sus respectivos niveles: Regular, media técnica, SER, población vulnerable, desplazada por la violencia y FIC, que se adelantan en el Sena - Centro de Desarrollo Agroindustrial Turístico y Tecnológico del Guaviare.', 17, 642089830, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428426', ''),
(1001710, 1, '2017-04-01', '10:22:25', 45, 'NORTE DE SANTANDER - ALCALDÍA MUNICIPIO DE OCAÑA', 'AMO LP SECT 001 DE 2017', 'TRANSPORTE ESCOLAR PARA EL TRASLADO DE IDA Y REGRESO DE LOS ESTUDIANTES DEL SECTOR URBANO Y RURAL DEL MUNICIPIO DE OCAÑA ¿ NORTE DE SANTANDER, HASTA LAS INSTALACIONES DE LAS INSTITUCIONES EDUCATIVAS OFICIALES Y CENTROS EDUCATIVOS RURALES, (SEDE PRINCIPAL Y DEMAS SEDES) CON EL FIN DE GARANTIZAR COBERTURA, CALIDAD EDUCATIVA Y EVITAR LA DESERCIÓN ESCOLAR', 23, 395000000, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171333', ''),
(1001711, 1, '2017-04-01', '10:22:25', 1, 'GUAVIARE - ALCALDÍA MUNICIPIO DE SAN JOSÉ DEL GUAVIARE', 'LP-001-2017', 'CONSTRUCCIÓN DE CUBIERTA Y MEJORAMIENTO DEL POLIDEPORTIVO DEL BARRIO LA GRANJA DEL MUNICIPIO DE SAN JOSE DEL GUAVIARE - GUAVIARE.', 17, 1228138073, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171329', ''),
(1001712, 1, '2017-04-01', '10:22:25', 53, 'CUNDINAMARCA - ALCALDÍA MUNICIPIO DE TOCANCIPÁ', 'LIC 003 MT 2017', 'PRESTACIÓN DE SERVICIOS DE INTERNET PARA LAS INSTITUCIONES EDUCATIVAS OFICIALES DEL MUNICIPIO DE TOCANCIPÁ CON EL OBJETIVO DE FORTALECER UNA COBERTURA EDUCATIVA CON CALIDAD AL MUNICIPIO DE TOCANCIPÁ', 15, 392381096, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171318', ''),
(1001713, 1, '2017-04-01', '10:22:25', 5, 'ANTIOQUIA - ALCALDÍA MUNICIPIO DE LA ESTRELLA', 'LP003 de 2017', 'REPARACION DE PAVIMENTO MEDIANTE EL SISTEMA DE PARCHEO Y REPAVIMENTACION, Y SEÑALIZACION HORIZONTAL EN VIAS DE LA MALLA VIAL DEL MUNICIPIO DE LA ESTRELLA. VIGENCIA 2017', 2, 1000000000, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171316', ''),
(1001714, 3, '2017-04-01', '10:22:25', 16, 'INSTITUTO NACIONAL PENITENCIARIO Y CARCELARIO (INPEC)', '303-003-17', 'Contratar la adquisición de productos alimenticios para la comercialización a través del almacén Expendio del Establecimiento Penitenciario de Mediana Seguridad y Carcelario de Cartagena, EPMSC ¿ CARTAGENA', 6, 100800202, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428438', ''),
(1001715, 3, '2017-04-01', '10:22:25', 25, 'INSTITUTO NACIONAL DE VIGILANCIA DE MEDICAMENTOS Y ALIMENTOS (INVIMA)', 'SA_ 012 DE 2017', 'Adquisición, instalación y puesta en funcionamiento de computadores de escritorio para el INVIMA', 5, 322921624, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428439', ''),
(1001716, 1, '2017-04-01', '10:22:25', 17, 'MAGDALENA - GOBERNACIÓN', 'LP-DM-002-2017', 'PRESTACION DE SERVICIOS ADMINISTRATIVOS DE ASEO Y OTROS ASOCIADOS A ESTE EN LAS INSTITUCIONES EDUCATIVAS DE LOS MUNICIPIOS NO CERTIFICADOS DEL DEPARTAMENTO DEL MAGDALENA', 20, 8390308297, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171334', ''),
(1001717, 1, '2017-04-01', '10:22:25', 1, 'BOYACÁ - ALCALDÍA MUNICIPIO DE GARAGOA', 'LICITACION PUBLICA AMG-LP-004-2017', 'EJECUTAR LAS OBRAS PARA LA PRIMERA ETAPA DE LA CANALIZACION QUEBRADA LOS MANZANOS - MUNICIPIO DE GARAGOA', 7, 627150590, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171330', ''),
(1001718, 1, '2017-04-01', '10:22:25', 16, 'BOGOTÁ D.C. - CAJA DE VIVIENDA POPULAR', 'CVP-LP-004-2017', 'Suministro de alimentación y catering requeridos para realizar las actividades programadas en desarrollo de las funciones de la entidad.', 5, 286658076, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171332', ''),
(1001719, 1, '2017-04-01', '10:22:25', 47, 'ANTIOQUIA - ALCALDÍA MUNICIPIO DE APARTADÓ', '007/2017', 'PRESTACIÓN DE SERVICIOS DE VIGILANCIA Y SEGURIDAD PRIVADA EN LAS INSTALACIONES DE LA ADMINISTRACIÓN MUNICIPAL Y EN LAS INSTITUCIONES Y CENTROS EDUCATIVOS OFICIALES DEL MUNICIPIO DE APARTADÓ', 2, 2233455831, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-1-171324', ''),
(1001720, 3, '2017-04-01', '10:22:25', 33, 'ANTIOQUIA - ALCALDÍA MUNICIPIO DE ALEJANDRÍA', '001-2017', 'ADQUISICIÓN DE MATERIALES Y SUMINISTROS PARA FUNCIONAMIENTO DE DEPENDENCIAS MUNICIPALES E INSTITUCIÓN Y CENTROS EDUCATIVOS RURALES', 2, 75646400, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428424', ''),
(1001721, 3, '2017-04-01', '10:22:25', 33, 'ANTIOQUIA - EMPRESA DE VIVIENDA DE ANTIOQUIA - VIVA', '2017-VIVA-SA-03', 'SUMINISTRO DE PAPELERÍA E IMPLEMENTOS DE OFICINA, CAFETERÍA Y ASEO PARA EL NORMAL FUNCIONAMIENTO DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA ¿VIVA-.', 2, 59039000, 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=17-9-428429', '');

INSERT INTO Estado VALUES
(1,"Favoritos"),
(2,"En proceso"),
(3,"Completado");

----------------------------------------------------------------------------------QUERIES PROYECTO------------------------------------------------------------------------------------
INSERT INTO Vendedor VALUES
(1,(SELECT id_administrador FROM Administrador WHERE usuario="mauro"),"Alberto","albertico",md5("albertico1234"),"Cra 9 # 147-89","8889745","54123989");

SELECT *
from Vendedor
where id_administrador=(SELECT id_administrador FROM Administrador WHERE usuario="santi");

UPDATE Vendedor
SET fechaLogIn="2017-08-12"
WHERE usuario="pedrito";

SELECT EM.nombre nombreEmpresa, A.nombre nombreAdministrador, A.cedula cedulaAdministrador
FROM Empresa EM, Administrador A
WHERE EM.id_empresa=A.id_empresa;

SELECT EM.nombre nombreEmpresa, A.nombre, A.cedula
from Empresa Em
INNER JOIN Administrador A ON EM.id_empresa=A.id_empresa;

INSERT INTO Documento (nombre,tipo_archivo,ubicacion,id_vendedor) VALUES ("CARTA",".docx","//carta.docx",(SELECT id_vendedor FROM Vendedor WHERE usuario=""));

ALTER TABLE Documento
ADD ubicacion varchar(200) not null;

ALTER TABLE Agenda
CHANGE id_agenda  id_agenda INTEGER(11) NOT NULL AUTO_INCREMENT;

INSERT INTO Agenda (nombre_agenda,id_vendedor) VALUES("Agenda Predeterminada",(SELECT id_vendedor FROM Vendedor WHERE usuario=?))

select nombre_agenda from agenda where id_vendedor=(select id_vendedor from vendedor where usuario=?)

INSERT INTO Evento (id_agenda,fecha_evento,titulo,ubicacion,descripcion,hora_evento) VALUES ((select id_agenda from Agenda where id_vendedor=(select id_vendedor from vendedor where usuario=?)),?,?,?,?,?)

select * from evento where id_agenda=((select id_agenda from Agenda where id_vendedor=(select id_vendedor from vendedor where usuario=?))

onclick="seleccion(<% out.print("\""+fechaSeleccionada+"\""); %>)" 

---------------------Query 1-----------------------------------Se ejecuta cuando se guarda un contrato en el vendedor que inicio sesión
UPDATE EstadisticaVendedor
SET numero_contratos=(

select count(id_contrato_guardado)
FROM Vendedor
INNER JOIN ContratoGuardado ON Vendedor.id_vendedor=ContratoGuardado.id_vendedor
WHERE Vendedor.usuario="alexa"
GROUP BY Vendedor.id_vendedor

)
WHERE EstadisticaVendedor.id_vendedor=(

select Vendedor.id_vendedor
from Vendedor
WHERE usuario="alexa"

);
--------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------Query 2----------------------------------------------

select Administrador.nombre nombreAdmin, avg(EstadisticaVendedor.numero_contratos) NumContratosGuardados, 
CASE WHEN avg(EstadisticaVendedor.numero_contratos)=1 THEN "Todos los vendedores tienen contratos guardados" when avg(EstadisticaVendedor.numero_contratos)>=0.5 THEN "Mas de la mitad tienen contratos guardados" else "No hay vendedores con contratos guardados" END Descripcion
from Administrador
left outer join Vendedor ON vendedor.id_administrador=Administrador.id_administrador
left outer join EstadisticaVendedor on EstadisticaVendedor.id_vendedor=Vendedor.id_vendedor
group by Administrador.id_administrador;
----------------------------------------------------------------------------------------------------------

select * from evento where fecha_evento=? and id_agenda=
(select id_agenda from Agenda where id_vendedor=
(select id_vendedor from vendedor where usuario=?));  


--------------------------BUSQUEDA CONTRATOS----------------------------------------------------------------

-------------Caso 1 = Busqueda General------------------------------------------------------------------------
select id_contrato, objeto, numero_proceso, presupuesto, fecha_publicacion, hora_publicacion, pagina_web, depto
from Contratos
inner join Categorias ON Categorias.id_categoria=Contratos.id_categoria
inner join Deptos on Deptos.id_depto=Contratos.id_depto
inner join Tipos on Tipos.id_tipo=Contratos.id_tipo
where fecha_publicacion BETWEEN ? and ?
order by id_contrato
desc limit 0,5;

select count(id_contrato) size
from Contratos
inner join Categorias ON Categorias.id_categoria=Contratos.id_categoria
inner join Deptos on Deptos.id_depto=Contratos.id_depto
inner join Tipos on Tipos.id_tipo=Contratos.id_tipo
where fecha_publicacion BETWEEN '2016-05-28' and '2017-05-28' and Deptos.id_depto=5;

insert into ContratoGuardado (id_estado, id_contrato, id_vendedor) values (1,?,(select from vendedor where id_vendedor=?))

select id_contrato_guardado, id_contrato, ContratoGuardado.id_estado, Estado.nombre_estado
from ContratoGuardado
inner join Estado ON Estado.id_estado=ContratoGuardado.id_estado
where id_vendedor=(select id_vendedor from vendedor where usuario=?);

UPDATE ContratoGuardado
SET id_estado=?
WHERE id_vendedor=(select id_vendedor from vendedor where usuario=?) and id_contrato_guardado=?;