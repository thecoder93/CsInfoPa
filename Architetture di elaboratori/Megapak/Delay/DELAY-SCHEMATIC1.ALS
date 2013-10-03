.ALIASES
_   Delay(Signal=N00240 ck=N00049 D0=$D_HI D1=$D_LO D2=$D_LO D3=$D_LO
+  out=N00064 )
X_Delay_U1B          Delay.U1B(A=$D_LO Y=Delay_N01828 VCC=$G_DPWR GND=$G_DGND )
X_Delay_U1A          Delay.U1A(A=$D_LO Y=Delay_N01830 VCC=$G_DPWR GND=$G_DGND )
X_Delay_U3A          Delay.U3A(CLRbar=Delay_N00893 D=$D_HI CLK=N00240
+  PREbar=$D_HI Q=Delay_N00086 Qbar=M_UN0001 VCC=$G_DPWR GND=$G_DGND )
X_Delay_U3B          Delay.U3B(CLRbar=$D_HI D=Delay_N00086 CLK=N00049
+  PREbar=$D_HI Q=Delay_N01424 Qbar=M_UN0002 VCC=$G_DPWR GND=$G_DGND )
X_Delay_U1D          Delay.U1D(A=$D_HI Y=Delay_N02668 VCC=$G_DPWR GND=$G_DGND )
X_Delay_U4A          Delay.U4A(A=Delay_N00086 B=Delay_N01424 Y=Delay_N00539
+  VCC=$G_DPWR GND=$G_DGND )
X_Delay_U2          Delay.U2(CLK=N00049 ENP=Delay_N00086 ENT=$D_HI CLRbar=$D_HI
+  LOADbar=Delay_N00539 A=Delay_N02668 B=Delay_N02674 C=Delay_N01828
+  D=Delay_N01830 QA=M_UN0003 QB=M_UN0004 QC=M_UN0005 QD=M_UN0006 RCO=N00064
+  VCC=$G_DPWR GND=$G_DGND )
X_Delay_U1E          Delay.U1E(A=N00064 Y=Delay_N00893 VCC=$G_DPWR GND=$G_DGND
+  )
X_Delay_U1C          Delay.U1C(A=$D_LO Y=Delay_N02674 VCC=$G_DPWR GND=$G_DGND )
_    _(Delay.out=N00064)
_    _(Delay.ck=N00049)
_    _(Delay.Signal=N00240)
_    _(Delay.D2=$D_LO)
_    _(D2=$D_LO)
_    _(Delay.D3=$D_LO)
_    _(D3=$D_LO)
_    _(Delay.D1=$D_LO)
_    _(D1=$D_LO)
_    _(Delay.D0=$D_HI)
_    _(D0=$D_HI)
U_DSTM2          DSTM2(VCC=$G_DPWR GND=$G_DGND 1=N00049 )
U_DSTM1          DSTM1(pin1=N00240 )
_    _(GND=GND)
_    _(VCC=VCC)
.ENDALIASES
