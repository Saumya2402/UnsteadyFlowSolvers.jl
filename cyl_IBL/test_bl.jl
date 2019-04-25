push!(LOAD_PATH,"../src/")
using UnsteadyFlowSolvers

# function run_bl(t :: Float64, tTot::Float64, w::Array{Float64,2}, u::Array{Float64,1}, ut::Array{Float64,1}, ux::Array{Float64,1}, x::Array{Float64,1})

#     n = length(x)
#     w = zeros(n,2)

#     while t < tTot

#         w, dt, lamb1, lamb2 =  FVMIBLorig(w0, u, ut, ux, x)

#         w0 = w

#         t += dt
#     end

#     return x, w, t
# end

ncell = 200
#x = collect(range(1e-6, stop=1-1e-6, length=ncell))

theta = collect(range(1e-6, stop=pi-1e-6, length=ncell))
x = 1/2*(1 .- cos.(theta))*pi
#x = collect(range(1e-6, stop=pi-1e-6, length=ncell))

#theta = acos.(2*x .- 1)

#u = 2*sin.(theta)
u = 2*sin.(x)
#ux = 2*cos.(theta)
ux = 2*cos.(x)
ut = zeros(length(ncell))

del, _, E, _ = initDelE(ncell)
w0 = zeros(ncell,2)
w0[:,1] = del[:]
w0[:,2] = del[:].*(E[:] .+ 1)

t = 0.
t_tot = 1.4

x, w, t = FVMIBLgrid(w0, u, ut, ux, x, t, t_tot)

#while t < t_tot

#end


