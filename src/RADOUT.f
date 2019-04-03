      SUBROUTINE RADOUT

C     NICHEMAPR: SOFTWARE FOR BIOPHYSICAL MECHANISTIC NICHE MODELLING

C     COPYRIGHT (C) 2018 MICHAEL R. KEARNEY AND WARREN P. PORTER

C     THIS PROGRAM IS FREE SOFTWARE: YOU CAN REDISTRIBUTE IT AND/OR MODIFY
C     IT UNDER THE TERMS OF THE GNU GENERAL PUBLIC LICENSE AS PUBLISHED BY
C     THE FREE SOFTWARE FOUNDATION, EITHER VERSION 3 OF THE LICENSE, OR (AT
C      YOUR OPTION) ANY LATER VERSION.

C     THIS PROGRAM IS DISTRIBUTED IN THE HOPE THAT IT WILL BE USEFUL, BUT
C     WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF
C     MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. SEE THE GNU
C     GENERAL PUBLIC LICENSE FOR MORE DETAILS.

C     YOU SHOULD HAVE RECEIVED A COPY OF THE GNU GENERAL PUBLIC LICENSE
C     ALONG WITH THIS PROGRAM. IF NOT, SEE HTTP://WWW.GNU.ORG/LICENSES/.

      IMPLICIT NONE

      DOUBLE PRECISION AL,ALT,AMASS,ATOT,BP,DEPSUB,EMISAN,FATOSB,FATOSK,
     * PTCOND,QIR2SK,QIR2SB,QCOND,QCONV,QRESP,QSEVAP,QIRIN,QIROUT,
     * QMETAB,QSOLAR,R,RELHUM,SIG,SUBTK,FLSHCOND,
     * TA,TSKIN,TR,TSUBST,VEL,WEVAP,X,XK,H2O_BALPAST,PTCOND_ORIG
      DOUBLE PRECISION RHO1_3,TRANS1,AREF,BREF,CREF,PHI,F21,F31,F41,F51
     &,PHIMIN,PHIMAX,TWING,F12,F32,F42,F52,SIDEX,WQSOL
     &,F61,TQSOL,A1,A2,A3,A4,A4B,A5,A6,F13,F14,F15,F16
      DOUBLE PRECISION IR1,IR2,IR3,IR4,IR5,IR6,F23,F24,F25,F26

      INTEGER WINGMOD,WINGCALC

      COMMON/FUN1/QSOLAR,QIRIN,QMETAB,QRESP,QSEVAP,QIROUT,QCONV,QCOND
      COMMON/FUN2/AMASS,RELHUM,ATOT,FATOSK,FATOSB,EMISAN,SIG,FLSHCOND
      COMMON/FUN3/AL,TA,VEL,PTCOND,SUBTK,DEPSUB,TSUBST,PTCOND_ORIG
      COMMON/FUN4/TSKIN,R,WEVAP,TR,ALT,BP,H2O_BALPAST
      COMMON/WINGFUN/RHO1_3,TRANS1,AREF,BREF,CREF,PHI,F21,F31,F41,F51
     &,SIDEX,WQSOL,PHIMIN,PHIMAX,TWING,F12,F32,F42,F52
     &,F61,TQSOL,A1,A2,A3,A4,A4B,A5,A6,F13,F14,F15,F16,F23,F24,F25,F26
     &,WINGCALC,WINGMOD

      X=TSKIN
      XK=X+273.15

      IF(WINGMOD.EQ.2)THEN
       IR1=EMISAN*SIG*A2*F21*XK**4.
       IR2=EMISAN*SIG*A2*F23*XK**4.
       IR3=EMISAN*SIG*A2*F24*XK**4.
       IR4=EMISAN*SIG*A2*F25*XK**4.
       IR5=EMISAN*SIG*A2*F26*XK**4.
       IR6=EMISAN*SIG*ATOT*1*XK**4.
       QIROUT=IR6
      ELSE
       QIR2SK=ATOT*FATOSK*EMISAN*SIG*XK**4.
       QIR2SB=ATOT*FATOSB*EMISAN*SIG*XK**4.
       QIROUT=QIR2SK+QIR2SB
      ENDIF

      RETURN
      END