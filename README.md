# BaseDeDatos-U2-Ej16-Inmobiliaria
Base de Datos - Unidad 2 - Ejercicio 16

Consigna

Modelar el sistema centralizado de una inmobiliaria: cartera de propiedades con sus propietarios, inquilinos, agentes de la firma, contratos de locación y registro de los pagos mensuales del canon.

Lógica

PROPIETARIO 1:N PROPIEDAD. El enunciado es explícito: una propiedad pertenece a un único propietario, y un propietario puede tener varias en cartera. Si la agencia admitiera condominios (varios dueños por inmueble) haría falta una intermedia propietario-propiedad con el porcentaje de cada uno.

CONTRATO como entidad asociativa de tres vínculos. Es el núcleo del modelo: relaciona PROPIEDAD, INQUILINO y EMPLEADO, y cada relación es 1:N hacia el contrato (una propiedad tiene muchos contratos a lo largo del tiempo, un inquilino puede alquilar varias unidades, un agente gestiona muchas operaciones). No puede resolverse como un rombo simple porque tiene atributos propios abundantes y porque de él cuelgan los pagos.

La modalidad va como atributo tipo_operacion, con valores Alquiler temporario / Alquiler permanente / Venta. La diferencia entre temporario y permanente es de duración y no cambia la estructura de datos, así que no justifica entidades distintas. La venta sí es un caso distinto: no tiene canon, ni depósito, ni pagos mensuales, así que esos campos quedarían en NULL. Si el profesor pide evitar esos NULL, la alternativa es una especialización: una entidad OPERACION con los datos comunes y dos subentidades (ALQUILER y VENTA) con los suyos.

PAGO como entidad 1:N del contrato, nunca como atributo. Los pagos son muchos y desconocidos de antemano (uno por mes de vigencia): meterlos en el contrato obligaría a columnas repetidas y rompería la primera forma normal. periodo_abonado es el mes que se está cancelando y es distinto de fecha_pago, que es cuándo se abonó efectivamente: de la diferencia entre ambos sale el recargo_mora.

Propietario e inquilino como entidades separadas. Se modelaron así porque el desarrollo requerido las pide por separado, pero conviene tener presente el trade-off: comparten exactamente los mismos atributos y una misma persona puede ser dueña de un inmueble e inquilina de otro, con lo cual quedaría cargada dos veces. La alternativa más prolija es una única entidad PERSONA con el rol determinado por la relación en la que participa (dueña en posee, locataria en firma), o una especialización con PERSONA como padre.

Restricciones de integridad a considerar: una propiedad no puede tener dos contratos de alquiler con períodos solapados; fecha_fin posterior a fecha_inicio; el propietario de una propiedad no debería figurar como inquilino de su propio inmueble; UNIQUE sobre (Id_Contrato, periodo_abonado) para que no se registre dos veces el mismo mes; y recargo_mora mayor a cero solo cuando la fecha de pago supera el vencimiento del período.

Resultado
