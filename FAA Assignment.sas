/* Importing SAS data */
PROC IMPORT DATAFILE='/folders/myfolders/FAA1.xls'
	DBMS=XLS
	OUT=WORK.FAA1;
	GETNAMES=YES;
RUN;

/*FA2 does not have a duration column*/
PROC IMPORT DATAFILE='/folders/myfolders/FAA2.xls'
	DBMS=XLS
	OUT=WORK.FAA2;
	GETNAMES=YES;
RUN;

/*2. Missing observations are present. Removing extra observations that are missing*/
OPTIONS missing = ' '; 
data FAA1;
	set work.FAA1;
	IF missing(cats(of _all_))  
    THEN 
      DELETE; 
run;


/* The first 100 observations are equal between these data sets */
/* Between 101 and 150, The height and passengers remain equal between the two data sets, but all other variables have differing values. */
proc compare data=FAA1 comp=FAA2;
run;

data FAA2_lastfifty;
	set FAA2;
	if _N_ >= 101;
run;

/*1. Merging the last 50 of FAA2 with FAA1 because it is additional and non-repeated data*/
data FAA;
	set FAA2_lastfifty work.FAA1;
run;


/*3. Validity Check */
/*Based on this summary, there were a few instances of the ground speed or air speed being in the abnormal range on the high and low end*/
/*There is also an issue with height at there is at least 1 negative value for height which should not be possible. Height should be at least 6 meters*/
/*Duration should always be greater than 40 minutes. The data does not reflect this in some cases.*/
/*The minimum of the distance column reveals that a plane stopped 34 feet past the start of the runway - this seems fishy. 
There are also examples of the distance being greater than 6,000*/
proc univariate data=FAA;
run;

/* 4. Data Cleaning */
/* Here we are filtering out all values that would be considered abnormal */
data FAA_clean;
	set FAA;
	if duration < 40 and duration NE ' ' then delete;
	if Speed_ground < 30 or Speed_ground > 140 then delete;
	if (Speed_air < 30 or Speed_air > 140) and Speed_air NE ' ' then delete;
	if height < 6 then delete;
	if distance > 6000 then delete;
run;


/* There are now no more abnormal values */
proc univariate data=FAA_clean;
run;

/* 5. Summarizing the variable distributions */
/* Proc means will present the mean standard deviation, minimim, maximum, and the number of each variable*/
/* There are 50 values missing in the duration column */
/* there are 628 values missing in the speed_air column */
proc means data=FAA_clean;
run;

