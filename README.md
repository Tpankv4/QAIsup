# QAIsup
Dieses Projekt ist Teil einer Masterarbeit am Institut für Architektur von Anwendungssystemen (IAAS) an der Universität Stuttgart.
Das Ziel des projektes ist die Bereitstellung eines Systems zur Unterstützung bei der Impementierung von Quantenalgorithmen.
Dies kann durch Angabe einer Problembeschreibung, die mithilfe eines Quantenalgorithmus umgesetzt werden soll, erreicht werden.
Durch Verwendung von Techniken aus dem Bereich der Natürlichen Sprachverarbeitung wird die Beschreibung analysiert.
Als Ergebnis werden ein geeigneter Quantenalgorithmus, sowie Quantencomputing Patterns bzw. Muster zur Unterstützung der Implementierung vorgeschlagen. 

This project is part of a Master Thesis at the Institute for Architecture of Application Systems (IAAS) at the University of Stuttgart.
The goal of the project is the provision of a support system for the implementiation of quantum algorithms.
This can be achieved by providing a problem description which has to be realized with a quantum algorithm.
By utilizing natual language processing techniques, the description is analysed.
A quantum algorithm as a solution, as well as quantum computing patterns to support the implementation of the algorithm are proposed.

## How to run
The project is based on the [Patternatlas](https://github.com/PatternAtlas).
Multiple parts of the patternatlas implementation are extended in this project.

When everything is running, look at http://localhost:1978.

### Frontend
The Frontend is an extension of the [Patternatlas UI](https://github.com/PatternAtlas/pattern-atlas-ui).

Install the required packages with:

``C:\PATH\QAIsup_Patternatlas> yarn install``

To start the frontend run:

``C:\PATH\QAIsup_Patternatlas> yarn start``

### Backend

Install the required packages with:

``C:\PATH\QAIsup_Backend> npm install``

To start the backend run:

``C:\PATH\QAIsup_Patternatlas> node server.js``

### API
The API is an extension of the [Patternatlas API](https://github.com/PatternAtlas/pattern-atlas-api).

To package the application run:

``C:\PATH\QAIsup_API> mvn package -DskipTests``

To run the application execute:

``C:\PATH\QAIsup_API> mvn spring-boot:run``

### Database

The Database uses part of the data from the [Patternatlas Content](https://github.com/PatternAtlas/pattern-atlas-content) repository.

A [PostgreSQL Database](https://www.postgresql.org/) is used to save the data.

[PgAdmin](https://www.pgadmin.org/) can be used to inspect and backup the database.

The database data can be found in:

``C:\PATH\QAIsup_Data``

The database needs to run on Port: 5432 for local use.
To establish a connection, the port, username and password have to match the values in: 

``C:\PATH\QAIsup_API\src\main\resource\application.properties``
