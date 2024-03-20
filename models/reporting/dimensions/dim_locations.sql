/*
  location_enriched model
  This model enriches the city location data from the stg_odoo__res_country_cities source
  by joining it with the dim_countries dimension table. It provides a comprehensive view of city locations,
  including their names, associated country information, and active status.

  Source Tables:
  - stg_odoo__res_country_cities: Contains basic city location information.
  - dim_countries: Contains detailed country information.
*/

SELECT
    CAST(rcc.id AS INT64) AS location_id,  -- Unique identifier for the city location, cast to INT64 for consistency
    CAST(rcc.name AS STRING) AS location_name,  -- Name of the city location
    CAST(c.country_name AS STRING) AS location_country,  -- Name of the country associated with the city location
    CAST(c.country_code AS STRING) AS location_country_code,  -- Country code associated with the city location
    CAST(rcc.is_published AS BOOL) AS location_active,  -- Flag indicating if the city location is published (active)
    CASE 
        WHEN rcc.id = 1 THEN ST_GEOGFROMTEXT('POLYGON ((-8.777277 41.4709246, -8.8363285 41.4276924, -8.6523075 41.0103691, -7.9052372 41.1170188, -7.8709049 41.2348564, -7.9739017 41.3648514, -8.6069889 41.3401104, -8.5946293 41.3967946, -8.777277 41.4709246))')
        WHEN rcc.id = 2 THEN ST_GEOGFROMTEXT('POLYGON ((-9.3416996 39.2943453, -9.5696659 38.8422723, -9.4776554 38.6473348, -9.2431502 38.3815444, -9.00387 38.4292771, -8.9122109 38.5012765, -8.7710546 38.4656477, -8.6531468 38.6135407, -8.5108791 38.7582607, -8.8651676 38.8583148, -8.7841434 39.055875, -8.9928837 39.2985964, -9.3416996 39.2943453))')
        WHEN rcc.id = 3 THEN ST_GEOGFROMTEXT('POLYGON ((-8.80213 37.4489564, -8.9161131 37.2841477, -9.0328428 36.974294, -8.1910155 37.0784499, -7.9960081 36.9775853, -7.8847716 36.9512508, -7.3999998 37.1671437, -7.5181029 37.5274131, -8.085272 37.3212885, -8.80213 37.4489564))')
        WHEN rcc.id = 4 THEN ST_GEOGFROMTEXT('POLYGON ((-8.8091015 41.6118185, -8.8049816 41.4730575, -8.777277 41.4709246, -8.5946293 41.3967946, -8.6069889 41.3401104, -7.9739017 41.3648514, -7.9398083 41.4751154, -7.8093456 41.5748447, -7.8477978 41.6138719, -7.9961132 41.6046308, -7.9837536 41.6785231, -8.0977367 41.6918557, -8.0551647 41.8188897, -8.165028 41.8158193, -8.4946178 41.7400353, -8.5440563 41.6323503, -8.8091015 41.6118185))')
        WHEN rcc.id = 5 THEN ST_GEOGFROMTEXT('POLYGON ((-8.7857555 40.5235362, -8.9780163 40.0731608, -8.3847545 39.9321982, -8.1732677 40.0857701, -8.1265758 39.9343042, -7.7420543 40.100478, -7.8244518 40.2536712, -7.8244518 40.5005666, -8.0634044 40.3646768, -8.4561657 40.2830111, -8.7857555 40.5235362))')
        WHEN rcc.id = 6 THEN ST_GEOGFROMTEXT('POLYGON ((-8.6523075 41.0103691, -8.7857555 40.5235362, -8.4561657 40.2830111, -8.2611583 40.5079389, -8.3270763 40.7372551, -8.1046032 40.8578501, -8.2556652 41.0652579, -8.6523075 41.0103691))')
        WHEN rcc.id = 7 THEN ST_GEOGFROMTEXT('POLYGON ((-17.3006685 32.8922984, -17.3034151 32.6093286, -16.6167696 32.6116422, -16.6222627 32.889992, -17.3006685 32.8922984))')
        WHEN rcc.id = 8 THEN ST_GEOGFROMTEXT('POLYGON ((-8.5459475 38.7705546, -8.5108791 38.7582607, -8.6531468 38.6135407, -8.6393313 38.5432053, -8.378406 38.5475016, -8.3207278 38.3732968, -8.1696657 38.315135, -7.9883913 38.31729, -7.6945071 38.20083, -7.4940066 38.1857196, -7.2962527 38.3259093, -7.1506838 38.14901, -7.1039919 38.1835607, -7.3264651 38.4421687, -7.1918825 38.7555632, -7.2166018 38.8369071, -7.3896365 38.8090894, -7.5379519 38.9971817, -7.7631716 38.9010604, -8.2191042 38.995047, -8.1339602 38.7791197, -8.3179812 38.8604367, -8.5459475 38.7705546))')
        WHEN rcc.id = 10 THEN ST_GEOGFROMTEXT('POLYGON ((-7.9052372 41.1170188, -8.2556652 41.0652579, -8.1046032 40.8578501, -8.3270763 40.7372551, -8.2611583 40.5079389, -8.4561657 40.2830111, -8.0634044 40.3646768, -7.8244518 40.5005666, -7.5824143 40.5694138, -7.538469 40.690313, -7.623613 40.777724, -7.5467087 40.873328, -7.439592 40.8109932, -7.3077561 41.1365624, -7.4450852 41.2109887, -7.8680588 41.1572448, -7.9052372 41.1170188))')
        WHEN rcc.id = 11 THEN ST_GEOGFROMTEXT('POLYGON ((-8.1265758 39.9343042, -8.1732677 40.0857701, -8.3847545 39.9321982, -8.9780163 40.0731608, -9.5122455 39.3620526, -9.3416996 39.2943453, -8.9928837 39.2985964, -8.8887713 39.4681484, -8.7377093 39.4766291, -8.6772845 39.5550265, -8.6333392 39.6946506, -8.6882709 39.7706905, -8.4795306 39.8403199, -8.4465716 39.7305688, -8.1265758 39.9343042))')
        WHEN rcc.id = 12 THEN ST_GEOGFROMTEXT('POLYGON ((-8.3317901 39.8027322, -8.4465716 39.7305688, -8.4795306 39.8403199, -8.6882709 39.7706905, -8.6333392 39.6946506, -8.6772845 39.5550265, -8.7377093 39.4766291, -8.8887713 39.4681484, -8.9928837 39.2985964, -8.7841434 39.055875, -8.8651676 38.8583148, -8.5459475 38.7705546, -8.3179812 38.8604367, -8.1339602 38.7791197, -8.184848 38.908666, -8.2191042 38.995047, -8.3414032 39.1050203, -8.1354095 39.2891385, -8.0845978 39.2763829, -7.9390289 39.4102012, -8.01044 39.4653531, -7.9555084 39.5638812, -7.8442718 39.5066883, -7.8099396 39.5649398, -7.915683 39.6675552, -7.9555084 39.6601551, -7.9555084 39.7436249, -8.0502655 39.741513, -8.0543854 39.6157376, -8.2342865 39.6464098, -8.2287933 39.7615736, -8.3317901 39.8027322))')
        WHEN rcc.id = 14 THEN ST_GEOGFROMTEXT('POLYGON ((-25.8826597 37.9397469, -25.8826597 37.6663103, -25.0119932 37.6652232, -25.0229795 37.9375808, -25.8826597 37.9397469))')
        WHEN rcc.id = 15 THEN ST_GEOGFROMTEXT('POLYGON ((-8.0551647 41.8188897, -8.0977367 41.6918557, -7.9837536 41.6785231, -7.9961132 41.6046308, -7.8477978 41.6138719, -7.8093456 41.5748447, -7.9398083 41.4751154, -7.9739017 41.3648514, -7.8709049 41.2348564, -7.9052372 41.1170188, -7.8680588 41.1572448, -7.4450852 41.2109887, -7.3204395 41.338375, -7.3616383 41.4311076, -7.2407887 41.523708, -7.2441415 41.6427584, -7.1732085 41.7679564, -7.2016499 41.8810283, -7.30602 41.8462552, -7.4234364 41.8058333, -7.4481556 41.86211, -7.6136372 41.8309081, -7.5827381 41.8794946, -7.7338001 41.8927855, -7.8440067 41.8805171, -7.8735325 41.8454879, -7.8893253 41.8562288, -7.8848621 41.9262561, -7.9064915 41.926767, -7.9198647 41.8773594, -7.9741197 41.8762202, -8.0146318 41.8312127, -8.0551647 41.8188897))')
        WHEN rcc.id = 16 THEN ST_GEOGFROMTEXT('POLYGON ((-7.2016499 41.8810283, -7.1732085 41.7679564, -7.2441415 41.6427584, -7.2407887 41.523708, -7.3616383 41.4311076, -7.3204395 41.338375, -7.4450852 41.2109887, -7.3077561 41.1365624, -7.121999 41.1628166, -7.0533344 41.0448493, -6.937978 41.0262035, -6.8171284 41.0324194, -6.1991474 41.5791688, -6.5067646 41.6571946, -6.5479633 41.9418001, -7.1796772 41.9826464, -7.2016499 41.8810283))')
        WHEN rcc.id = 17 THEN ST_GEOGFROMTEXT('POLYGON ((-8.1696657 38.315135, -8.1268165 38.2256358, -8.4069679 38.1003839, -8.294358 37.9814119, -8.3300636 37.8448975, -8.544297 37.8557412, -8.5937355 37.7559187, -8.997483 37.8427285, -8.80213 37.4489564, -8.085272 37.3212885, -7.5181029 37.5274131, -7.2506569 37.9922355, -6.9924782 38.0268604, -6.9485328 38.2126887, -7.1039919 38.1835607, -7.1506838 38.14901, -7.2962527 38.3259093, -7.4940066 38.1857196, -7.6945071 38.20083, -7.9883913 38.31729, -8.1696657 38.315135))')
        WHEN rcc.id = 18 THEN ST_GEOGFROMTEXT('POLYGON ((-6.937978 41.0262035, -7.0533344 41.0448493, -7.121999 41.1628166, -7.3077561 41.1365624, -7.439592 40.8109932, -7.5467087 40.873328, -7.623613 40.777724, -7.538469 40.690313, -7.5824143 40.5694138, -7.8244518 40.5005666, -7.8244518 40.2536712, -7.8137062 40.2246374, -7.5363014 40.3147512, -7.4772499 40.3963785, -7.2726295 40.4047449, -7.3358009 40.2906628, -7.1627662 40.2655179, -7.1133278 40.3210337, -6.9567726 40.25399, -6.8798683 40.2560861, -6.7864845 40.3629023, -6.8524025 40.4570116, -6.8002174 40.5092377, -6.835923 40.569769, -6.8057106 40.8425216, -6.937978 41.0262035))')
        WHEN rcc.id = 19 THEN ST_GEOGFROMTEXT('POLYGON ((-6.9639598 40.2384671, -6.9516001 40.2523558, -7.1133278 40.3210337, -7.1627662 40.2655179, -7.3358009 40.2906628, -7.2726295 40.4047449, -7.4772499 40.3963785, -7.5363014 40.3147512, -7.8137062 40.2246374, -7.7420543 40.100478, -8.1265758 39.9343042, -8.3317901 39.8027322, -8.2287933 39.7615736, -8.2342865 39.6464098, -8.0543854 39.6157376, -8.0502655 39.741513, -7.9555084 39.7436249, -7.9555084 39.6601551, -7.915683 39.6675552, -7.8099396 39.5649398, -7.8277598 39.5364273, -7.7192698 39.59095, -7.7165232 39.6501882, -7.6313792 39.6226911, -7.5462352 39.6607611, -7.0161448 39.6671041, -6.8678294 40.01507, -7.0133982 40.1180656, -7.0271312 40.1789488, -7.0094639 40.2279808, -6.9639598 40.2384671))')
    END AS location_polygon


FROM {{ ref('stg_odoo__res_country_cities') }} rcc  -- Source table: staged country cities data
LEFT JOIN {{ ref('dim_countries') }} c ON rcc.country_id = c.country_id  -- Joining with countries dimension table for country details
ORDER BY location_id ASC  -- Ordering by location ID in ascending order
