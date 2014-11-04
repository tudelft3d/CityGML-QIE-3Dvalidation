## "unit test" datasets for the OGC CityGML QIE Experiment #2: 3D geometric validation

Each GML file contains one and only one solid, and (ideally) maximum 1 error.

The file `description.csv` describes each file briefly.

There are 3 "types" of file:

  1. `vXXX.gml`: solid is valid 
  2. `iXXX_Y.gml`: solid is invalid, the reason is "XXX" (see below for the codes)
  3. `tXXX_Y.gml`: validity is based on a tolerance; 1E-Y is the amount by which one vertex is moved, thus for *t203_1.gml* one vertex was moved by 10cm.

The codes for the errors are as follows. In accordance with the QIE naming schema for the requirements, all the geometric errors are in the "GE" domain. Also, since the geometric validation is performed at 3 different levels (based on the primitives), the requirements also contain the level:

   * __R__ing:
   * __P__olygon
   * __S__hell

#### RING level

   * 101: GE_R_TOO_FEW_POINTS (<3 points)
   * 102: GE_R_CONSECUTIVE_POINTS_SAME (2 consecutive points are the same)       ⁄
   * 103: GE_R_NOT_CLOSED (first-last points are not the same)            
   * 104: GE_R_SELF_INTERSECTION (self-intersects, ie a bowtie)
   * 105: GE_R_COLLAPSED (is point or line)       

#### POLYGON level

   * 201: GE_P_INTERSECTION_RINGS (2+ rings intersect)       
   * 202: GE_P_DUPLICATED_RINGS (2+ rings identical)       
   * 203: GE_P_NON_PLANAR_POLYGON_DISTANCE_PLANE  (w.r.t. tolerance)      
   * 204: GE_P_NON_PLANAR_POLYGON_NORMALS_DEVIATION  (w.r.t. tolerance)      
   * 205: GE_P_INTERIOR_DISCONNECTED (interior is not connected)     
   * 206: GE_P_HOLE_OUTSIDE (1 or more interior rings are located outside the exterior ring)             
   * 207: GE_P_INNER_RINGS_NESTED (interior ring is located inside other)   
   * 208: GE_P_ORIENTATION_RINGS_SAME (exterior and interior rings have same orientation)   

#### SHELL level

   * 301: GE_S_TOO_FEW_POLYGONS (<4 polygons)
   * 302: GE_S_NOT_CLOSED (there is 1+ hole(s) on the surface)          
   * 303: GE_S_NON_MANIFOLD_VERTEX
   * 304: GE_S_NON_MANIFOLD_EDGE 
   * 305: GE_S_MULTIPLE_CONNECTED_COMPONENTS (1+ polygons not connected to main shell)
   * 306: GE_S_SELF_INTERSECTION
   * 307: GE_S_POLYGON_WRONG_ORIENTATION (orientation of a polygon not correct)
   * 308: GE_S_ALL_POLYGONS_WRONG_ORIENTATION (normals all pointing in wrong direction)       

For each error code, extra information can (and should) be returned. For instance:
   * if a ring is not closed (GE_R_NOT_CLOSED) then the ID of the ring (eg its position [first, second..] in the polygon)
   * if a polygon is not planar (GE_P_NON_PLANAR_POLYGON_DISTANCE_PLANE) then the ID of the polygon should be returned;
   * if a shell is not 'watertight' (GE_S_NOT_CLOSED) then the location of the hole(s) should be returned;
