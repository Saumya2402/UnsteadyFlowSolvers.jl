push!(LOAD_PATH,"../../src/")
import UNSflow

c = 0.027

u = 10.

AR = 28.14814814814815 

data = JLD.load("data.jld", "data")

alphadef = UNSflow.ConstDef(1.)

hdef = UNSflow.ConstDef(0.)

udef = UNSflow.ConstDef(1.)

full_kinem = UNSflow.KinemDef(alphadef, hdef, udef)

pvt = 0.5

geometry = "FlatPlate"

lespcrit = [0.02;]

#surf = UNSflow.ThreeDSurfSimple(AR, full_kinem, geometry, pvt, lespcrit, nspan=10, cref=c, uref=u)

#curfield = UNSflow.ThreeDFieldSimple()

eta = zeros(4)
etad = zeros(4)
#kinem = UNSflow.KinemCantilever(eta, etad)

dtstar = 0.015

nsteps = 40000

t_tot = nsteps*dtstar*c/u

startflag = 1

writeflag = 1

writeInterval = t_tot/8.

delvort = UNSflow.delSpalart(500, 12, 1e-5)
#delvort = UNSflow.delNone()

mat, surf, curfield = UNSflow.stripCantilever(surf, curfield, data, kinem, nsteps, dtstar,startflag, writeflag, writeInterval, delvort)

#UNSflow.makeVortPlots3D()

#UNSflow.makeForcePlots3D()

#UNSflow.makeInfoPlots3D()

UNSflow.cleanWrite()