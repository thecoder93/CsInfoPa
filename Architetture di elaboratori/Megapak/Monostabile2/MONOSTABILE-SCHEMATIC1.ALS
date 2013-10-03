.ALIASES
_   Monostabile(ck=N01089 trigger=N00313 out=N00128 T0=$D_LO T1=$D_HI T2=$D_LO
+  T3=$D_LO )
X_Monostabile_U5          Monostabile.U5(CLK=N01089 D/Ubar=$D_HI
+  CTENbar=Monostabile_N01188 LOADbar=Monostabile_START A=$D_LO B=$D_HI C=$D_LO
+  D=$D_LO RCObar=Monostabile_N06550 MAX/MIN=M_UN0001 QA=N08529 QB=N08577
+  QC=N08582 QD=N08587 VCC=$G_DPWR GND=$G_DGND )
X_Monostabile_U1A          Monostabile.U1A(CLRbar=Monostabile_N06550 D=$D_HI
+  CLK=N00313 PREbar=$D_HI Q=Monostabile_N00431 Qbar=M_UN0002 VCC=$G_DPWR
+  GND=$G_DGND )
X_Monostabile_U1B          Monostabile.U1B(CLRbar=$D_HI D=Monostabile_N00431
+  CLK=N01089 PREbar=$D_HI Q=N00128 Qbar=Monostabile_N01188 VCC=$G_DPWR
+  GND=$G_DGND )
X_Monostabile_U7A          Monostabile.U7A(A=Monostabile_N074400
+  Y=Monostabile_N07717 VCC=$G_DPWR GND=$G_DGND )
X_Monostabile_U11A          Monostabile.U11A(A=N00313 Gbar=$D_LO
+  Y=Monostabile_N07739 VCC=$G_DPWR GND=$G_DGND )
X_Monostabile_U15A          Monostabile.U15A(A=Monostabile_N07717
+  B=Monostabile_N07739 Y=Monostabile_START VCC=$G_DPWR GND=$G_DGND )
R_Monostabile_R2          Monostabile.R2(1=Monostabile_N07739
+  2=Monostabile_N074400 )
C_Monostabile_C2          Monostabile.C2(1=0 2=Monostabile_N074400 )
_    _(Monostabile.ck=N01089)
_    _(Monostabile.T0=$D_LO)
_    _(T0=$D_LO)
_    _(Monostabile.T1=$D_HI)
_    _(T1=$D_HI)
_    _(Monostabile.T2=$D_LO)
_    _(T2=$D_LO)
_    _(Monostabile.T3=$D_LO)
_    _(T3=$D_LO)
_    _(Monostabile.out=N00128)
_    _(Monostabile.trigger=N00313)
_    _(Monostabile.start=Monostabile_START)
U_DSTM4          DSTM4(VCC=$G_DPWR GND=$G_DGND 1=N01089 )
U_DSTM8          DSTM8(VCC=$G_DPWR GND=$G_DGND 1=N03280 )
U_DSTM7          DSTM7(VCC=$G_DPWR GND=$G_DGND 1=N00313 )
_    _(VCC=VCC)
_    _(GND=GND)
_    _(Monostabile.0=Monostabile.0)
.ENDALIASES
