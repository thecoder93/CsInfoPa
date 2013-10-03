.ALIASES
_   encoder(X0=X0 X1=X1 X2=X2 X3=X3 CSin=$D_HI CSout=T2 Y0=N07307 Y1=N08048 )
X_encoder_U7A          encoder.U7A(A=X0 B=$D_HI C=$D_HI D=$D_HI
+  Y=encoder_N01004 VCC=$G_DPWR GND=$G_DGND )
X_encoder_U7B          encoder.U7B(A=X1 B=encoder_N00472 C=$D_HI D=$D_HI
+  Y=encoder_N01007 VCC=$G_DPWR GND=$G_DGND )
X_encoder_U10A          encoder.U10A(A=X2 B=encoder_N00472 C=encoder_N00475
+  D=$D_HI Y=encoder_N01017 VCC=$G_DPWR GND=$G_DGND )
X_encoder_U4C          encoder.U4C(A=encoder_N009388 Y=T2 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_U4B          encoder.U4B(A=X0 Y=encoder_N00472 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_U4D          encoder.U4D(A=X1 Y=encoder_N00475 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_U4E          encoder.U4E(A=X2 Y=encoder_N00478 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_U11          encoder.U11(A=encoder_N00472 B=encoder_N00475
+  C=encoder_N00478 D=X3 E=$D_HI F=$D_HI G=$D_HI H=$D_HI Y=encoder_N01030
+  VCC=$G_DPWR GND=$G_DGND )
X_encoder_U9A          encoder.U9A(A=encoder_N01007 B=encoder_N01030 Y=N07307
+  VCC=$G_DPWR GND=$G_DGND )
X_encoder_U9B          encoder.U9B(A=encoder_N01017 B=encoder_N01030 Y=N08048
+  VCC=$G_DPWR GND=$G_DGND )
X_encoder_U8          encoder.U8(A=$D_HI B=encoder_N01004 C=encoder_N01007
+  D=encoder_N01017 E=encoder_N01030 F=$D_HI G=$D_HI H=$D_HI Y=encoder_N009388
+  VCC=$G_DPWR GND=$G_DGND )
_    _(encoder.X1=X1)
_    _(encoder.Y0=N07307)
_    _(encoder.X0=X0)
_    _(encoder.X3=X3)
_    _(encoder.CSin=$D_HI)
_    _(CSin=$D_HI)
_    _(encoder.X2=X2)
_    _(encoder.CSout=T2)
_    _(encoder.Y1=N08048)
U_DSTM7          DSTM7(pin1=X5 )
X_U1B           U1B(A=N08048 Gbar=T2 Y=T1 VCC=$G_DPWR GND=$G_DGND )
U_DSTM5          DSTM5(pin1=X7 )
X_U5            U5(IN0=$D_HI IN1=$D_HI IN2=$D_HI IN3=$D_HI IN4=$D_LO IN5=$D_HI
+  IN6=$D_HI IN7=$D_HI EI=$D_LO A0=N31009 A1=N31017 A2=N31029 GS=N31058 EO=N30660
+  VCC=$G_DPWR GND=$G_DGND )
X_U6            U6(IN0=$D_HI IN1=$D_HI IN2=$D_HI IN3=$D_HI IN4=$D_HI IN5=$D_HI
+  IN6=$D_HI IN7=$D_HI EI=N30660 A0=N30991 A1=N31023 A2=N31035 GS=N31052 EO=EO
+  VCC=$G_DPWR GND=$G_DGND )
X_U2B           U2B(A=A3_946 G=T2 Y=T1 VCC=$G_DPWR GND=$G_DGND )
U_DSTM3          DSTM3(pin1=X1 )
U_DSTM9          DSTM9(pin1=I3 )
U_DSTM4          DSTM4(VCC=$G_DPWR GND=$G_DGND 1=X0 )
U_DSTM2          DSTM2(pin1=X2 )
U_DSTM1          DSTM1(pin1=X3 )
X_U1A           U1A(A=N07307 Gbar=T2 Y=T0 VCC=$G_DPWR GND=$G_DGND )
_   Encoder8(X0=I0 X1=I1 X2=I2 X3=I3 X4=I4 X5=I5 X6=I6 X7=I7 CSin=$D_HI
+  CSout=OUT3 Y0=IC10 Y1=IC11 Y2=IC12 )
_   Encoder8.encoder(X0=X0 X1=X1 X2=X2 X3=X3 CSin=$D_HI CSout=IC12
+  Y0=Encoder8_N07307 Y1=Encoder8_N08048 )
X_Encoder8_encoder_U7A          Encoder8.encoder.U7A(A=$D_LO B=$D_HI C=$D_HI
+  D=$D_HI Y=Encoder8_encoder_N01004 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U7B          Encoder8.encoder.U7B(A=$D_LO
+  B=Encoder8_encoder_N00472 C=$D_HI D=$D_HI Y=Encoder8_encoder_N01007
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U10A          Encoder8.encoder.U10A(A=$D_LO
+  B=Encoder8_encoder_N00472 C=Encoder8_encoder_N00475 D=$D_HI
+  Y=Encoder8_encoder_N01017 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U4C          Encoder8.encoder.U4C(A=Encoder8_encoder_N009388
+  Y=IC12 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U4B          Encoder8.encoder.U4B(A=$D_LO
+  Y=Encoder8_encoder_N00472 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U4D          Encoder8.encoder.U4D(A=$D_LO
+  Y=Encoder8_encoder_N00475 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U4E          Encoder8.encoder.U4E(A=$D_LO
+  Y=Encoder8_encoder_N00478 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U11          Encoder8.encoder.U11(A=Encoder8_encoder_N00472
+  B=Encoder8_encoder_N00475 C=Encoder8_encoder_N00478 D=I3 E=$D_HI F=$D_HI
+  G=$D_HI H=$D_HI Y=Encoder8_encoder_N01030 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U9A          Encoder8.encoder.U9A(A=Encoder8_encoder_N01007
+  B=Encoder8_encoder_N01030 Y=Encoder8_N07307 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U9B          Encoder8.encoder.U9B(A=Encoder8_encoder_N01017
+  B=Encoder8_encoder_N01030 Y=Encoder8_N08048 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_U8          Encoder8.encoder.U8(A=$D_HI
+  B=Encoder8_encoder_N01004 C=Encoder8_encoder_N01007 D=Encoder8_encoder_N01017
+  E=Encoder8_encoder_N01030 F=$D_HI G=$D_HI H=$D_HI Y=Encoder8_encoder_N009388
+  VCC=$G_DPWR GND=$G_DGND )
_    _(Encoder8.encoder.X1=$D_LO)
_    _(X1=$D_LO)
_    _(Encoder8.encoder.Y0=Encoder8_N07307)
_    _(Encoder8.encoder.X0=$D_LO)
_    _(X0=$D_LO)
_    _(Encoder8.encoder.X3=I3)
_    _(Encoder8.encoder.CSin=$D_HI)
_    _(CSin=$D_HI)
_    _(Encoder8.encoder.X2=$D_LO)
_    _(X2=$D_LO)
_    _(Encoder8.encoder.CSout=IC12)
_    _(Encoder8.encoder.Y1=Encoder8_N08048)
X_Encoder8_U1D          Encoder8.U1D(A=Encoder8_N08048 Gbar=IC12 Y=IC11
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_U2D          Encoder8.U2D(A=Encoder8_A3 G=IC12 Y=IC11 VCC=$G_DPWR
+  GND=$G_DGND )
X_Encoder8_U1C          Encoder8.U1C(A=Encoder8_N07307 Gbar=IC12 Y=IC10
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_U2C          Encoder8.U2C(A=Encoder8_A2 G=IC12 Y=IC10 VCC=$G_DPWR
+  GND=$G_DGND )
_   Encoder8.encoder_1(X0=X4 X1=X5 X2=X6 X3=X7 CSin=IC12 CSout=OUT3
+  Y0=Encoder8_A2 Y1=Encoder8_A3 )
X_Encoder8_encoder_1_U7A          Encoder8.encoder_1.U7A(A=$D_LO B=$D_HI
+  C=$D_HI D=IC12 Y=Encoder8_encoder_1_N01004 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U7B          Encoder8.encoder_1.U7B(A=$D_LO
+  B=Encoder8_encoder_1_N00472 C=$D_HI D=IC12 Y=Encoder8_encoder_1_N01007
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U10A          Encoder8.encoder_1.U10A(A=$D_LO
+  B=Encoder8_encoder_1_N00472 C=Encoder8_encoder_1_N00475 D=IC12
+  Y=Encoder8_encoder_1_N01017 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U4C         
+  Encoder8.encoder_1.U4C(A=Encoder8_encoder_1_N009388 Y=OUT3 VCC=$G_DPWR
+  GND=$G_DGND )
X_Encoder8_encoder_1_U4B          Encoder8.encoder_1.U4B(A=$D_LO
+  Y=Encoder8_encoder_1_N00472 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U4D          Encoder8.encoder_1.U4D(A=$D_LO
+  Y=Encoder8_encoder_1_N00475 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U4E          Encoder8.encoder_1.U4E(A=$D_LO
+  Y=Encoder8_encoder_1_N00478 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U11         
+  Encoder8.encoder_1.U11(A=Encoder8_encoder_1_N00472 B=Encoder8_encoder_1_N00475
+  C=Encoder8_encoder_1_N00478 D=$D_HI E=$D_HI F=$D_HI G=$D_HI H=IC12
+  Y=Encoder8_encoder_1_N01030 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U9A         
+  Encoder8.encoder_1.U9A(A=Encoder8_encoder_1_N01007 B=Encoder8_encoder_1_N01030
+  Y=Encoder8_A2 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U9B         
+  Encoder8.encoder_1.U9B(A=Encoder8_encoder_1_N01017 B=Encoder8_encoder_1_N01030
+  Y=Encoder8_A3 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_encoder_1_U8          Encoder8.encoder_1.U8(A=IC12
+  B=Encoder8_encoder_1_N01004 C=Encoder8_encoder_1_N01007
+  D=Encoder8_encoder_1_N01017 E=Encoder8_encoder_1_N01030 F=$D_HI G=$D_HI
+  H=$D_HI Y=Encoder8_encoder_1_N009388 VCC=$G_DPWR GND=$G_DGND )
_    _(Encoder8.encoder_1.X1=$D_LO)
_    _(X1=$D_LO)
_    _(Encoder8.encoder_1.Y0=Encoder8_A2)
_    _(Encoder8.encoder_1.X0=$D_LO)
_    _(X0=$D_LO)
_    _(Encoder8.encoder_1.X3=$D_HI)
_    _(X3=$D_HI)
_    _(Encoder8.encoder_1.CSin=IC12)
_    _(Encoder8.encoder_1.X2=$D_LO)
_    _(X2=$D_LO)
_    _(Encoder8.encoder_1.CSout=OUT3)
_    _(Encoder8.encoder_1.Y1=Encoder8_A3)
_    _(Encoder8.CSout=OUT3)
_    _(Encoder8.CSin=$D_HI)
_    _(CSin=$D_HI)
_    _(Encoder8.X0=$D_LO)
_    _(X0=$D_LO)
_    _(Encoder8.x0=$D_LO)
_    _(x0=$D_LO)
_    _(Encoder8.X3=I3)
_    _(Encoder8.x3=I3)
_    _(Encoder8.X5=$D_LO)
_    _(X5=$D_LO)
_    _(Encoder8.x5=$D_LO)
_    _(x5=$D_LO)
_    _(Encoder8.X2=$D_LO)
_    _(X2=$D_LO)
_    _(Encoder8.x2=$D_LO)
_    _(x2=$D_LO)
_    _(Encoder8.X1=$D_LO)
_    _(X1=$D_LO)
_    _(Encoder8.x1=$D_LO)
_    _(x1=$D_LO)
_    _(Encoder8.X7=$D_HI)
_    _(X7=$D_HI)
_    _(Encoder8.x7=$D_HI)
_    _(x7=$D_HI)
_    _(Encoder8.X4=$D_LO)
_    _(X4=$D_LO)
_    _(Encoder8.x4=$D_LO)
_    _(x4=$D_LO)
_    _(Encoder8.X6=$D_LO)
_    _(X6=$D_LO)
_    _(Encoder8.x6=$D_LO)
_    _(x6=$D_LO)
_    _(Encoder8.A3=Encoder8_A3)
_    _(Encoder8.A2=Encoder8_A2)
_    _(Encoder8.Y1=IC11)
_    _(Encoder8.T1=IC11)
_    _(Encoder8.Y2=IC12)
_    _(Encoder8.T2=IC12)
_    _(Encoder8.Y0=IC10)
_    _(Encoder8.T0=IC10)
X_U3A           U3A(A=N31009 B=N30991 Y=A0 VCC=$G_DPWR GND=$G_DGND )
X_U3B           U3B(A=N31017 B=N31023 Y=A1 VCC=$G_DPWR GND=$G_DGND )
X_U2A           U2A(A=A2_946 G=T2 Y=T0 VCC=$G_DPWR GND=$G_DGND )
X_U3C           U3C(A=N31029 B=N31035 Y=A2 VCC=$G_DPWR GND=$G_DGND )
X_U3D           U3D(A=N31058 B=N31052 Y=GS VCC=$G_DPWR GND=$G_DGND )
X_U4A           U4A(A=N30660 Y=A3 VCC=$G_DPWR GND=$G_DGND )
_   Encoder8_1(X0=I8 X1=I9 X2=I10 X3=I11 X4=I12 X5=I13 X6=I14 X7=I15 CSin=OUT3
+  CSout=N28840 Y0=IC20 Y1=IC21 Y2=IC22 )
_   Encoder8_1.encoder(X0=X0 X1=X1 X2=X2 X3=X3 CSin=OUT3 CSout=IC22
+  Y0=Encoder8_1_N07307 Y1=Encoder8_1_N08048 )
X_Encoder8_1_encoder_U7A          Encoder8_1.encoder.U7A(A=$D_HI B=$D_HI
+  C=$D_HI D=OUT3 Y=Encoder8_1_encoder_N01004 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U7B          Encoder8_1.encoder.U7B(A=$D_LO
+  B=Encoder8_1_encoder_N00472 C=$D_HI D=OUT3 Y=Encoder8_1_encoder_N01007
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U10A          Encoder8_1.encoder.U10A(A=$D_HI
+  B=Encoder8_1_encoder_N00472 C=Encoder8_1_encoder_N00475 D=OUT3
+  Y=Encoder8_1_encoder_N01017 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U4C         
+  Encoder8_1.encoder.U4C(A=Encoder8_1_encoder_N009388 Y=IC22 VCC=$G_DPWR
+  GND=$G_DGND )
X_Encoder8_1_encoder_U4B          Encoder8_1.encoder.U4B(A=$D_HI
+  Y=Encoder8_1_encoder_N00472 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U4D          Encoder8_1.encoder.U4D(A=$D_LO
+  Y=Encoder8_1_encoder_N00475 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U4E          Encoder8_1.encoder.U4E(A=$D_HI
+  Y=Encoder8_1_encoder_N00478 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U11         
+  Encoder8_1.encoder.U11(A=Encoder8_1_encoder_N00472 B=Encoder8_1_encoder_N00475
+  C=Encoder8_1_encoder_N00478 D=$D_HI E=$D_HI F=$D_HI G=$D_HI H=OUT3
+  Y=Encoder8_1_encoder_N01030 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U9A         
+  Encoder8_1.encoder.U9A(A=Encoder8_1_encoder_N01007 B=Encoder8_1_encoder_N01030
+  Y=Encoder8_1_N07307 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U9B         
+  Encoder8_1.encoder.U9B(A=Encoder8_1_encoder_N01017 B=Encoder8_1_encoder_N01030
+  Y=Encoder8_1_N08048 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_U8          Encoder8_1.encoder.U8(A=OUT3
+  B=Encoder8_1_encoder_N01004 C=Encoder8_1_encoder_N01007
+  D=Encoder8_1_encoder_N01017 E=Encoder8_1_encoder_N01030 F=$D_HI G=$D_HI
+  H=$D_HI Y=Encoder8_1_encoder_N009388 VCC=$G_DPWR GND=$G_DGND )
_    _(Encoder8_1.encoder.X1=$D_LO)
_    _(X1=$D_LO)
_    _(Encoder8_1.encoder.Y0=Encoder8_1_N07307)
_    _(Encoder8_1.encoder.X0=$D_HI)
_    _(X0=$D_HI)
_    _(Encoder8_1.encoder.X3=$D_HI)
_    _(X3=$D_HI)
_    _(Encoder8_1.encoder.CSin=OUT3)
_    _(Encoder8_1.encoder.X2=$D_HI)
_    _(X2=$D_HI)
_    _(Encoder8_1.encoder.CSout=IC22)
_    _(Encoder8_1.encoder.Y1=Encoder8_1_N08048)
X_Encoder8_1_U1D          Encoder8_1.U1D(A=Encoder8_1_N08048 Gbar=IC22 Y=IC21
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_U2D          Encoder8_1.U2D(A=Encoder8_1_A3 G=IC22 Y=IC21
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_U1C          Encoder8_1.U1C(A=Encoder8_1_N07307 Gbar=IC22 Y=IC20
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_U2C          Encoder8_1.U2C(A=Encoder8_1_A2 G=IC22 Y=IC20
+  VCC=$G_DPWR GND=$G_DGND )
_   Encoder8_1.encoder_1(X0=X4 X1=X5 X2=X6 X3=X7 CSin=IC22 CSout=N28840
+  Y0=Encoder8_1_A2 Y1=Encoder8_1_A3 )
X_Encoder8_1_encoder_1_U7A          Encoder8_1.encoder_1.U7A(A=$D_LO B=$D_HI
+  C=$D_HI D=IC22 Y=Encoder8_1_encoder_1_N01004 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U7B          Encoder8_1.encoder_1.U7B(A=$D_LO
+  B=Encoder8_1_encoder_1_N00472 C=$D_HI D=IC22 Y=Encoder8_1_encoder_1_N01007
+  VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U10A          Encoder8_1.encoder_1.U10A(A=$D_LO
+  B=Encoder8_1_encoder_1_N00472 C=Encoder8_1_encoder_1_N00475 D=IC22
+  Y=Encoder8_1_encoder_1_N01017 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U4C         
+  Encoder8_1.encoder_1.U4C(A=Encoder8_1_encoder_1_N009388 Y=N28840 VCC=$G_DPWR
+  GND=$G_DGND )
X_Encoder8_1_encoder_1_U4B          Encoder8_1.encoder_1.U4B(A=$D_LO
+  Y=Encoder8_1_encoder_1_N00472 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U4D          Encoder8_1.encoder_1.U4D(A=$D_LO
+  Y=Encoder8_1_encoder_1_N00475 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U4E          Encoder8_1.encoder_1.U4E(A=$D_LO
+  Y=Encoder8_1_encoder_1_N00478 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U11         
+  Encoder8_1.encoder_1.U11(A=Encoder8_1_encoder_1_N00472
+  B=Encoder8_1_encoder_1_N00475 C=Encoder8_1_encoder_1_N00478 D=$D_HI E=$D_HI
+  F=$D_HI G=$D_HI H=IC22 Y=Encoder8_1_encoder_1_N01030 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U9A         
+  Encoder8_1.encoder_1.U9A(A=Encoder8_1_encoder_1_N01007
+  B=Encoder8_1_encoder_1_N01030 Y=Encoder8_1_A2 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U9B         
+  Encoder8_1.encoder_1.U9B(A=Encoder8_1_encoder_1_N01017
+  B=Encoder8_1_encoder_1_N01030 Y=Encoder8_1_A3 VCC=$G_DPWR GND=$G_DGND )
X_Encoder8_1_encoder_1_U8          Encoder8_1.encoder_1.U8(A=IC22
+  B=Encoder8_1_encoder_1_N01004 C=Encoder8_1_encoder_1_N01007
+  D=Encoder8_1_encoder_1_N01017 E=Encoder8_1_encoder_1_N01030 F=$D_HI G=$D_HI
+  H=$D_HI Y=Encoder8_1_encoder_1_N009388 VCC=$G_DPWR GND=$G_DGND )
_    _(Encoder8_1.encoder_1.X1=$D_LO)
_    _(X1=$D_LO)
_    _(Encoder8_1.encoder_1.Y0=Encoder8_1_A2)
_    _(Encoder8_1.encoder_1.X0=$D_LO)
_    _(X0=$D_LO)
_    _(Encoder8_1.encoder_1.X3=$D_HI)
_    _(X3=$D_HI)
_    _(Encoder8_1.encoder_1.CSin=IC22)
_    _(Encoder8_1.encoder_1.X2=$D_LO)
_    _(X2=$D_LO)
_    _(Encoder8_1.encoder_1.CSout=N28840)
_    _(Encoder8_1.encoder_1.Y1=Encoder8_1_A3)
_    _(Encoder8_1.CSout=N28840)
_    _(Encoder8_1.CSin=OUT3)
_    _(Encoder8_1.X0=$D_HI)
_    _(X0=$D_HI)
_    _(Encoder8_1.x0=$D_HI)
_    _(x0=$D_HI)
_    _(Encoder8_1.X3=$D_HI)
_    _(X3=$D_HI)
_    _(Encoder8_1.x3=$D_HI)
_    _(x3=$D_HI)
_    _(Encoder8_1.X5=$D_LO)
_    _(X5=$D_LO)
_    _(Encoder8_1.x5=$D_LO)
_    _(x5=$D_LO)
_    _(Encoder8_1.X2=$D_HI)
_    _(X2=$D_HI)
_    _(Encoder8_1.x2=$D_HI)
_    _(x2=$D_HI)
_    _(Encoder8_1.X1=$D_LO)
_    _(X1=$D_LO)
_    _(Encoder8_1.x1=$D_LO)
_    _(x1=$D_LO)
_    _(Encoder8_1.X7=$D_HI)
_    _(X7=$D_HI)
_    _(Encoder8_1.x7=$D_HI)
_    _(x7=$D_HI)
_    _(Encoder8_1.X4=$D_LO)
_    _(X4=$D_LO)
_    _(Encoder8_1.x4=$D_LO)
_    _(x4=$D_LO)
_    _(Encoder8_1.X6=$D_LO)
_    _(X6=$D_LO)
_    _(Encoder8_1.x6=$D_LO)
_    _(x6=$D_LO)
_    _(Encoder8_1.A3=Encoder8_1_A3)
_    _(Encoder8_1.A2=Encoder8_1_A2)
_    _(Encoder8_1.Y1=IC21)
_    _(Encoder8_1.T1=IC21)
_    _(Encoder8_1.Y2=IC22)
_    _(Encoder8_1.T2=IC22)
_    _(Encoder8_1.Y0=IC20)
_    _(Encoder8_1.T0=IC20)
_   Join(A0=IC10 A1=IC11 A2=IC12 B0=IC20 B1=IC21 B2=IC22 sel=OUT3 E0=OUT0
+  E1=OUT1 E2=OUT2 E3=OUT3 )
X_Join_U13A          Join.U13A(A=IC10 Gbar=OUT3 Y=OUT0 VCC=$G_DPWR GND=$G_DGND
+  )
X_Join_U12A          Join.U12A(A=IC20 G=OUT3 Y=OUT0 VCC=$G_DPWR GND=$G_DGND )
X_Join_U12B          Join.U12B(A=IC21 G=OUT3 Y=OUT1 VCC=$G_DPWR GND=$G_DGND )
X_Join_U13B          Join.U13B(A=IC11 Gbar=OUT3 Y=OUT1 VCC=$G_DPWR GND=$G_DGND
+  )
X_Join_U12C          Join.U12C(A=IC22 G=OUT3 Y=OUT2 VCC=$G_DPWR GND=$G_DGND )
X_Join_U13C          Join.U13C(A=IC12 Gbar=OUT3 Y=OUT2 VCC=$G_DPWR GND=$G_DGND
+  )
_    _(Join.B0=IC20)
_    _(Join.A1=IC11)
_    _(Join.A0=IC10)
_    _(Join.B1=IC21)
_    _(Join.A2=IC12)
_    _(Join.B2=IC22)
_    _(Join.E2=OUT2)
_    _(Join.sel=OUT3)
_    _(Join.E3=OUT3)
_    _(Join.E1=OUT1)
_    _(Join.E0=OUT0)
U_DSTM6          DSTM6(pin1=X6 )
_   encoder_1(X0=X4 X1=X5 X2=X6 X3=X7 CSin=T2 CSout=VALIDBAR Y0=A2_946
+  Y1=A3_946 )
X_encoder_1_U7A          encoder_1.U7A(A=X4 B=$D_HI C=$D_HI D=T2
+  Y=encoder_1_N01004 VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U7B          encoder_1.U7B(A=X5 B=encoder_1_N00472 C=$D_HI D=T2
+  Y=encoder_1_N01007 VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U10A          encoder_1.U10A(A=X6 B=encoder_1_N00472
+  C=encoder_1_N00475 D=T2 Y=encoder_1_N01017 VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U4C          encoder_1.U4C(A=encoder_1_N009388 Y=VALIDBAR
+  VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U4B          encoder_1.U4B(A=X4 Y=encoder_1_N00472 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_1_U4D          encoder_1.U4D(A=X5 Y=encoder_1_N00475 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_1_U4E          encoder_1.U4E(A=X6 Y=encoder_1_N00478 VCC=$G_DPWR
+  GND=$G_DGND )
X_encoder_1_U11          encoder_1.U11(A=encoder_1_N00472 B=encoder_1_N00475
+  C=encoder_1_N00478 D=X7 E=$D_HI F=$D_HI G=$D_HI H=T2 Y=encoder_1_N01030
+  VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U9A          encoder_1.U9A(A=encoder_1_N01007 B=encoder_1_N01030
+  Y=A2_946 VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U9B          encoder_1.U9B(A=encoder_1_N01017 B=encoder_1_N01030
+  Y=A3_946 VCC=$G_DPWR GND=$G_DGND )
X_encoder_1_U8          encoder_1.U8(A=T2 B=encoder_1_N01004 C=encoder_1_N01007
+  D=encoder_1_N01017 E=encoder_1_N01030 F=$D_HI G=$D_HI H=$D_HI
+  Y=encoder_1_N009388 VCC=$G_DPWR GND=$G_DGND )
_    _(encoder_1.X1=X5)
_    _(encoder_1.Y0=A2_946)
_    _(encoder_1.X0=X4)
_    _(encoder_1.X3=X7)
_    _(encoder_1.CSin=T2)
_    _(encoder_1.X2=X6)
_    _(encoder_1.CSout=VALIDBAR)
_    _(encoder_1.Y1=A3_946)
U_DSTM8          DSTM8(pin1=X4 )
_    _(A3=A3_946)
_    _(A2=A2_946)
_    _(A0=A0)
_    _(A1=A1)
_    _(EO=EO)
_    _(GS=GS)
_    _(I1=$D_LO)
_    _(I5=$D_LO)
_    _(I2=$D_LO)
_    _(I14=$D_LO)
_    _(I6=$D_LO)
_    _(I9=$D_LO)
_    _(I0=$D_LO)
_    _(I13=$D_LO)
_    _(I4=$D_LO)
_    _(I12=$D_LO)
_    _(I3=I3)
_    _(I15=$D_HI)
_    _(I10=$D_HI)
_    _(I11=$D_HI)
_    _(I7=$D_HI)
_    _(I8=$D_HI)
_    _(validBAR=VALIDBAR)
_    _(A2=A2)
_    _(T2=T2)
_    _(T1=T1)
_    _(T0=T0)
_    _(x0=X0)
_    _(x1=X1)
_    _(x5=X5)
_    _(x3=X3)
_    _(A3=A3)
_    _(x2=X2)
_    _(x6=X6)
_    _(x4=X4)
_    _(x7=X7)
_    _(VCC=VCC)
_    _(GND=GND)
.ENDALIASES
