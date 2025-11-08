// base amount of sector lifetime tickets
// if there are no enemies one ticket is removed every SECTOR_TICK_TIME seconds
// 12 * 5 = 60s by default
#define BASE_TICKETS                12
#define SECTOR_TICK_TIME            5
// delay in minutes from which addional time will be added
#define ADDITIONAL_TICKETS_DELAY    5

#define MAX_BUILDING_UNITS 100
#define MAX_BUILDING_RANGE_STANDARD 120
#define MAX_BUILDING_RANGE_LARGE 200

#define PFH_UPDATE_TIME 0.5
#define PFH_PARAM_SECTOR_MARKER 0
#define PFH_PARAM_SECTOR_POS 1
#define PFH_PARAM_POP_FACTOR 2
