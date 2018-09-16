INSERT INTO [Genesis].[School]
           ([name]
           ,[address]
           ,[website]
           ,[phone]
           )
     VALUES
           ('Escuela Profesional de Ingeniería de Computación y Sistemas'
           ,'Av. La Fontana 1250 Urb. Sta. Patricia 2da Etapa La Molina'
           ,'http://www.usmp.edu.pe/ffia/escuelas/sistemas/index.php'
           ,'(511) 2086000'
           ),
           ('Escuela Profesional de Ingeniería Civil'
           ,'Av. La Fontana 1250 Urb. Sta. Patricia 2da Etapa La Molina'
           ,'http://www.usmp.edu.pe/ffia/escuelas/civil/index.php'
           ,'(511) 2086000'
           ),
           ('Escuela Profesional de Ingeniería Industrial'
           ,'Av. La Fontana 1250 Urb. Sta. Patricia 2da Etapa La Molina'
           ,'http://www.usmp.edu.pe/ffia/escuelas/industrial/index.php'
           ,'(511) 2086000'
           )
GO

INSERT INTO [Genesis].[LineOfInvestigation]
           ([school_id]
           ,[description]
           )
     VALUES
           (1, 'Ingeniería de Software'),
           (1, 'Tecnologías de Información'),
           (1, 'Sistemas de Información'),
           (1, 'Ciencias de la Computación'),
           (1, 'Ingeniería de Computadoras')
GO
