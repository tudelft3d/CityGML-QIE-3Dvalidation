## "unit test" datasets for the OGC CityGML QIE Experiment #2: 3D geometric validation

For each software, all the GML files in the different folders should be validated and the results put in the __report.xls__ (an example of how to fill the __report.xls__ is also given).

Each GML file contains one and only one solid, and (ideally) maximum 1 error. Some GML files contain a valid solid.

Everyone is invited to upload their files so that others can test them. To get write access, send an email to Hugo Ledoux <h.ledoux@tudelft.nl>

For the tudelft folder, the naming convention is as follows:

  * 0xx.gml : "simple" 2-manifolds (a shell in OGC jargon)
  * 1xx.gml : 2-manifold with inner rings in surfaces
  * 2xx.gml : solids as defined in OGC/ISO19107, ie having >1 shells
