# RUN: 		 llvm-mc %s -triple=riscv64 -riscv-no-aliases -show-encoding  | FileCheck %s -check-prefix=CHECK-XBGAS


# CHECK-XBGAS:  eld	a0, 1(a1)               	# encoding: [0x77,0xb5,0x15,0x00]
# CHECK-XBGAS:	elw	a0, 1(a1)               	# encoding: [0x77,0xa5,0x15,0x00]
# CHECK-XBGAS:	elh	a0, 1(a1)               	# encoding: [0x77,0x95,0x15,0x00]
# CHECK-XBGAS:	elhu	a0, 1(a1)               # encoding: [0x77,0xd5,0x15,0x00]
# CHECK-XBGAS:	elb	a0, 1(a1)               	# encoding: [0x77,0x85,0x15,0x00]
# CHECK-XBGAS:	elbu	a0, 1(a1)               # encoding: [0x77,0xc5,0x15,0x00]
# CHECK-XBGAS:	esd	a0, 0(a1)               	# encoding: [0x7b,0xb0,0xa5,0x00]
# CHECK-XBGAS:	esw	a0, 0(a1)               	# encoding: [0x7b,0xa0,0xa5,0x00]
# CHECK-XBGAS:	esh	a0, 0(a1)               	# encoding: [0x7b,0x90,0xa5,0x00]
# CHECK-XBGAS:	esb	a0, 0(a1)               	# encoding: [0x7b,0x80,0xa5,0x00]
# CHECK-XBGAS:	elq	a0, 0(a1)               	# encoding: [0x77,0xe5,0x05,0x00]
# CHECK-XBGAS:	ele	ext30, 0(a1)            	# encoding: [0x77,0xff,0x05,0x00]
# CHECK-XBGAS:	esq	a0, 0(a1)               	# encoding: [0x7b,0xc0,0xa5,0x00]
# CHECK-XBGAS:	ese	ext11, 0(a1)            	# encoding: [0x7b,0xd0,0xb5,0x00]

# CHECK-XBGAS:	erld	a0, a1, ext11           # encoding: [0x33,0xb5,0xb5,0xaa]
# CHECK-XBGAS:	erlw	a0, a1, ext12           # encoding: [0x33,0xa5,0xc5,0xaa]
# CHECK-XBGAS:	erlh	a0, a1, ext13           # encoding: [0x33,0x95,0xd5,0xaa]
# CHECK-XBGAS:	erlhu	a0, a1, ext14           # encoding: [0x33,0xd5,0xe5,0xaa]
# CHECK-XBGAS:	erlb	a0, a1, ext15           # encoding: [0x33,0x85,0xf5,0xaa]
# CHECK-XBGAS:	erlbu	a0, a1, ext16           # encoding: [0x33,0xc5,0x05,0xab]
# CHECK-XBGAS:	erle	ext29, a1, ext17        # encoding: [0xb3,0xce,0x15,0x43]
# CHECK-XBGAS:	ersd	ext18, a0, a1           # encoding: [0x33,0x39,0xb5,0x44]
# CHECK-XBGAS:	ersw	ext19, a0, a1           # encoding: [0xb3,0x29,0xb5,0x44]
# CHECK-XBGAS:	ersh	ext20, a0, a1           # encoding: [0x33,0x1a,0xb5,0x44]
# CHECK-XBGAS:	ersb	ext21, a0, a1           # encoding: [0xb3,0x0a,0xb5,0x44]

# CHECK-XBGAS:	eaddi	  a0, ext30, 128        # encoding: [0x7b,0x60,0xaf,0x08]
# CHECK-XBGAS:	eaddie	ext23, a1, 128        # encoding: [0x7b,0xf0,0x75,0x09]
# CHECK-XBGAS:	eaddix	ext24, ext25, 128     # encoding: [0x03,0xf0,0x8c,0x09]



#-- xBGAS Integer Load/Store Inst 
eld 	x10, 1(x11)
elw 	x10, 1(x11)
elh 	x10, 1(x11)
elhu  x10, 1(x11)
elb 	x10, 1(x11)
elbu  x10, 1(x11)
esd 	x10, 0(x11)
esw 	x10, 0(x11)
esh 	x10, 0(x11)
esb 	x10, 0(x11)
elq 	x10, 0(x11)
ele 	e30, 0(x11)
esq 	x10, 0(x11)
ese 	e11, 0(x11)

#-- xBGAS Raw Integer Load/Store Inst
erld  x10, x11, e11
erlw  x10, x11, e12
erlh  x10, x11, e13
erlhu x10, x11, e14
erlb  x10, x11, e15
erlbu x10, x11, e16
erle  e29, x11, e17
ersd  e18, x10, x11
ersw  e19, x10, x11
ersh  e20, x10, x11
ersb  e21, x10, x11

#-- xBGAS Address Management Inst
eaddi   x10,  e30, 128
eaddie  e23,  x11, 128
eaddix  e24,  e25, 128


#-- EOF

