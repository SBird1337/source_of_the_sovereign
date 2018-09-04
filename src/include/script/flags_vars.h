
/*----------------------------------------------------------------------------------------------------------------------------------------
    Hier sind die Flags sowie Vars des Spiels dokumentiert, bitte ausführlich dokumentieren!!!
------------------------------------------------------------------------------------------------------------------------------------------*/
#ifndef FLAGSVARS_IDS_H_
#define FLAGSVARS_IDS_H_

/*----------------------------------------------------------------------------------------------------------------------------------------
    Flags beginnend ab 0x500 bis 0x700
------------------------------------------------------------------------------------------------------------------------------------------*/
#define FLAG_HIDDEN                 0x500       /*Versteckt NPCs beim Gamestart. Diese Flags ist gesetzt!*/
#define FLAG_SCHOOL_MOVESPRITE      0x501       /*Schüler sind verstreut auf der Map, statt auf den Stühle.*/
#define FLAG_HIDE_RIVAL_SCHOOL      0x502       /*Versteckt den Rivalen in der Trainerschule.*/
#define FLAG_HIDE_RIVAL_SCHOOL_OUT  0x503       /*Versteckt den Rivalen am Eingang der Trainerschule.*/


/*----------------------------------------------------------------------------------------------------------------------------------------
    Vars beginnend ab 0x5050 bis 0x51FF
------------------------------------------------------------------------------------------------------------------------------------------*/
#define VAR_MODI                    0x5050         /*Schwierigkeitsgrad */
    #define MODI_LEICHT             0x0
    #define MODI_MITTEL             0x1
    #define MODI_SCHWER             0x2

#define VAR_MAPVAR_SCHOOL           0x5051        /*Mapvariable für den Mapscript in der Trainerschule.*/
    #define VARVALUE_SCHOOL_02_1      0x0         /*Senseis Unterricht.*/
    #define VARVALUE_SCHOOL_02_2      0x1         /*Das Gespräch mit dem Rivalen am Spint.*/
    #define VARVALUE_SCHOOL_02_3      0x3         /*Das Gespräch draußen vor dem Eingang der Trainerschule mit dem Rivalen.*/
    #define VARVALUE_SCHOOL_END       0x4         /*Schließt diese Variable ab.*/







#endif /* FLAGSVARS_IDS_H */
