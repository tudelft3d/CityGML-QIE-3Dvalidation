## "unit test" datasets for the OGC CityGML QIE Experiment #2: 3D geometric validation

For each software, all the GML files should be validated and the results put in the report.xls. Each file contains one and only one solid, and (ideally) maximum 1 error.

Everyone is invited to upload their file so that others test them. To get write access, send an email to Hugo Ledoux <h.ledoux@tudelft.nl>


For the tudelft folder, the naming convention is as follows:

  * 0xx.gml : "simple" 2-manifolds (a shell in OGC jargon)
  * 1xx.gml : 2-manifold with inner rings in surfaces
  * 2xx.gml : solids as defined in OGC/ISO19107, ie having >1 shells
