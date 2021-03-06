########################################################################################################################
#                                                                                                                      #
# Models generated by the TwinCAT TMC editor.                                                                          #
#                                                                                                                      #
########################################################################################################################

require "ontoscript"

# metamodels
REQUIRE "models/import_all.coffee"

MODEL "http://www.mercator.iac.es/onto/models/mtcs/tmc/software" : "tmc_soft"

tmc_soft.IMPORT mm_all
tmc_soft.IMPORT soft
tmc_soft.IMPORT iec61131

########################################################################################################################
# Define the containing PLC library
########################################################################################################################

tmc_soft.ADD MTCS_MAKE_LIB "mtcs_tmc"

# make aliases (with scope of this file only)
THISLIB   = tmc_soft.mtcs_tmc


########################################################################################################################
# TmcTarget
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcTarget",
    items:
        rc: { type: t_double , comment: "Object mean right ascention (alpha) in radians" }
        dc: { type: t_double , comment: "Object mean declination (delta) in radians" }
        pr: { type: t_int16  , comment: "Object Right Ascention proper motion in radians/year (do not multiply by cos(dc)!)" }
        pd: { type: t_int16  , comment: "Object declination proper motion in radians/year" }
        px: { type: t_double , comment: "Object parallax in arcseconds" }
        rv: { type: t_double , comment: "Object radial velocity in km/s" }



########################################################################################################################
# TmcLocation
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcLocation",
    items:
        xp      : { type: t_float   , comment: "Earth polar motion x in radians" }
        yp      : { type: t_float   , comment: "Earth polar motion y in radians" }
        dx      : { type: t_float   , comment: "Nutation adjustment dX in radians" }
        dy      : { type: t_float   , comment: "Nutation adjustment dY in radians" }
        elong   : { type: t_double  , comment: "East longitude in radians" }
        phi     : { type: t_double  , comment: "latitude in radians" }
        hm      : { type: t_float   , comment: "Height above sea level in meters" }
        tk      : { type: t_float   , comment: "Local temperature in Kelvin" }
        phpa    : { type: t_float   , comment: "Local pressure in hectoPascal = millibar" }
        rh      : { type: t_float   , comment: "Local relative humidity as a fraction (0...1)" }
        wlfq    : { type: t_float   , comment: "Observing wavelength in microns" }
        tlr     : { type: t_float   , comment: "Tropospheric lapse rate in K/m" }

########################################################################################################################
# TmcAzEl
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcAzEl",
    items:
        az      : { type: t_double  , comment: "Azimuth in radians" }
        el      : { type: t_double  , comment: "Elevation in radians" }

########################################################################################################################
# TmcAzElFull
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcAzElFull",
    items:
        az      : { type: t_double  , comment: "Azimuth in radians" }
        azd     : { type: t_double  , comment: "Azimuth velocity in radians per second" }
        azdd    : { type: t_double  , comment: "Azimuth acceleration in radians/s2" }
        el      : { type: t_double  , comment: "Elevation in radians" }
        eld     : { type: t_double  , comment: "Elevation velocity in radians per second" }
        eldd    : { type: t_double  , comment: "Elevation acceleration in radians/s2" }
        pa      : { type: t_double  , comment: "Parallactic Angle in radians" }
        pad     : { type: t_double  , comment: "Parallactic Angle velocity in radians per second" }
        padd    : { type: t_double  , comment: "Parallactic Angle acceleration in radians/s2" }

########################################################################################################################
# TmcRaDec
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcRaDec",
    items:
        ra      : { type: t_double  , comment: "Right ascention (alpha) in radians" }
        dec     : { type: t_double  , comment: "Declination (delta) in radians" }


########################################################################################################################
# TmcObserved
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcObserved",
    items:
        aob     : { type: t_double  , comment: "Observed azimuth (radians: North=0, East=PI/2)" }
        zob     : { type: t_double  , comment: "Observed zentih distance (radians)" }
        hob     : { type: t_double  , comment: "Observed hour angle (radians)" }
        dob     : { type: t_double  , comment: "Observed declination (radians)" }
        rob     : { type: t_double  , comment: "Observed right ascention (radians)" }

########################################################################################################################
# TmcTrue
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcTrue",
    items:
        elong   : { type: t_double  , comment: "True longitude of the site (radians, east +ve)" }
        phi     : { type: t_double  , comment: "True geodetic latitude of the site (radians)" }
        daz     : { type: t_double  , comment: "Azimuth correction for true longitude and latitude (terrestrial - celestial, radians)" }


########################################################################################################################
# TmcProcessedTarget
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcProcessedTarget",
    items:
        given       : { type: THISLIB.TmcTarget     , comment: "The originally given target" }
        apparent    : { type: THISLIB.TmcRaDec      , comment: "Apparent target position" }
        quick       : { type: THISLIB.TmcAzElFull   , comment: "Quick computation results of target (without atmospheric refraction)" }
        observed    : { type: THISLIB.TmcObserved   , comment: "Observed target position" }
        observedFull: { type: THISLIB.TmcAzElFull   , comment: "Observed target position/velocity/acceleration" }
        isValid     : { type: t_bool                , comment: "Is the target valid?"}
        isTooLow    : { type: t_bool                , comment: "Is the target too low?"}

########################################################################################################################
# TmcProcessedFeedback
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcProcessedFeedback",
    items:
        apparent    : { type: THISLIB.TmcRaDec      , comment: "Apparent feedback position" }
        mean        : { type: THISLIB.TmcRaDec      , comment: "Mean feedback position" }
        isValid     : { type: t_bool                , comment: "Is the feedback valid?"}
        isTooLow    : { type: t_bool                , comment: "Is the feedback too low?"}



########################################################################################################################
# TmcDateTime
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcDateTime",
    items:
        years           : { type: t_int32 , comment: "Years, e.g. 2016" }
        months          : { type: t_int32 , comment: "Months, [1..12]" }
        days            : { type: t_int32 , comment: "Days, [1..31]" }
        hours           : { type: t_int32 , comment: "Hours, [0..23]" }
        minutes         : { type: t_int32 , comment: "Minutes, [0..59]" }
        seconds         : { type: t_int32 , comment: "Secconds, [0..60] (60 during leap second event!)" }
        microseconds    : { type: t_int32 , comment: "Microseconds, [0..999999]" }
        fractionOfDay   : { type: t_double, comment: "Fraction of the day, [0.0..1.0[" }


########################################################################################################################
# TmcUnixTime
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcUnixTime",
    items:
        sec : { type: t_int64  , comment: "Seconds from Jan 1, 1970" }
        usec: { type: t_int64  , comment: "Microseconds" }

########################################################################################################################
# TmcTimingMode
########################################################################################################################

MTCS_MAKE_ENUM THISLIB, "TmcTimingMode",
    items:
        [ "LOCAL_CLOCK",
          "PTP_IEEE_1588" ]


########################################################################################################################
# TmcUtcTime
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcUtcTime",
    items:
        dcTime              : { type: t_int64               , comment: "DC time" }
        mode                : { type: THISLIB.TmcTimingMode , comment: "Local clock or PTP?" }
        unixTime            : { type: THISLIB.TmcUnixTime   , comment: "UTC as Unix time" }
        mjd                 : { type: t_double              , comment: "UTC as Modified Julian Days" }
        dateTime            : { type: THISLIB.TmcDateTime   , comment: "EtherCAT master: Offset between DC and TwinCAT time (in ns)" }

########################################################################################################################
# TmcUt1Time
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcUt1Time",
    items:
        mjd                 : { type: t_double              , comment: "UT1 as Modified Julian Days" }


########################################################################################################################
# TmcAxesErrors
########################################################################################################################

MTCS_MAKE_ENUM THISLIB, "TmcAxesErrors",
    items:
        [ "AXES_NO_ERROR",
          "AXES_OBJECT_RC_OUT_OF_RANGE"
          "AXES_OBJECT_DC_OUT_OF_RANGE"
          "AXES_OBJECT_PR_OUT_OF_RANGE"
          "AXES_OBJECT_PD_OUT_OF_RANGE"
          "AXES_OBJECT_PX_OUT_OF_RANGE"
          "AXES_EQ_OUT_OF_RANGE"
          "AXES_LOCATION_XP_OUT_OF_RANGE"
          "AXES_LOCATION_YP_OUT_OF_RANGE"
          "AXES_LOCATION_DX_OUT_OF_RANGE"
          "AXES_LOCATION_DY_OUT_OF_RANGE"
          "AXES_LOCATION_ELONG_OUT_OF_RANGE"
          "AXES_LOCATION_PHI_OUT_OF_RANGE"
          "AXES_LOCATION_HM_OUT_OF_RANGE"
          "AXES_LOCATION_TK_OUT_OF_RANGE"
          "AXES_LOCATION_PHPA_OUT_OF_RANGE"
          "AXES_LOCATION_RH_OUT_OF_RANGE"
          "AXES_LOCATION_WLFQ_OUT_OF_RANGE"
          "AXES_LOCATION_TLR_OUT_OF_RANGE"
          "AXES_FEEDBACK_AZ_OUT_OF_RANGE"
          "AXES_FEEDBACK_EL_OUT_OF_RANGE" ]

########################################################################################################################
# TmcTimingErrors
########################################################################################################################

MTCS_MAKE_ENUM THISLIB, "TmcTimingErrors",
    items:
        [ "TIMING_NO_ERROR",
          "TIMING_DUT_OUT_OF_RANGE"
          "TIMING_GETCURDCTIME_FAILED" ]


########################################################################################################################
# TmcFromIoEcatMaster
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcFromIoEcatMaster",
    items:
        dcToTcTimeOffset    : { type: t_int64   , comment: "EtherCAT master: Offset between DC and TwinCAT time (in ns)" }
        dcToExtTimeOffset   : { type: t_int64   , comment: "EtherCAT master: Offset between Dc and external time (in ns)" }

########################################################################################################################
# TmcFromIoEL6688
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcFromIoEL6688",
    items:
        internalTimestamp   : { type: t_uint64  , comment: "EL6688 module: internal timestamp" }
        externalTimestamp   : { type: t_uint64  , comment: "EL6688 module: external timestamp" }
        notConnected        : { type: t_bool    , comment: "EL6688 module: not connected" }
        updateToggle        : { type: t_bool    , comment: "EL6688 module: update toggle" }

########################################################################################################################
# TmcFromIo
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcFromIo",
    items:
        fromEL6688          : { type: THISLIB.TmcFromIoEL6688       , comment: "Connect to inputs of EL6688" }
        fromEcatMaster      : { type: THISLIB.TmcFromIoEcatMaster   , comment: "Connect to inputs of EtherCAT master" }

########################################################################################################################
# TmcFromPlcAxes
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcFromPlcAxes",
    items:
        object      : { type: THISLIB.TmcTarget     , comment: "Target" }
        equinox     : { type: t_double              , comment: "Epoch of mean equinoxes (e.g. 2000.0)" }
        location    : { type: THISLIB.TmcLocation   , comment: "Location of the observatory" }
        feedback    : { type: THISLIB.TmcAzEl       , comment: "Feedback position (by the encoders)" }


########################################################################################################################
# TmcFromPlcTiming
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcFromPlcTiming",
    items:
        dut                 : { type: t_double              , comment: "Delta UT (=UT1 - UTC, floating point between 0 and 1 second)" }
        leapSeconds         : { type: t_int32               , comment: "Number of leap seconds" }
        alwaysUseLocalClock : { type: t_bool                , comment: "If TRUE, then the local clock (source=LOCAL_CLOCK) will be used even if an external (more accurate!) clock is available" }


########################################################################################################################
# TmcFromPlc
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcFromPlc",
    items:
        fromAxes            : { type: THISLIB.TmcFromPlcAxes    , comment: "Connect to outputs of PLC - MTCS - Axes" }
        fromTiming          : { type: THISLIB.TmcFromPlcTiming  , comment: "Connect to outputs of PLC - MTCS - Services/Timing" }

########################################################################################################################
# TmcToPlcAxes
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcToPlcAxes",
    items:
        polmo       : { type: THISLIB.TmcTrue               , comment: "True longitude/latitude/azimuth after polar motion correction" }
        last        : { type: t_double                      , comment: "Local apparent sidereal time" }
        ha          : { type: t_double                      , comment: "Hour angle in radians" }
        object      : { type: THISLIB.TmcProcessedTarget    , comment: "Processed target" }
        feedback    : { type: THISLIB.TmcProcessedFeedback  , comment: "Processed feedback" }
        error       : { type: THISLIB.TmcAxesErrors         , comment: "0 = no error" }


########################################################################################################################
# TmcToPlcTiming
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcToPlcTiming",
    items:
        utc         : { type: THISLIB.TmcUtcTime            , comment: "UTC time" }
        ut1         : { type: THISLIB.TmcUt1Time            , comment: "UT1 time" }
        error       : { type: THISLIB.TmcTimingErrors       , comment: "0 = no error" }

########################################################################################################################
# TmcToPlc
########################################################################################################################

MTCS_MAKE_STRUCT THISLIB, "TmcToPlc",
    items:
        toAxes      : { type: THISLIB.TmcToPlcAxes          , comment: "Connect to inputs of PLC - MTCS - Axes" }
        toTiming    : { type: THISLIB.TmcToPlcTiming        , comment: "Connect to inputs of PLC - MTCS - Services/Timing" }

########################################################################################################################
# Write the model to file
########################################################################################################################

tmc_soft.WRITE "models/mtcs/tmc/software.jsonld"



